package edu.fisa.lab.domain.dto;

import edu.fisa.lab.domain.entity.Board;
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
public class BoardDTO {

	@Id 
	private long boardId;
	private String title;
	private String content;
	
	public Board toEntity() {
		return Board.builder().boardId(boardId).title(title).content(content).build();
	}
}