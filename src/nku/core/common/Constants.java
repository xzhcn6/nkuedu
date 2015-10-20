package nku.core.common;

public class Constants {
	
	/*
	 * 成功
	 */
	public static final int SUCCESS = 1;
	/*
	 * 	成功登陆
	 */
	public static final int SUCCESS_LOGIN = 1;
	/*
	 * 密码错误
	 */
	public static final int WRONG_PWD = 2;
	/*
	 * 无此用户
	 */
	public static final int NO_SUCH_USER = 3;
	/*
	 * 注册成功
	 */
	public static final int SUCCESS_REGISTER = 4;
	/*
	 * 邮箱已经被注册
	 */
	public static final int EMAIL_USED = 5;
	/*
	 * 插入失败
	 */
	public static final int INSERT_FAILURE = 6;
	
	/*
	 * 当前用户
	 */
	public static final String CURRENT_USER_SESSION = "currentUser";
	
	/*
	 * 当前管理员用户
	 */
	public static final String CURRENT_ADMIN_SESSION = "currentAdmin";
}
