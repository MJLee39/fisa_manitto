package edu.fisa.lab.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import edu.fisa.lab.domain.entity.Board;

@Repository
public interface BoardDAO extends JpaRepository<Board, Long>{

<<<<<<< HEAD:manittoWar2/src/main/java/edu/fisa/lab/DAO/BoardDAO.java
=======
	
>>>>>>> 242158e627bb7f992fab7369cca4e7cf095de161:manittoWar/src/main/java/edu/fisa/lab/DAO/BoardDAO.java
	List<Board> findAll();
}
