package edu.fisa.lab.domain.dto;

import edu.fisa.lab.domain.entity.Board;
import edu.fisa.lab.domain.entity.Student;
import jakarta.persistence.Column;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

@Builder
public class StudentDTO {
	 
	private Integer id;
	private String name;
	private String pw;
	private Long targetId;
	
	public Student toEntity() {
		return Student.builder().id(id).name(name).pw(pw).targetId(targetId).build();
	}

}


