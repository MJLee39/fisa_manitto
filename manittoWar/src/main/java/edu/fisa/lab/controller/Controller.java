package edu.fisa.lab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;
import edu.fisa.lab.service.MainService;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	MainService service;
	
	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String loginCheck(String userId, String userPw, HttpSession session, Model model) throws Exception {
		System.out.println("------ " + userId);
		boolean isValid = service.isValidUser(userId, userPw);
	
		if(isValid) {
			session.setAttribute("name", userId);
			session.setAttribute("id", service.findId(userId));
			return "redirect:/main.jsp"; 
		}else {	
			model.addAttribute("loginError", true); // 에러 여부를 모델에 추가
			return "redirect:/login.html"; 
		}
		
	}
	
	@RequestMapping(path = "/myManitto", method = RequestMethod.GET)
	public String myManitto(HttpSession session, Model model) {
		long id = (long) session.getAttribute("id");
		String name = (String) session.getAttribute("name");  //내 이름
		
		String myManittoName = service.myNameAndManitto(name);  //내 마니또 이름
		System.out.println("myManittoName: "+myManittoName);
		if(myManittoName != null) {
			model.addAttribute("manitto", myManittoName);
			return "/myManitto"; 
		}else {
			return "/myManitto"; 
		}
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e, Model m) {
		m.addAttribute("errorMsg", "발생된 이슈 " + e.getMessage());
		e.printStackTrace();
		return "forward:showError.jsp";
	}
	
}
