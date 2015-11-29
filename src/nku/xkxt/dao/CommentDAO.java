package nku.xkxt.dao;

import java.util.List;

import nku.xkxt.model.Comment;

public interface CommentDAO {
	
	Comment getCommentById(String id);
	
	Comment getCommentBySelectionId(String selectionId);
	
	int insertComment(Comment comment);
	
	List<Comment> getCommentByCourseId(String courseId);
	
}
