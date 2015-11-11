package nku.xkxt.service;

import java.util.List;

import nku.xkxt.model.CourseTime;

public interface CourseTimeService {
	
	CourseTime getCourseTimeById(String id);
	
	List<CourseTime> getCourseTimeByCourseId(String courseId);
	
	int insertCourseTime(CourseTime courseTime); 
	
	int deleteCourseTimeByCourseId(String courseId);
	
	int deleteCourseTimeById(String id);
	
	int updateCourseTimeByExample(CourseTime courseTime);
	
}
