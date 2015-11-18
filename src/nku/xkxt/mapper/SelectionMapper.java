package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.Selection;

public interface SelectionMapper {
	
	Selection getSelectionById(@Param("id")String id);
	
	List<Selection> getSelectionByExample(Selection selection);
	
	int insertSelection(Selection selection); 
	
	List<Selection> getAllSelectionByStuId(@Param("studentId")String studentId);
	
	int deleteSelectionById(@Param("selectionId")String selectionId);
	
	int updateSelectionByExample(Selection selection);
}
