package nku.xkxt.service;

import java.util.List;

import nku.xkxt.model.CourseTime;

public interface CourseTimeService {
	
	List<CourseTime> getCourseTimeByCourseId(String courseId);
	
	int insertCourseTime(CourseTime courseTime); 
	
	int deleteCourseTimeById(String id);
	
	int updateCourseTimeByExample(CourseTime courseTime);
	
}
