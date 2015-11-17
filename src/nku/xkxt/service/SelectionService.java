package nku.xkxt.service;

import java.util.List;
import nku.xkxt.model.Selection;

public interface SelectionService {
	
Selection getSelectionById(String id);
	
	int insertSelection(Selection selection); 
	
	List<Selection> getAllSelectionByStuId(String studentId);
	
	int deleteSelectionById(String selectionId);
	
	int updateSelectionByExample(Selection selection);
	
}
