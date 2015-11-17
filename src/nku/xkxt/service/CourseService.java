package nku.xkxt.service;

import java.util.List;

import nku.xkxt.model.Course;
import nku.xkxt.model.CourseWithTime;

public interface CourseService {
	
	Course getCourseById(String id);
	
	Course getCourseBySelectId(String selectId);
	
	int insertCourse(Course course); 
	
	List<Course> getAllCourseByPage();
	
	List<Course> getAllOpenCourseByPage();
	
	List<CourseWithTime> getAllCourseWithTimeByPage();
	
	int deleteCourseById(String courseId);
	
	int updateCourseByExample(Course course);
	
}
