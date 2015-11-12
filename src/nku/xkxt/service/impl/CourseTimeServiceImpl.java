package nku.xkxt.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.xkxt.dao.CourseTimeDAO;
import nku.xkxt.model.CourseTime;
import nku.xkxt.service.CourseTimeService;

@Service
public class CourseTimeServiceImpl implements CourseTimeService{
	
	@Resource
	private CourseTimeDAO courseTimeDAO;
	
	@Override
	public CourseTime getCourseTimeById(String id){
		return courseTimeDAO.getCourseTimeById(id);
	}
	
	@Override
	public List<CourseTime> getCourseTimeByCourseId(String courseId){
		return courseTimeDAO.getCourseTimeByCourseId(courseId);
	}
	
	@Override
	public List<CourseTime> getCourseTimeByClassroom(String classroom){
		return courseTimeDAO.getCourseTimeByClassroom(classroom);
	}
	
	@Override
	public int insertCourseTime(CourseTime courseTime){
		return courseTimeDAO.insertCourseTime(courseTime);
	}
	
	@Override
	public int deleteCourseTimeByCourseId(String courseId){
		return courseTimeDAO.deleteCourseTimeByCourseId(courseId);
	}
	
	@Override
	public int deleteCourseTimeById(String id){
		return courseTimeDAO.deleteCourseTimeById(id);
	}
	
	@Override
	public int updateCourseTimeByExample(CourseTime courseTime){
		return courseTimeDAO.updateCourseTimeByExample(courseTime);
	}
}
