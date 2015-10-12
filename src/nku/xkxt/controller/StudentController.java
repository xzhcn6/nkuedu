package nku.xkxt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@RequestMapping(value = "/help")
	public String home(Model model) {
		return "student/help";
	}
	
}
