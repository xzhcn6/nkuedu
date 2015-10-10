package nku.xkxt.controller;

import javax.annotation.Resource;

import nku.xkxt.model.Student;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	@Resource
	private StudentService studentService;
	
	@RequestMapping(value = "/home")
	public String login(Model model) {
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
}
