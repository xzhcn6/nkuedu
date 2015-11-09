package nku.xkxt.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nku.core.common.VerifyCodeConstants;
import nku.core.utils.UUIDGenerator;
import nku.xkxt.model.Course;
import nku.xkxt.model.CourseTime;
import nku.xkxt.model.Student;
import nku.xkxt.service.AdminService;
import nku.xkxt.service.CourseService;
import nku.xkxt.service.CourseTimeService;
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
	@Resource
	private CourseService courseService;
	@Resource
	private CourseTimeService courseTimeService;
	
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
	public void deleteStudent(HttpServletRequest request){
		String stuId = request.getParameter("id");
		adminService.deleteStudentById(stuId);
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
	
	@RequestMapping(value = "/showCourse")
	public String showCourse(Model model) {
		return "teacher/showCourse";
	}
	@RequestMapping(value = "/addCourse")
	public String addCourse(Model model) {
		return "teacher/addCourse";
	}
	
	/*
	 * 添加课程
	 */
	@RequestMapping(value = "/insertCourse")
	@ResponseBody
	public Map<String,Object> insertCourse(HttpServletRequest request) throws IOException{
		Map<String,Object> map = new HashMap<String,Object>();	//将返回信息存放到此map中，然后返回JSON
		String msg = "";
		
		String courseNum = request.getParameter("courseNum");
		String name = request.getParameter("name");
		String maxStudent = request.getParameter("maxStudent");
		String professor = request.getParameter("professor");
		String classroom = request.getParameter("classroom");
		
		String reques = request.getParameter("request");
		String introduction = request.getParameter("introduction");
		introduction = introduction.replace("\n","@");
		String type = request.getParameter("type");
		String credit = request.getParameter("credit");
		String isOpen = request.getParameter("isOpen");
		
		Course course = new Course();
		course.setId(UUIDGenerator.getUUID());
		course.setCourseNum(courseNum);
		course.setName(name);
		course.setMaxStudent(Integer.parseInt(maxStudent));
		course.setProfessor(professor);
		course.setClassroom(classroom);
		course.setRequest(reques);
		course.setIntroduction(introduction);
		course.setType(type);
		course.setCredit(Float.parseFloat(credit));
		if ("on".equals(isOpen)){
			course.setIsOpen(1);
		} else {
			course.setIsOpen(0);
		}
		course.setIsDelete(0);
		try {
			if (courseService.insertCourse(course)>0){
				msg = "添加课程成功!";
				map.put("msg", msg);
	            return map;
			} else {
				msg = "添加课程失败，请重新检查信息!";
				map.put("error", msg);
	            return map;
			}
		} catch (Exception e){
			msg = "添加课程失败，请重新检查信息!";
			map.put("error", msg);
            return map;
		}
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
	
	@RequestMapping(value = "/deleteCourse")
	@ResponseBody
	public void deleteCourse(HttpServletRequest request){
		String courseId = request.getParameter("id");
		courseService.deleteCourseById(courseId);
	}
	
	@RequestMapping(value = "/updateCourse")
	public String updateCourse(Model model,HttpServletRequest request) {
		String courseId = request.getParameter("id");
		Course course = courseService.getCourseById(courseId);
		model.addAttribute("course", course);
		return "teacher/updateCourse";
	}
	
	@RequestMapping(value = "/updateCourseInfo")
	@ResponseBody
	public Map<String,Object> updateCourseInfo(HttpServletRequest request){		

		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();	//将返回信息存放到此map中，然后返回JSON
		
		String courseId = request.getParameter("courseId");
		String courseNum = request.getParameter("courseNum");
		String name = request.getParameter("name");
		String maxStudent = request.getParameter("maxStudent");
		String professor = request.getParameter("professor");
		String classroom = request.getParameter("classroom");
		
		String reques = request.getParameter("request");
		String introduction = request.getParameter("introduction");
		introduction = introduction.replace("\n","@");
		String type = request.getParameter("type");
		String credit = request.getParameter("credit");
		String isOpen = request.getParameter("isOpen");
		
		Course course = new Course();
		course.setId(courseId);
		course.setCourseNum(courseNum);
		course.setName(name);
		course.setMaxStudent(Integer.parseInt(maxStudent));
		course.setProfessor(professor);
		course.setClassroom(classroom);
		course.setRequest(reques);
		course.setIntroduction(introduction);
		course.setType(type);
		course.setCredit(Float.parseFloat(credit));
		if ("on".equals(isOpen)){
			course.setIsOpen(1);
		} else {
			course.setIsOpen(0);
		}
		if(courseService.updateCourseByExample(course)>0){
			msg = "修改成功!";
			map.put("msg", msg);
            return map;
		} else {
			msg = "修改失败!";
			map.put("error", msg);
            return map;
		}
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
		return "teacher/showCourseIntro";
	}
	
	@RequestMapping(value = "/showTime")
	public String showTime(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		String selectId = request.getParameter("selectId");
		String name = request.getParameter("name");
		Course course = new Course();
		course.setId(id);
		course.setSelectId(Integer.parseInt(selectId));
		course.setName(name);
		model.addAttribute("course", course);
		return "teacher/showTime";
	}
	
	@RequestMapping(value = "/addTime")
	public String addTime(Model model,HttpServletRequest request) {
		String id = request.getParameter("id");
		String selectId = request.getParameter("selectId");
		String name = request.getParameter("name");
		Course course = new Course();
		course.setId(id);
		course.setSelectId(Integer.parseInt(selectId));
		course.setName(name);
		model.addAttribute("course", course);
		return "teacher/addTime";
	}
	
	/*
	 * 添加课程
	 */
	@RequestMapping(value = "/addTimeToCourse")
	@ResponseBody
	public Map<String,Object> addTimeToCourse(HttpServletRequest request) throws IOException{
		Map<String,Object> map = new HashMap<String,Object>();	//将返回信息存放到此map中，然后返回JSON
		String msg = "";
		
		String courseId = request.getParameter("courseId");
		String courseDay = request.getParameter("courseDay");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		
		Integer sTime = Integer.parseInt(startTime);
		Integer eTime = Integer.parseInt(endTime);
		
		if (sTime>=eTime){
			msg = "添加时间失败，课程开始时间必须小于结束时间!";
			map.put("error", msg);
            return map;
		}
		
		CourseTime courseTime= new CourseTime();
		
		courseTime.setId(UUIDGenerator.getUUID());
		courseTime.setCourseId(courseId);
		courseTime.setCourseDay(Integer.parseInt(courseDay));
		courseTime.setStartTime(sTime);
		courseTime.setEndTime(eTime);
			
//		try {
			if (courseTimeService.insertCourseTime(courseTime)>0){
				msg = "添加时间成功!";
				map.put("msg", msg);
	            return map;
			} else {
				msg = "添加时间失败，请重新检查信息!";
				map.put("error", msg);
	            return map;
			}
//		} catch (Exception e){
//			msg = "添加时间失败，请重新检查信息!";
//			map.put("error", msg);
//            return map;
//		}
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
