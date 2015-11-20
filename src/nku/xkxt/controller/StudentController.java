package nku.xkxt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nku.core.common.Constants;
import nku.core.utils.UUIDGenerator;
import nku.xkxt.model.Course;
import nku.xkxt.model.CourseTime;
import nku.xkxt.model.CourseWithTime;
import nku.xkxt.model.Selection;
import nku.xkxt.model.Student;
import nku.xkxt.service.CourseService;
import nku.xkxt.service.CourseTimeService;
import nku.xkxt.service.SelectionService;
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
	@Resource
	private CourseTimeService courseTimeService;
	@Resource
	private SelectionService selectionService;
	
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
		return "student/personalInfo";
	}
	
	@RequestMapping(value = "/top")
	public String top(Model model) {
		return "student/top";
	}
	
	@RequestMapping(value = "/topMenu")
	public String topMenu(Model model) {
		return "student/topMenu";
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
		List<Course> courseList = courseService.getAllOpenCourseByPage();
		PageInfo<Course> page = new PageInfo<Course>(courseList);
		List<CourseWithTime> courseWTList = new ArrayList<CourseWithTime>();
		for (Course course : courseList) {
			CourseWithTime cwt = new CourseWithTime();
			List<CourseTime> courseTimeList = courseTimeService.getCourseTimeByCourseId(course.getId());
			cwt.setCourseTime(courseTimeList);
			cwt.setSelectId(course.getSelectId());
			cwt.setName(course.getName());
			cwt.setMaxStudent(course.getMaxStudent());
			cwt.setProfessor(course.getProfessor());
			cwt.setClassroom(course.getClassroom());
			cwt.setRequest(course.getRequest());
			cwt.setIntroduction(course.getIntroduction());
			cwt.setType(course.getType());
			cwt.setCredit(course.getCredit());
			cwt.setSelectedCount(selectionService.getCountByCourseId(course.getId()));
			courseWTList.add(cwt);
		}
		map.put("page", page);
		map.put("courseList", courseWTList);
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
	
	@RequestMapping(value = "/selectClass")
	public String selectClass(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		
		model.addAttribute("student", student);
		return "student/selectClass";
	}
	
	@RequestMapping(value = "/getSelectedCourse")
	@ResponseBody
	public Map<String,Object> getSelectedCourse(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		
		String studentId = request.getParameter("studentId");
		
		List<Selection> selectionList = selectionService.getAllSelectionByStuId(studentId);
		List<Course> courseList = new ArrayList<Course>();
		for(int i=0;i<selectionList.size();i++){
			Selection selection = selectionList.get(i);
			Course co = courseService.getCourseById(selection.getCourseId());
			if (co!=null){
				courseList.add(co);
			}
		}
		
		map.put("courseList", courseList);
		return map;
	}
	
	@RequestMapping(value = "/addSelection")
	@ResponseBody
	public Map<String,Object> addSelection(HttpServletRequest request){
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();
		
		String selectId = request.getParameter("selectId");
		Course course = courseService.getCourseBySelectId(selectId);
		if (course == null){
			msg = "不存在此课程，请参照选课系统查看选课序号！";
			map.put("error", msg);
			return map;
		}
		if (course.getMaxStudent() <= selectionService.getCountByCourseId(course.getId())){
			msg = "课程已选人数已达上限！";
			map.put("error", msg);
			return map;
		}
		
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		Selection selection = new Selection();
		selection.setCourseId(course.getId());
		selection.setStudentId(student.getId());
		
		List<Selection> selectList = selectionService.getSelectionByExample(selection);
		if (selectList.size() != 0){
			msg = "选课失败，您已经选过此课程！";
			map.put("error", msg);
			return map;
		}
		
		if (2 <= selectionService.getCountByStudentId(student.getId())){
			msg = "您的可选课程数已达上限！";
			map.put("error", msg);
			return map;
		}
		
		List<Selection> selectedList = selectionService.getAllSelectionByStuId(student.getId());	//当前学生已选的所有课程
		for (int i = 0; i < selectedList.size(); i++) {	//课程时间冲突判断，需要选出当前学生的所有已选课程的所有开课时间，与当前所选课程的所有开课时间对比
			Selection sel = selectedList.get(i);
			Course cou = courseService.getCourseById(sel.getCourseId());
			List<CourseTime> courseTimeList = courseTimeService.getCourseTimeByCourseId(course.getId());
			List<CourseTime> couTimeList = courseTimeService.getCourseTimeByCourseId(cou.getId());
			for (int j = 0; j < courseTimeList.size(); j++) {
				CourseTime courseTime = courseTimeList.get(j);
				for (int k = 0; k < couTimeList.size(); k++) {
					CourseTime ct = couTimeList.get(k);
					if ((courseTime.getCourseDay()).equals(ct.getCourseDay())) {
						if (((courseTime.getStartTime()) >= ct.getStartTime() && (courseTime.getStartTime()) <= ct.getEndTime())
								|| ((courseTime.getEndTime()) >= ct.getStartTime() && (courseTime.getEndTime()) <= ct.getEndTime())) {
							msg = "选课失败，此课程与您所选课程时间冲突!";
							map.put("error", msg);
							return map;
						}
					}
				}
			}

		}	
		
		selection.setId(UUIDGenerator.getUUID());
		if (selectionService.insertSelection(selection)>0){
			msg = "选课成功！";
			map.put("msg", msg);
			return map;
		} else {
			msg = "选课失败，请检查信息！";
			map.put("error", msg);
			return map;
		}
	}
	
	@RequestMapping(value = "/deleteSelection")
	@ResponseBody
	public Map<String,Object> deleteSelection(HttpServletRequest request){
		String msg = "";
		Map<String,Object> map = new HashMap<String,Object>();
		
		String selectId = request.getParameter("selectId");
		Course course = courseService.getCourseBySelectId(selectId);
		if (course == null){
			msg = "不存在此课程，请参照选课系统查看选课序号！";
			map.put("error", msg);
			return map;
		}
		
		HttpSession session = request.getSession();
		String stuNumStr = (String) session.getAttribute(Constants.CURRENT_USER_SESSION);
		Student student = new Student();
		if (stuNumStr != null&& !"".equals(stuNumStr)){
			student = studentService.getStudentByNum(Integer.parseInt(stuNumStr));
		}
		Selection selection = new Selection();
		selection.setCourseId(course.getId());
		selection.setStudentId(student.getId());
		
		List<Selection> selectList = selectionService.getSelectionByExample(selection);
		if (selectList.size() == 0){
			msg = "退课失败，您没有选过的课程！";
			map.put("error", msg);
			return map;
		} else {
			if (selectionService.deleteSelectionByExample(selection)>0){
				msg = "退课成功！";
				map.put("msg", msg);
				return map;
			} else {
				msg = "退课失败，请检查信息！";
				map.put("error", msg);
				return map;
			}
		}
	}
	@RequestMapping(value = "/selectedClass")
	public String selectedClass(Model model) {
		return "student/selectedClass";
	}
	
	@RequestMapping(value = "/help")
	public String home(Model model) {
		return "student/help";
	}
	
	@RequestMapping(value = "/blank")
	public String blank(Model model) {
		return "student/blank";
	}
	
}
