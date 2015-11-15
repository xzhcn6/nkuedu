package nku.xkxt.dao.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import nku.xkxt.dao.AdminDAO;
import nku.xkxt.mapper.AdminMapper;
import nku.xkxt.model.Admin;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Resource
	private AdminMapper adminMapper;
	
	@Override
	public Admin getAdminByLoginName(String loginName){
		return adminMapper.getAdminByLoginName(loginName);
	}
	
	@Override
	public Integer getSystemStatus(){
		return adminMapper.getSystemStatus();
	}
}
