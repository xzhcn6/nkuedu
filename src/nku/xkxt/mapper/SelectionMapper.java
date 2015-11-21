package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.SelectedCourse;
import nku.xkxt.model.Selection;

public interface SelectionMapper {
	
	Selection getSelectionById(@Param("id")String id);
	
	List<Selection> getSelectionByExample(Selection selection);
	
	List<SelectedCourse> getSelectionByCourse();
	
	int insertSelection(Selection selection); 
	
	int deleteSelectionByExample(Selection selection); 
	
	List<Selection> getAllSelectionByStuId(@Param("studentId")String studentId);
	
	int deleteSelectionById(@Param("selectionId")String selectionId);
	
	int updateSelectionByExample(Selection selection);
	
	Integer getCountByCourseId(@Param("courseId")String courseId);
	
	Integer getCountByStudentId(@Param("studentId")String studentId);
	
	int overCourse(Selection selection);
	
	int overAllCourse(@Param("isOver")int isOver);
	
	int addScoreByExample(Selection selection);
}
