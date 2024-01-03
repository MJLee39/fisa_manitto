package edu.fisa.lab.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.fisa.lab.domain.dto.BoardDTO;
import edu.fisa.lab.domain.entity.Student;
import edu.fisa.lab.service.MainService;
import jakarta.servlet.http.HttpSession;


@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	MainService service;
//	@PostMapping("/createManittoEndpoint")
//	public List<String[]> selectAll (){
//		List<Student> list = service.findAllStudent();
//		return service.createManitto(list);
//	}
//	
//	@PostMapping("/allManittoEndpoint")
//	public List<String[]> readAll (){
//		List<Student> list = service.findAllStudent();
//		return service.readManitto(list);
//	}
	
	@PostMapping("/writeBoard")
	public void writeBoard(BoardDTO insertBoard) throws Exception{
		service.saveBoard(insertBoard);
	}
	
//	@ExceptionHandler
//	public String handler(Exception e) {
//		e.printStackTrace();
//		
//		return null;
//	}
}