package nku.xkxt.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import nku.core.common.Constants;
import nku.core.common.VerifyCodeConstants;
import nku.core.utils.UUIDGenerator;
import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/account")
public class AccountController{
	
	@Resource
	private StudentService studentService;
	
	/*
	 * 注册
	 */
	@RequestMapping(value = "/register")
	public String register(Model model) {
		return "register";
	}
	/*
	 * 添加学生
	 */
	@RequestMapping(value = "/addStudent")
	@ResponseBody
	public Map<String,Object> addStudent(HttpServletRequest request) throws IOException {
		String code = request.getParameter("code");
		String image = (String)request.getSession().getAttribute(VerifyCodeConstants.SessionName);
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();	//将返回信息存放到此map中，然后返回JSON

		if(code==null||image==null||!image.equalsIgnoreCase(code)){
			msg = "验证码输入有误!";
			map.put("error", msg);
            return map;
		}
		
		String name = request.getParameter("name");
		String school = request.getParameter("school");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		Student newStu = new Student();
		newStu.setId(UUIDGenerator.getUUID());
		newStu.setName(name);
		newStu.setEmail(email);
		newStu.setSchool(school);
		newStu.setTelephone(phone);
		newStu.setEmail(email);
		newStu.setPasswd(password);
		newStu.setStudentNum(getStudentNum());
		
		int result = studentService.registerStudent(newStu);
		if(result == Constants.SUCCESS_REGISTER){
            msg = "注册成功！您的学号为"+((Integer)newStu.getStudentNum()).toString()+"，请牢记您的学号，它是您登录的帐号。";
            map.put("msg",msg);
		} else {
			if(result == Constants.EMAIL_USED){
				msg = "注册失败！您所使用的邮箱已被使用！";
			}
			else if(result == Constants.INSERT_FAILURE){
				msg = "注册失败！请重新注册！";
			}
		    map.put("error",msg);
		}
		return map;
	}
	
	/*
	 * 生成一个学号 
	 * @return int  
	 */
	public int getStudentNum(){
		Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
		int year = c.get(Calendar.YEAR); 
		int lasNum;
		lasNum = studentService.getLastStudentNum();
		if(lasNum<year*10000)
			lasNum = year*10000;
		int newStuNum = lasNum + 1;
		return newStuNum;
	}
	/*
	 * 忘记账号:跳转页面
	 */
	@RequestMapping(value = "/forgotAccount")
	public String forgotAccount(Model model) {	
		return "forgotAccount";
	}
	/*
	 * 根据邮箱找回账号
	 */
	@RequestMapping(value = "/findAccount")
	@ResponseBody
	public Map<String,Object> findAccount(HttpServletRequest request) throws IOException {
		String code = request.getParameter("code");
		String image = (String)request.getSession().getAttribute(VerifyCodeConstants.SessionName);
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();	//将返回信息存放到此map中，然后返回JSON
		
		if(code==null||image==null||!image.equalsIgnoreCase(code)){
			msg = "验证码输入有误!";
			map.put("error", msg);
            return map;
		}
		
		String email = request.getParameter("email");
		
		String account = studentService.getStudentNumByEmail(email);
		if(account != null){
			msg = "邮箱验证成功！您的学号为"+account+"。";
			map.put("msg", msg);
		} else {
			msg = "失败！！请填写您注册时所用的邮箱！！";
			map.put("error", msg);
		}
		return map;
	}
}
