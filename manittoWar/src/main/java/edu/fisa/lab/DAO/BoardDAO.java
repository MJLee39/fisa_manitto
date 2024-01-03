package edu.fisa.lab.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
<<<<<<< HEAD
=======
import org.springframework.data.repository.query.Param;
>>>>>>> d8bbbe2a70f47a2cd284444c7c94936361e66b45
import org.springframework.stereotype.Repository;

import edu.fisa.lab.domain.entity.Board;

public interface BoardDAO extends JpaRepository<Board, Long>{

	@Query("SELECT b FROM Board b")
	List<Board> findAll();
<<<<<<< HEAD
=======
	
>>>>>>> d8bbbe2a70f47a2cd284444c7c94936361e66b45
}
