package nku.xkxt.dao;

import java.util.List;

import nku.xkxt.model.Selection;

public interface SelectionDAO {
	
	Selection getSelectionById(String id);
	
	List<Selection> getSelectionByExample(Selection selection);
	
	int insertSelection(Selection selection); 
	
	List<Selection> getAllSelectionByStuId(String studentId);
	
	int deleteSelectionById(String selectionId);
	
	int updateSelectionByExample(Selection selection);
	
	Integer getCountByCourseId(String courseId);
	
	Integer getCountByStudentId(String studentId);
	
}