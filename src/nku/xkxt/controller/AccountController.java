package nku.xkxt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	@RequestMapping(value = "/register")
	public String register(Model model) {
		return "index";
	}

}
