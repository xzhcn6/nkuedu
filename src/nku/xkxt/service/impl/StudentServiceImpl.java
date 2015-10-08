package nku.xkxt.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.xkxt.dao.StudentDAO;
import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Resource
	private StudentDAO studentDAO;
	
	@Override
	public Student getStudentById(String id){
		return studentDAO.getStudentById(id);
	}
}
