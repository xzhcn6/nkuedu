package nku.xkxt.model.base;

import java.io.Serializable;

public abstract class BaseCourseTime implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String courseId;
	
	private Integer courseDay;
	
	private Integer startTime;
	
	private Integer endTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	
	public Integer getCourseDay() {
		return courseDay;
	}

	public void setCourseDay(Integer courseDay) {
		this.courseDay = courseDay;
	}

	public Integer getStartTime() {
		return startTime;
	}

	public void setStartTime(Integer startTime) {
		this.startTime = startTime;
	}

	public Integer getEndTime() {
		return endTime;
	}

	public void setEndTime(Integer endTime) {
		this.endTime = endTime;
	}
	
}
