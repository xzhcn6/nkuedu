package nku.xkxt.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.xkxt.dao.SelectionDAO;
import nku.xkxt.model.Selection;
import nku.xkxt.service.SelectionService;

@Service
public class SelectionServiceImpl implements SelectionService{
	
	@Resource
	private SelectionDAO selectionDAO;
	
	@Override
	public Selection getSelectionById(String id){
		return selectionDAO.getSelectionById(id);
	}
	
	@Override
	public List<Selection> getSelectionByExample(Selection selection){
		return selectionDAO.getSelectionByExample(selection);
	}
	
	@Override
	public int insertSelection(Selection selection){
		return selectionDAO.insertSelection(selection);
	}
	
	@Override
	public int deleteSelectionByExample(Selection selection){
		return selectionDAO.deleteSelectionByExample(selection);
	} 
	
	@Override
	public List<Selection> getAllSelectionByStuId(String studentId){
		return selectionDAO.getAllSelectionByStuId(studentId);
	}
	
	@Override
	public int deleteSelectionById(String selectionId){
		return selectionDAO.deleteSelectionById(selectionId);
	}
	
	@Override
	public int updateSelectionByExample(Selection selection){
		return selectionDAO.updateSelectionByExample(selection);
	}
	
	@Override
	public Integer getCountByCourseId(String courseId){
		return selectionDAO.getCountByCourseId(courseId);
	}
	
	@Override
	public Integer getCountByStudentId(String studentId){
		return selectionDAO.getCountByStudentId(studentId);
	}
	
}
