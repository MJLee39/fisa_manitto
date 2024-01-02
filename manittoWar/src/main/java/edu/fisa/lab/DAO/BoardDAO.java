package edu.fisa.lab.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.fisa.lab.domain.entity.Board;

public interface BoardDAO extends JpaRepository<Board, Long>{

	@Query("SELECT b FROM Board b")
	List<Board> findAll();
	
}
