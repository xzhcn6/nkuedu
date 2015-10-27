package nku.xkxt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nku.core.common.Constants;
import nku.xkxt.dao.AdminDAO;
import nku.xkxt.dao.StudentDAO;
import nku.xkxt.model.Admin;
import nku.xkxt.model.Student;
import nku.xkxt.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Resource
	private AdminDAO adminDAO;
	
	@Resource
	private StudentDAO studentDAO;
	
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
	
	@Override
	public List<Student> getAllStudentByPage(){
		return studentDAO.getAllStudentByPage();
	}
	
	@Override
	public int deleteStudentById(String stuId){
		return studentDAO.deleteStudentById(stuId);
	}
}
