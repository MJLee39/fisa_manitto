package edu.fisa.lab.service;

import java.sql.SQLException;
import java.util.*;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fisa.lab.DAO.BoardDAO;
import edu.fisa.lab.DAO.StudentDAO;
import edu.fisa.lab.domain.dto.BoardDTO;
import edu.fisa.lab.domain.entity.Board;
import edu.fisa.lab.domain.entity.Student;
import edu.fisa.lab.exception.NotExistException;
import edu.fisa.lab.resDto.StudentResDto;



@Service
public class MainService {

	@Autowired
	StudentDAO studentDAO;
	
	@Autowired
	BoardDAO boardDAO;
	
	private ModelMapper mapper = new ModelMapper();
	
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
	
	public void saveBoard(BoardDTO insertBoard) {
	    Board board = insertBoard.toEntity();
	    boardDAO.save(board);
	}
	
}

