nkuedu
=============
南开大学夏季学期高中生选课系统
-----
Elective System for Senior High School Student of Nankai University.

### 待开发:
* 导出功能：听课证导出,成绩单

### Bugs or Faults
* 首页

### 框架目录

>
```
|-READEME.md	相关说明
|
|-WebContent	项目目录
|		|-index.jsp		系统首页入口
|		|-META-INF
|		|-static		静态资源目录
|		|	|-CSS		CSS文件
|		|	|	|-manage
|		|	|	|─student
|		|	|	└─....		共用CSS
|		|	|-images	图片资源(学生和管理员界面一致，资源共享)
|		|	|	|-login
|		|	|	|-main
|		|	|	└─register
|		|	└─JS		JS资源
|		|		|-student
|		|		|─teacher
|		|		└─....		共用JS
|		|
|		└─WEB-INF
|			|-web.xml
|			|-lib		引用包
|			└─pages		页面
|				|-student		学生相关页面
|				|-teacher		教师(管理员)相关页面
|				└─....		不属于角色的页面(学生注册、学生登陆、忘记学号、管理员登陆等)
|-resources		资源配置路径
|		|-mapper	Mybatis配置的Mapper
|		|	└─....
|		|-jdbc.properties		Mysql配置
|		|-log4j.properties		log配置
|		|-spring-mvc.xml		
|		└─spring-mybatis.xml
|
|-src			java后台实现
|	└─nku
|		|-core		项目公用部分、相关工具
|		|	|-common
|		|	|	|-Constants.java			常量定义
|		|	|	└─VerifCodeConstants.java	验证码功能相关常量
|		|	|-controller
|		|	|		└─VerifyCodeController.java		验证码controller
|		|	|-interceptor	拦截器
|		|	|		└─AccessStatisticsIntceptor.java	访问权限拦截
|		|	|-model			共用Model
|		|	|	└─User.java		用作登陆用(学生和老师均登陆方式一致)
|		|	└utils			工具目录
|		|		└─UUIDGenerator.java	生产UUID，用作数据库表的主键	
|		└─xkxt		项目后台实现
|			|-model		model层
|			|	|-Admin.java
|			|	|-Comment.java
|			|	|-Course.java
|			|	|-CourseTime.java
|			|	|-CourseWithTime.java
|			|	|-SelectedCourse.java
|			|	|-SelectedStudent.java
|			|	|-Selection.java
|			|	|-Student.java
|			|	└─base		model的基类，一般不直接使用
|			|		|-BaseAdmin.java		对应数据库-admin
|			|		|-BaseComment.java		对应数据库-comment
|			|		|-BaseCourse.java		对应数据库-course
|			|		|-BaseCourseTime.java	对应数据库-coursetTime
|			|		|-BaseSelection.java	对应数据库-selection
|			|		└─BaseStudent.java		对应数据库-student
|			|-mapper	mapper层
|			|	|-AdminMapper.java
|			|	|-CommentMapper.java
|			|	|-CourseMapper.java
|			|	|-CourseTimeMapper.java
|			|	|-SelectionMapper.java
|			|	└─StudentMapper.java
|			|-dao		DAO层
|			|	|-AdminDAO.java			管理员
|			|	|-CommentDAO.java		评教
|			|	|-CourseDAO.java		课程
|			|	|-CourseDAO.java		课程时间
|			|	|-SelectionDAO.java		选课
|			|	|-StudentDAO.java		学生
|			|	└─impl	DAO实现
|			|		└─....
|			|-service		service层
|			|	|-AdminService.java			管理员
|			|	|-CommentService.java		评教
|			|	|-CourseService.java		课程
|			|	|-CourseTimeService.java	课程时间
|			|	|-SelectionService.java		选课
|			|	|-StudentService.java		学生
|			|	└─impl		service实现
|			|		└─....
|			└─controller	controller层
|					|-AccountController.java
|					|-AdminController.java
|					|-ClientController.java
|					└─StudentController.java
|
└─docs	相关文档
```
>>


