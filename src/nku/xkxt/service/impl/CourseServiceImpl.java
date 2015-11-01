package nku.xkxt.service.impl;


import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import nku.xkxt.dao.CourseDAO;
import nku.xkxt.model.Course;
import nku.xkxt.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{
	
	@Resource
	private CourseDAO courseDAO;
	
	@Override
	public int insertCourse(Course course){
		return courseDAO.insertCourse(course);
	}
	
	@Override
	public List<Course> getAllCourseByPage(){
		return courseDAO.getAllCourseByPage();
	}
	
	@Override
	public int deleteCourseById(String courseId){
		return courseDAO.deleteCourseById(courseId);
	}
	
	@Override
	public int updateCourseByExample(Course course){
		return courseDAO.updateCourseByExample(course);
	}
}
