package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.Student;

public interface StudentMapper {
	
	Student getStudentById(@Param("id")String id);
	
	int insertStudent(Student student);
	
	int getLastStudentNum();
	
	List<Student> checkStudentByEmail(@Param("email")String email);
	
	String getStudentNumByEmail(@Param("email")String email);
	
	Student getStudentByNum(@Param("studentNum")int studentNum); 
	
	List<Student> getAllStudentByPage();
	
	int deleteStudentById(@Param("stuId")String stuId);
}
