package nku.xkxt.mapper;

import org.apache.ibatis.annotations.Param;

import nku.xkxt.model.Student;

public interface StudentMapper {
	
	Student getStudentById(@Param("id")String id);
}
