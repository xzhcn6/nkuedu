package nku.xkxt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nku.core.common.Constants;
import nku.xkxt.model.Course;
import nku.xkxt.model.Student;
import nku.xkxt.service.CourseService;
import nku.xkxt.service.StudentService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@Resource
	private StudentService studentService;
	@Resource
	private CourseService courseService;
	
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
	
	@RequestMapping(value = "/xksc")
	public String xksc(Model model) {
		return "student/xksc";
	}
	
	@RequestMapping(value = "/getCourseList")
	@ResponseBody
	public Map<String,Object> getCourseList(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String pageNum = request.getParameter("pageNo");
		PageHelper.startPage(Integer.parseInt(pageNum), 10);
		List<Course> courseList= courseService.getAllCourseByPage();
		PageInfo<Course> page = new PageInfo<Course>(courseList);
		map.put("courseList", page);
		return map;
	}
	
	@RequestMapping(value = "/showCourseIntro")
	public String showCourseIntro(Model model,HttpServletRequest request) {
		String name = request.getParameter("name");
		String introduction = request.getParameter("introduction");
		introduction = introduction.replace("@","\n");
		Course course = new Course();
		course.setName(name);
		course.setIntroduction(introduction);
		model.addAttribute("course", course);
		return "student/showCourseIntro";
	}
	
	@RequestMapping(value = "/help")
	public String home(Model model) {
		return "student/help";
	}
	
}
