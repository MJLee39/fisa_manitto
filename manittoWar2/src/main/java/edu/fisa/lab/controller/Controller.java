package edu.fisa.lab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import edu.fisa.lab.domain.entity.Board;
import edu.fisa.lab.domain.entity.Student;
import edu.fisa.lab.service.MainService;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	MainService service;
	
	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String loginCheck(String name, String userPw, HttpSession session, Model model) throws Exception {
		boolean isValid = service.isValidUser(name, userPw);
		System.out.println(isValid);
		System.out.println(service.findId(name).getClass().getName());
		if(isValid) {
			session.setAttribute("name", name);
			session.setAttribute("id", service.findId(name));
			session.setAttribute("pw", userPw);
			if ((Long) session.getAttribute("id") == 0L) {
				return "redirect:/admin.html";
			} else {
				return "redirect:/main.jsp";
			}
			
		}else {	
			model.addAttribute("loginError", true); // 에러 여부를 모델에 추가
			return "redirect:/login.html"; 
		}
		
	}
	
	@RequestMapping(path ="/myPage", method = RequestMethod.GET)
	public String goMyPage(HttpSession session, Model model) {
		String myId = (String) session.getAttribute("name");
		String myPw = (String) session.getAttribute("pw");
		model.addAttribute("id",myId);
		model.addAttribute("pw",myPw);
		return "/myPage";
	}
	
	
	
	
	@RequestMapping(path = "/myManitto", method = RequestMethod.GET)
	public String myManitto(HttpSession session, Model model) {
		Long id = (Long) session.getAttribute("id");
		String name = (String) session.getAttribute("name");  //내 이름
		
		Optional<Student> myManitto = service.myNameAndManitto(name);  //내 마니또 이름
		String myManittoName = myManitto.get().getName();
		System.out.println("myManittoName: "+myManittoName);
		if(myManittoName != null) {
			model.addAttribute("manitto", myManittoName);
			return "/myManitto"; 
		}else {
			return "/myManitto"; 
		}
	}
	
	@RequestMapping(path = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("name"); // 이름 정보 삭제
		session.removeAttribute("id"); // ID 정보 삭제
		session.invalidate(); // 세션 무효화
		return "redirect:/login.html";
	}

	@RequestMapping(path = "/readBoard", method = RequestMethod.GET)
	public String readBoard(Model model) {
		List<Board> readBoardList = service.boardFindAll();
		System.out.println(readBoardList);
		if(readBoardList != null) {
			model.addAttribute("readBoard", readBoardList);
			return "/readBoard";
		}else {
			return "/readBoard";
		}
	}
	
	@PostMapping("/changePw")
	@ResponseBody
	public Map<String, Object> changePassword(@RequestBody Map<String, String> requestData) {
		Map<String, Object> response = new HashMap<>();
		try {
            service.changePassword(requestData.get("id"), requestData.get("newPassword"));
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", "비밀번호 변경에 실패했습니다.");
        }
        return response;
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e, Model m) {
		m.addAttribute("errorMsg", "발생된 이슈 " + e.getMessage());
		e.printStackTrace();
		return "forward:showError.jsp";
	}
	
}
