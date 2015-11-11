package nku.xkxt.dao;

import java.util.List;

import nku.xkxt.model.CourseTime;

public interface CourseTimeDAO {
	
	CourseTime getCourseTimeById(String id);
	
	List<CourseTime> getCourseTimeByCourseId(String courseId);
	
	int insertCourseTime(CourseTime courseTime); 
	
	int deleteCourseTimeByCourseId(String courseId);
	
	int deleteCourseTimeById(String id);
	
	int updateCourseTimeByExample(CourseTime courseTime);
	
}
