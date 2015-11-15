package nku.xkxt.mapper;

import nku.xkxt.model.Admin;

import org.apache.ibatis.annotations.Param;


public interface AdminMapper {
	Admin getAdminByLoginName(@Param("loginName")String loginName); 
	
	Integer getSystemStatus(); 
	
	Integer changeSystemStatus(@Param("status")int status);
	
}
