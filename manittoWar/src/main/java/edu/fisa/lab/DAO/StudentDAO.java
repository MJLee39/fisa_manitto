package edu.fisa.lab.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.fisa.lab.domain.entity.Student;

@Repository
public interface StudentDAO extends JpaRepository<Student, Long>{
		
	Student findStudentByTargetId(Long targetId);
	
	 @Query("SELECT s FROM Student s WHERE s.name = :name")
	 Student findByName(@Param("name") String name);
	 
	 @Query("SELECT id FROM Student s WHERE s.name = :name")
	 long findIdByName(@Param("name") String name);
	 
	 @Query("SELECT name FROM Student s WHERE s.id = :id")
	 String findById(@Param("id") long id);
	 
	 
}
       