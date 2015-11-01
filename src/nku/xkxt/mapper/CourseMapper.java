package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.Course;

public interface CourseMapper {
	
	int insertCourse(Course course); 
	
	List<Course> getAllCourseByPage();
	
	int deleteCourseById(@Param("courseId")String courseId);
	
	int updateCourseByExample(Course course);
}
