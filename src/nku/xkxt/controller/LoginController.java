package nku.xkxt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nku.core.common.VerifyCodeConstants;
import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/client")
public class LoginController {
	
	@Resource
	private StudentService studentService;
	
	@RequestMapping(value = "/home")
	public String home(Model model) {
		Student student = studentService.getStudentById("1");
		model.addAttribute("student", student);
		return "login";
	}
	@RequestMapping(value = "/index")
	public String index(Model model) {
		Student student = studentService.getStudentById("1");
		model.addAttribute("student", student);
		return "index";
	}
	
	@RequestMapping(value = "/login")
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");//防止弹出的信息出现乱码
		PrintWriter out = response.getWriter();
		
		String code = request.getParameter("code");
		String image = (String)request.getSession().getAttribute(VerifyCodeConstants.SessionName);

		if(code==null||image==null||!image.equalsIgnoreCase(code)){
			out.print("<script>alert('验证码输入有误!')</script>");
			out.print("<script>window.location.href='http://localhost:8888/nkuedu/client/home'</script>");
            out.flush();
            out.close();
//            return "index";
		} else {

		String studentnum = request.getParameter("studentnum");
		String password = request.getParameter("password");
		if(studentnum==null||studentnum.trim().length()==0){
//			this.addFieldError("studentnum", "请填写账号");
			//this.addActionError("请填写账号");
		}else if(password==null||password.trim().length()==0){
//			this.addFieldError(password, "请输入密码");
			//this.addActionError("请输入密码");
		} else {
		int result =studentService.studentCheckLogin(Integer.parseInt(studentnum), password); 
		System.out.println(result);
		}
//		return "index";
		}
	}
	
}
