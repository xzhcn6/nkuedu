package nku.xkxt.service;

import java.util.List;

import nku.xkxt.model.Student;


public interface AdminService {
	
	int adminCheckLogin(String loginName, String password);
	
	List<Student> getAllStudentByPage();
	
	int deleteStudentById(String stuId);
	
}
