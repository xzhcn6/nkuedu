package nku.xkxt.dao;


import nku.xkxt.model.Admin;

public interface AdminDAO {
	
	Admin getAdminByLoginName(String loginName); 
}
