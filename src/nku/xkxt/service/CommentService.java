package nku.xkxt.service;

import nku.xkxt.model.Comment;

public interface CommentService {
	
	Comment getCommentById(String id);
	
	Comment getCommentBySelectionId(String selectionId);
	
}
