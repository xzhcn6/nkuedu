package nku.xkxt.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import nku.xkxt.dao.CourseDAO;
import nku.xkxt.mapper.CourseMapper;
import nku.xkxt.model.Course;

@Repository
public class CourseDAOImpl implements CourseDAO{
	
	@Resource
	private CourseMapper courseMapper;
	
	@Override
	public Course getCourseById(String id){
		return courseMapper.getCourseById(id);
	}
	
	@Override
	public Course getCourseBySelectId(String selectId){
		return courseMapper.getCourseBySelectId(selectId);
	}
	
	@Override
	public int insertCourse(Course course) {
		return courseMapper.insertCourse(course);
	}
	
	@Override
	public List<Course> getAllCourseByPage(){
		return courseMapper.getAllCourseByPage();
	}
	
	@Override
	public List<Course> getAllOpenCourseByPage(){
		return courseMapper.getAllOpenCourseByPage();
	}
	
	@Override
	public int deleteCourseById(String courseId){
		return courseMapper.deleteCourseById(courseId);
	}
	
	@Override
	public int updateCourseByExample(Course course){
		return courseMapper.updateCourseByExample(course);
	}

}
