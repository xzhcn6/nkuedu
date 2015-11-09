package nku.xkxt.dao;

import java.util.List;

import nku.xkxt.model.CourseTime;

public interface CourseTimeDAO {
	
	List<CourseTime> getCourseTimeByCourseId(String courseId);
	
	int insertCourseTime(CourseTime courseTime); 
	
	int deleteCourseTimeById(String id);
	
	int updateCourseTimeByExample(CourseTime courseTime);
	
}
