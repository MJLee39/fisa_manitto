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
import jakarta.transaction.Transactional;

@Repository
public interface StudentDAO extends JpaRepository<Student, Long>{
		
	 //select name from student where id=?
	 String findNameById(@Param("id") Long id);
	
	 //select * from student where targetId=?
	 Student findByTarget(Long target);

	 //SELECT * FROM Student WHERE name=?
	 Student findByName(@Param("name") String name);
	 
	 // 두 메소드 모두 동일한 쿼리를 생성함
	 //Student findStudentById(Long id);
	 
	 // by Song
	 //Optional<Student> findById(@Param("id") Long id);	 
	 
	 @Modifying
	 @Transactional
	 @Query("UPDATE Student s SET s.target = :target WHERE s.id = :id")
	 void updateTargetIdById(@Param("target") Long target, @Param("id") Long id);
	 
	 @Modifying
	 @Transactional
	 @Query("UPDATE Student s SET s.pw = :pw WHERE s.id = :id")
	 int changePassword(@Param("id") Long id, @Param("pw") String pw);
	 
	
	 
}
       