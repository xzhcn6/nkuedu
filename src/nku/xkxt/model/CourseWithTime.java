package nku.xkxt.model;

import java.util.List;

import nku.xkxt.model.base.BaseCourse;

public class CourseWithTime extends BaseCourse{

	private static final long serialVersionUID = 1L;
	
	private List<CourseTime> courseTime;

	public List<CourseTime> getCourseTime() {
		return courseTime;
	}

	public void setCourseTime(List<CourseTime> courseTime) {
		this.courseTime = courseTime;
	}

}
