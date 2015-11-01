package nku.xkxt.dao;

import java.util.List;

import nku.xkxt.model.Course;

public interface CourseDAO {
	
	int insertCourse(Course course); 
	
	List<Course> getAllCourseByPage();
	
	int deleteCourseById(String courseId);
	
	int updateCourseByExample(Course course);
	
}
