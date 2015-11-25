package nku.xkxt.model;

public class SelectedCourse {
	
	private String id;
	
	private String courseId;
	
	private Float score;
	
	private Integer isOver;
	
	private Integer selectId;
	
	private String courseNum;
	
	private String name;
	
	private String professor;
	
	private Float credit;

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

	public Integer getIsOver() {
		return isOver;
	}

	public void setIsOver(Integer isOver) {
		this.isOver = isOver;
	}
	
	public Integer getSelectId() {
		return selectId;
	}

	public void setSelectId(Integer selectId) {
		this.selectId = selectId;
	}

	public String getCourseNum() {
		return courseNum;
	}

	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public Float getCredit() {
		return credit;
	}

	public void setCredit(Float credit) {
		this.credit = credit;
	}
	
}
