package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.Course;

public interface CourseMapper {
	
	Course getCourseById(@Param("id")String id);
	
	Course getCourseBySelectId(@Param("selectId")String selectId);
	
	int insertCourse(Course course); 
	
	List<Course> getAllCourseByPage();
	
	List<Course> getAllOpenCourseByPage();
	
	int deleteCourseById(@Param("courseId")String courseId);
	
	int updateCourseByExample(Course course);
}
