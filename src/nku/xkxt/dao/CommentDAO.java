package nku.xkxt.dao;

import nku.xkxt.model.Comment;

public interface CommentDAO {
	
	Comment getCommentById(String id);
	
	Comment getCommentBySelectionId(String selectionId);
	
	int insertComment(Comment comment);
	
}
