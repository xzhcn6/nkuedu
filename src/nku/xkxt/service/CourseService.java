package nku.xkxt.service;

import java.util.List;

import nku.xkxt.model.Course;

public interface CourseService {
	
	int insertCourse(Course course); 
	
	List<Course> getAllCourseByPage();
	
	int deleteCourseById(String courseId);
	
	int updateCourseByExample(Course course);
	
}
