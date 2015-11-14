package nku.xkxt.model.base;

import java.io.Serializable;

public abstract class BaseSelection implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String studentId;
	
	private String courseId;
	
	private Float score;
	
	private Integer isOver;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public Integer getIsOver() {
		return isOver;
	}

	public void setIsOver(Integer isOver) {
		this.isOver = isOver;
	}
	
}
