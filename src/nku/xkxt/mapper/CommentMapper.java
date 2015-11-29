package nku.xkxt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.Comment;

public interface CommentMapper {
	
	Comment getCommentById(@Param("id")String id);
	
	Comment getCommentBySelectionId(@Param("selectionId")String selectionId);
	
	int insertComment(Comment comment);
	
	List<Comment> getCommentByCourseId(@Param("courseId")String courseId);
	
}
