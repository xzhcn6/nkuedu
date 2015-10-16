package nku.xkxt.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nku.core.common.Constants;
import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@Resource
	private StudentService studentService;
	
	@RequestMapping(value = "/main")
	public String main(Model model) {
		return "student/main";
	}
	
	@RequestMapping(value = "/personalInfo")
	public String personalInfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		model.addAttribute("student", student);
		return "student/personal_info";
	}
	
	@RequestMapping(value = "/top")
	public String top(Model model) {
		return "student/top";
	}
	
	@RequestMapping(value = "/left")
	public String left(Model model) {
		return "student/left";
	}
	
	@RequestMapping(value = "/help")
	public String home(Model model) {
		return "student/help";
	}
	
}
