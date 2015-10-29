package nku.xkxt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nku.core.common.VerifyCodeConstants;
import nku.xkxt.model.Student;
import nku.xkxt.service.AdminService;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Resource
	private AdminService adminService;
	@Resource
	private StudentService studentService;
	
	@RequestMapping(value = "/main")
	public String main(Model model) {
		return "teacher/main";
	}
	
	@RequestMapping(value = "/showStudent")
	public String showStudent(Model model) {
		return "teacher/showStudent";
	}
	
	@RequestMapping(value = "/getStudentList")
	@ResponseBody
	public Map<String,Object> getStudentList(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String pageNum = request.getParameter("pageNo");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<Student> stuList= adminService.getAllStudentByPage();
		PageInfo<Student> page = new PageInfo<Student>(stuList);
		map.put("stuList", page);
		return map;
	}
	
	@RequestMapping(value = "/deleteStudent")
	@ResponseBody
	public Map<String,Object> deleteStudent(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String stuId = request.getParameter("id");
		adminService.deleteStudentById(stuId);
		return map;
	}
	
	@RequestMapping(value = "/updateStudent")
	public String updateStudent(Model model,HttpServletRequest request) {
		String stuId = request.getParameter("id");
		Student student = studentService.getStudentById(stuId);
		model.addAttribute("student", student);
		return "teacher/updateStudent";
	}
	
	@RequestMapping(value = "/updateStudentInfo")
	@ResponseBody
	public Map<String,Object> updateStudentInfo(HttpServletRequest request){		
		String code = request.getParameter("code");
		String image = (String)request.getSession().getAttribute(VerifyCodeConstants.SessionName);
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();	//将返回信息存放到此map中，然后返回JSON

		if(code==null||image==null||!image.equalsIgnoreCase(code)){
			msg = "验证码输入有误!";
			map.put("error", msg);
            return map;
		}
		
		String stuId = request.getParameter("stuId");
		String name = request.getParameter("name");
		String school = request.getParameter("school");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		Student newStu = new Student();
		newStu.setId(stuId);
		newStu.setName(name);
		newStu.setSchool(school);
		newStu.setTelephone(phone);
		newStu.setPasswd(password);
		if(studentService.updateStudentByExample(newStu)>0){
			msg = "修改成功!";
			map.put("msg", msg);
            return map;
		} else {
			msg = "修改失败!";
			map.put("error", msg);
            return map;
		}
	}
	
	@RequestMapping(value = "/showClass")
	public String showClass(Model model) {
		return "teacher/showClass";
	}
	
	
	@RequestMapping(value = "/top")
	public String top(Model model) {
		return "teacher/top";
	}
	
	@RequestMapping(value = "/left")
	public String left(Model model) {
		return "teacher/left";
	}
}
