package nku.xkxt.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.xkxt.dao.CourseDAO;
import nku.xkxt.dao.CourseTimeDAO;
import nku.xkxt.model.Course;
import nku.xkxt.model.CourseTime;
import nku.xkxt.model.CourseWithTime;
import nku.xkxt.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{
	
	@Resource
	private CourseDAO courseDAO;
	@Resource
	private CourseTimeDAO courseTimeDAO;
	
	@Override
	public Course getCourseById(String id){
		return courseDAO.getCourseById(id);
	}
	
	@Override
	public int insertCourse(Course course){
		return courseDAO.insertCourse(course);
	}
	
	@Override
	public List<Course> getAllCourseByPage(){
		return courseDAO.getAllCourseByPage();
	}
	
	@Override
	public List<Course> getAllOpenCourseByPage(){
		return courseDAO.getAllOpenCourseByPage();
	}
	
	@Override
	public List<CourseWithTime> getAllCourseWithTimeByPage() {
		List<CourseWithTime> courseWTimeList = new ArrayList<CourseWithTime>();
		List<Course> courseList = this.getAllOpenCourseByPage();
		for (Course course : courseList) {
			CourseWithTime cwt = new CourseWithTime();
			List<CourseTime> courseTimeList = courseTimeDAO.getCourseTimeByCourseId(course.getId());
			cwt.setCourseTime(courseTimeList);
			cwt.setSelectId(course.getSelectId());
			cwt.setName(course.getName());
			cwt.setMaxStudent(course.getMaxStudent());
			cwt.setProfessor(course.getProfessor());
			cwt.setClassroom(course.getClassroom());
			cwt.setRequest(course.getRequest());
			cwt.setIntroduction(course.getIntroduction());
			cwt.setType(course.getType());
			cwt.setCredit(course.getCredit());
			courseWTimeList.add(cwt);
		}

		return courseWTimeList;
	}
	
	@Override
	public int deleteCourseById(String courseId){
		return courseDAO.deleteCourseById(courseId);
	}
	
	@Override
	public int updateCourseByExample(Course course){
		return courseDAO.updateCourseByExample(course);
	}
}
