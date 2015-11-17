package nku.xkxt.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import nku.xkxt.dao.SelectionDAO;
import nku.xkxt.mapper.SelectionMapper;
import nku.xkxt.model.Selection;

@Repository
public class SelectionDAOImpl implements SelectionDAO{
	
	@Resource
	private SelectionMapper selectionMapper;
	
	@Override
	public Selection getSelectionById(String id){
		return selectionMapper.getSelectionById(id);
	}
	
	@Override
	public int insertSelection(Selection selection){
		return selectionMapper.insertSelection(selection);
	}
	
	@Override
	public List<Selection> getAllSelectionByStuId(String studentId){
		return selectionMapper.getAllSelectionByStuId(studentId);
	}
	
	@Override
	public int deleteSelectionById(String selectionId){
		return selectionMapper.deleteSelectionById(selectionId);
	}
	
	@Override
	public int updateSelectionByExample(Selection selection){
		return selectionMapper.updateSelectionByExample(selection);
	}

}
