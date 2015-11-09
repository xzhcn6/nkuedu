package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.CourseTime;

public interface CourseTimeMapper {
	
	List<CourseTime> getCourseTimeByCourseId(@Param("courseId")String courseId);
	
	int insertCourseTime(CourseTime courseTime); 
	
	int deleteCourseTimeById(@Param("id")String id);
	
	int updateCourseTimeByExample(CourseTime courseTime);
}
