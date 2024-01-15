package edu.fisa.lab.resDto;

import org.springframework.beans.factory.annotation.Autowired;

import edu.fisa.lab.domain.entity.Student;

public class StudentResDto {
	
	private String name;
	
	public StudentResDto() {

	}
	
	public StudentResDto(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
	
	 
}
