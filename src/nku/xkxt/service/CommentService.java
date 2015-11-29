package nku.xkxt.service;

import java.util.List;

import nku.xkxt.model.Comment;

public interface CommentService {
	
	Comment getCommentById(String id);
	
	Comment getCommentBySelectionId(String selectionId);
	
	int insertComment(Comment comment);
	
	List<Comment> getCommentByCourseId(String courseId);
	
}
