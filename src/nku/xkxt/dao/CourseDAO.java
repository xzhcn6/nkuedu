package nku.xkxt.dao;

import java.util.List;

import nku.xkxt.model.Course;

public interface CourseDAO {
	
	Course getCourseById(String id);
	
	Course getCourseBySelectId(String selectId);
	
	int insertCourse(Course course); 
	
	List<Course> getAllCourseByPage();
	
	List<Course> getAllOpenCourseByPage();
	
	int deleteCourseById(String courseId);
	
	int updateCourseByExample(Course course);
	
}
