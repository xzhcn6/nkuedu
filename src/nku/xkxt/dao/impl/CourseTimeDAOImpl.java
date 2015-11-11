package nku.xkxt.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import nku.xkxt.dao.CourseTimeDAO;
import nku.xkxt.mapper.CourseTimeMapper;
import nku.xkxt.model.CourseTime;

@Repository
public class CourseTimeDAOImpl implements CourseTimeDAO{
	
	@Resource
	private CourseTimeMapper courseTimeMapper;
	
	@Override
	public CourseTime getCourseTimeById(String id){
		return courseTimeMapper.getCourseTimeById(id);
	}
	
	@Override
	public List<CourseTime> getCourseTimeByCourseId(String courseId){
		return courseTimeMapper.getCourseTimeByCourseId(courseId);
	}
	
	@Override
	public int insertCourseTime(CourseTime courseTime){
		return courseTimeMapper.insertCourseTime(courseTime);
	}
	
	@Override
	public int deleteCourseTimeByCourseId(String courseId){
		return courseTimeMapper.deleteCourseTimeByCourseId(courseId);
	}
	
	@Override
	public int deleteCourseTimeById(String id){
		return courseTimeMapper.deleteCourseTimeById(id);
	}
	
	@Override
	public int updateCourseTimeByExample(CourseTime courseTime){
		return courseTimeMapper.updateCourseTimeByExample(courseTime);
	}

}
