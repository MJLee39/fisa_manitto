package edu.fisa.lab.service;

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
import edu.fisa.lab.resDto.StudentResDto;



@Service
@Transactional
public class MainService {

	@Autowired
	StudentDAO studentDAO;
	
	@Autowired
	BoardDAO boardDAO;
	

	public void saveBoard(BoardDTO insertBoard) {
	    Board board = insertBoard.toEntity();
	    boardDAO.save(board);
	}
	
	public Optional<Student> myNameAndManitto(String name) {
		Student me = studentDAO.findByName(name);
		Long targetId = me.getTarget();
		Optional<Student> targetName = studentDAO.findById(targetId);
		return targetName;
	}
	
	public boolean isValidUser(String name, String userPw) {
		Student student = studentDAO.findByName(name);
		System.out.println(student);
	    return student != null && student.getPw().equals(userPw);
	}
	
	public Long findId(String name) {
		Student student = studentDAO.findByName(name);
		Long id = student.getId();
		return id;
	}
	
	public List<Board> boardFindAll() {
		System.out.println("controller: "+boardDAO.findAll());
		return boardDAO.findAll();
	}
	
	public List<Student> findAllStudent(){
		return studentDAO.findAll();
	}
	
	public List<String[]> readManitto(List<Student> studentList){
		List<String[]> ans = new ArrayList<>();  //내 이름, target 이름 담긴 list
		for(int i=0; i<studentList.size(); i++) {
			String[] str = {studentList.get(i).getName(),studentDAO.findById(studentList.get(i).getTarget()).get().getName()};
			ans.add(str);
		}
		return ans;
	}
	
	//마니또 만들기
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
					after.get(i).setTarget(idList.get(i));
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
			String[] str = {after.get(i).getName(),studentDAO.findById(after.get(i).getTarget()).get().getName()};
			ans.add(str);
			Student student = after.get(i);
		    studentDAO.updateTargetIdById(student.getTarget(), student.getId());
		}
		return ans;
	}
	
	
	public void changePassword(String name, String newPw) {
		System.out.println("name: "+name);
		try {
			Student s = studentDAO.findByName(name);
			s.setPw(newPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}

