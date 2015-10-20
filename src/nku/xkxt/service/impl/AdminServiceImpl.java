package nku.xkxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.core.common.Constants;
import nku.xkxt.dao.AdminDAO;
import nku.xkxt.model.Admin;
import nku.xkxt.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Resource
	private AdminDAO adminDAO;
	
	@Override
	public int adminCheckLogin(String loginName, String password){
		Admin admin = adminDAO.getAdminByLoginName(loginName);
		if (admin == null){
			return Constants.NO_SUCH_USER;
		} else {
			if (!password.equals(admin.getPassword())){
				return Constants.WRONG_PWD;
			} else {
				return Constants.SUCCESS_LOGIN;
			}
		}
	}
}
