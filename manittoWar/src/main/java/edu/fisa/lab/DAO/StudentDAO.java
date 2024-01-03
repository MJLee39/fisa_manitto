package edu.fisa.lab.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.fisa.lab.domain.entity.Student;

@Repository
public interface StudentDAO extends JpaRepository<Student, Integer>{
		
	Student findStudentByTargetId(long targetId);
	
	 @Query("SELECT s FROM Student s WHERE s.name = :name")
	 Student findByName(@Param("name") String name);
	 
	 @Query("SELECT id FROM Student s WHERE s.name = :name")
	 long findIdByName(@Param("name") String name);
	 
	 @Query("SELECT name FROM Student s WHERE s.id = :id")
	 String findById(@Param("id") long id);
	 
	 @Query(value = "SELECT * FROM student", nativeQuery = true)
	 List<Student> findAll();
	 
	 @Modifying
	 @Query("UPDATE Student s SET s.targetId = :targetId WHERE s.id = :id")
	 void updateTargetIdById(@Param("targetId") long targetId, @Param("id") long id);
}
       