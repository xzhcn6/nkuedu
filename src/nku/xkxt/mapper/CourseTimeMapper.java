package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.CourseTime;

public interface CourseTimeMapper {
	
	CourseTime getCourseTimeById(@Param("id")String id);
	
	List<CourseTime> getCourseTimeByCourseId(@Param("courseId")String courseId);
	
	List<CourseTime> getCourseTimeByClassroom(@Param("classroom")String classroom);
	
	int insertCourseTime(CourseTime courseTime); 
	
	int deleteCourseTimeByCourseId(@Param("courseId")String courseId);
	
	int deleteCourseTimeById(@Param("id")String id);
	
	int updateCourseTimeByExample(CourseTime courseTime);
}
