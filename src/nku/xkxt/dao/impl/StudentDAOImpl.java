package nku.xkxt.dao.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import nku.xkxt.dao.StudentDAO;
import nku.xkxt.mapper.StudentMapper;
import nku.xkxt.model.Student;

@Repository
public class StudentDAOImpl implements StudentDAO{
	
	@Resource
	private StudentMapper studentMapper;
	
	@Override
	public Student getStudentById(String id){
		return studentMapper.getStudentById(id);
	}
}
