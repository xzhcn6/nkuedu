package nku.xkxt.mapper;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.Comment;

public interface CommentMapper {
	
	Comment getCommentById(@Param("id")String id);
	
	Comment getCommentBySelectionId(@Param("selectionId")String selectionId);
	
	int insertComment(Comment comment);
	
}
