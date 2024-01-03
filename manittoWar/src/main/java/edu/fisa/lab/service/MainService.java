package edu.fisa.lab.service;

import java.sql.SQLException;
import java.util.*;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fisa.lab.DAO.BoardDAO;
import edu.fisa.lab.DAO.StudentDAO;
import edu.fisa.lab.domain.dto.BoardDTO;
import edu.fisa.lab.domain.entity.Board;
import edu.fisa.lab.domain.entity.Student;
import edu.fisa.lab.exception.NotExistException;
import edu.fisa.lab.resDto.StudentResDto;



@Service
@Transactional
public class MainService {

	@Autowired
	StudentDAO studentDAO;
	
	@Autowired
	BoardDAO boardDAO;
	
<<<<<<< HEAD
=======
	private ModelMapper mapper = new ModelMapper();
>>>>>>> d8bbbe2a70f47a2cd284444c7c94936361e66b45
	
	public String myNameAndManitto(String name) {
		Student me = studentDAO.findByName(name);
		long targetId = me.getTargetId();
		String targetName = studentDAO.findById(targetId);
		return targetName;
	}
	
	public boolean isValidUser(String userId, String userPw) {
		Student student = studentDAO.findByName(userId);
	    return student != null && student.getPw().equals(userPw);
	}
	
	public long findId(String userId) {
		long id = studentDAO.findIdByName(userId);
		return id;
	}
	
	public List<Board> boardFindAll() {
		return boardDAO.findAll();
	}
	
	public List<Board> boardFindAll() {
		return boardDAO.findAll();
	}
	
	public List<Student> findAllStudent(){
		return studentDAO.findAll();
	}
	
	public List<String[]> readManitto(List<Student> studentList){
		List<String[]> ans = new ArrayList<>();  //내 이름, target 이름 담긴 list
		for(int i=0; i<studentList.size(); i++) {
			String[] str = {studentList.get(i).getName(),studentDAO.findById(studentList.get(i).getTargetId())};
			ans.add(str);
		}
		return ans;
	}
	
	public List<String[]> createManitto(List<Student> beforeStudent){
		List<Student> after = beforeStudent;  
		List<Long> idList = new ArrayList<>();  //id의 list
		List<String[]> ans = new ArrayList<>();  //내 이름, target 이름 담긴 list
		
		for(int i=0; i<beforeStudent.size(); i++) {
			idList.add(beforeStudent.get(i).getId());
		}
		
		boolean flag = true;
		
		while(flag) {
			Collections.shuffle(idList);
			for(int i=0; i<beforeStudent.size(); i++) {
				if(idList.get(i) != after.get(i).getId()) {
					after.get(i).setTargetId(idList.get(i));
					after.set(i, after.get(i));
				}else {
					break;
				}
				if(i == beforeStudent.size()-1) {
					flag = false;
				}
			}
		}
	
		for(int i=0; i<after.size(); i++) {
			String[] str = {after.get(i).getName(),studentDAO.findById(after.get(i).getTargetId())};
			ans.add(str);
			Student student = after.get(i);
		    studentDAO.updateTargetIdById(student.getTargetId(), student.getId());
		}
		return ans;
	}
}

