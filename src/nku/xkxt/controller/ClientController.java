package nku.xkxt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nku.core.common.Constants;
import nku.core.common.VerifyCodeConstants;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/client")
public class ClientController {
	
	@Resource
	private StudentService studentService;
	
	@RequestMapping(value = "/home")
	public String home(Model model) {
		return "login";
	}
	@RequestMapping(value = "/index")
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping(value = "/login")
	@ResponseBody
	public Map<String,Object> login(HttpServletRequest request){	
		String code = request.getParameter("code");
		String image = (String)request.getSession().getAttribute(VerifyCodeConstants.SessionName);
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();	//将返回信息存放到此map中，然后返回JSON

		if(code==null||image==null||!image.equalsIgnoreCase(code)){
			msg = "验证码输入有误!";
			map.put("error", msg);
            return map;
		} 
		String studentnum = request.getParameter("studentnum");
		String password = request.getParameter("password");
		if(studentnum==null||studentnum.trim().length()==0){
			msg = "请填写账号";
			map.put("error", msg);
            return map;
		}else if(password==null||password.trim().length()==0){
			msg = "请输入密码";
			map.put("error", msg);
            return map;
		} else {
			int result =studentService.studentCheckLogin(Integer.parseInt(studentnum), password); 
			if (result == Constants.NO_SUCH_USER){
				msg = "不存在此账户！";
				map.put("error", msg);
			} else if(result == Constants.WRONG_PWD){
				msg = "密码错误！";
				map.put("error", msg);
			} else if(result == Constants.SUCCESS_LOGIN){
				HttpSession session = request.getSession();
				session.setAttribute(Constants.CURRENT_USER_SESSION, studentnum);
				msg = "登陆成功！";
				map.put("msg", msg);
			} else {
				msg = "登陆错误！";
				map.put("error", msg);
			}
		}
		return map;
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(Constants.CURRENT_USER_SESSION);
		return "redirect:/client/home";
	}
	
	@RequestMapping(value = "/blank")
	public String blank(Model model) {
		return "student/blank";
	}
}
