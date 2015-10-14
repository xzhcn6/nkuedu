package nku.xkxt.dao.impl;

import java.util.List;

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
	
	@Override
	public int insertStudent(Student student){
		return studentMapper.insertStudent(student);
	}
	
	@Override
	public int getLastStudentNum(){
		return studentMapper.getLastStudentNum();
	}
	
	@Override
	public List<Student> checkStudentByEmail(String email){
		return studentMapper.checkStudentByEmail(email);
	}
	
	@Override
	public String getStudentNumByEmail(String email){
		return studentMapper.getStudentNumByEmail(email);
	}
	
	@Override
	public Student getStudentByNum(int studentNum){
		return studentMapper.getStudentByNum(studentNum);
	}
}
