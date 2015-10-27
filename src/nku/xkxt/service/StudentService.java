package nku.xkxt.service;

import nku.xkxt.model.Student;

public interface StudentService {
	
	Student getStudentById(String id);
	
	int registerStudent(Student student);
	
	int getLastStudentNum();
	
	String getStudentNumByEmail(String email);
	
	Student getStudentByNum(int studentNum);
	
	int studentCheckLogin(int studentNum, String password); 
	
	int updateStudentByExample(Student student);
	
}
