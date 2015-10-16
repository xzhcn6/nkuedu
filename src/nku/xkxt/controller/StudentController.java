package nku.xkxt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@RequestMapping(value = "/main")
	public String main(Model model) {
		return "student/main";
	}
	
	@RequestMapping(value = "/personalInfo")
	public String personalInfo(Model model) {
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
