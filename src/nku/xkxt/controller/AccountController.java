package nku.xkxt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nku.core.common.Constants;
import nku.core.common.VerifyCodeConstants;
import nku.core.utils.UUIDGenerator;
import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
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
	public void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		
		String code = request.getParameter("code");
		String image = (String)request.getSession().getAttribute(VerifyCodeConstants.SessionName);

		if(code==null||image==null||!image.equalsIgnoreCase(code)){
			out.print("<script>alert('验证码输入有误!')</script>");
			out.print("<script>window.location.href='http://localhost:8888/nkuedu/account/register'</script>");
            out.flush();
            out.close();
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
			out.print("<script>alert('注册成功！您的学号为"+((Integer)newStu.getStudentNum()).toString()+"，请牢记您的学号，它是您登录的帐号。现在进入您的个人界面')</script>");
			out.print("<script>window.location.href='http://localhost:8888/nkuedu/account/register'</script>");
            out.flush();
            out.close();
		} else {
			if(result == Constants.EMAIL_USED)
				out.print("<script>alert('注册失败！您所使用的邮箱已被使用！')</script>");
			else if(result == Constants.INSERT_FAILURE)
				out.print("<script>alert('注册失败！请重新注册')</script>");
			out.print("<script>window.location.href='http://localhost:8888/nkuedu/account/register'</script>");
            out.flush();
            out.close();
		}
	}
	
	/** 
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
	public String findAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		
		String code = request.getParameter("code");
		String image = (String)request.getSession().getAttribute(VerifyCodeConstants.SessionName);

		if(code==null||image==null||!image.equalsIgnoreCase(code)){
			out.print("<script>alert('验证码输入有误!')</script>");
			out.print("<script>window.location.href='http://localhost:8888/nkuedu/account/forgotAccount'</script>");
            out.flush();
            out.close();
		}
		
		String email = request.getParameter("email");
		
		String account = studentService.getStudentNumByEmail(email);
		if(account != null){
			out.print("<script>alert('邮箱验证成功！您的学号为"+account+"');window.location.href='http://localhost:8888/nkuedu/account/forgotAccount'</script>");
			out.flush();
            out.close();
		} else {
			out.print("<script>alert('失败！！请填写您注册时所用的邮箱！！');location.href='http://localhost:8888/nkuedu/account/forgotAccount'</script>");
			out.flush();
            out.close();
		}
		
		return "forgotAccount";
	}
}
