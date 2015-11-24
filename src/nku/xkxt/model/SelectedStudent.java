package nku.xkxt.model;

public class SelectedStudent {
	
	private String id;
	
	private String studentId;
	
	private Float score;
	
	private Integer isOver;
	
	private String name;
	
	private Integer studentNum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getIsOver() {
		return isOver;
	}

	public void setIsOver(Integer isOver) {
		this.isOver = isOver;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public Integer getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(Integer studentNum) {
		this.studentNum = studentNum;
	}
	
}
