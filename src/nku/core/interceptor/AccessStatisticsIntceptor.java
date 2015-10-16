package nku.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nku.core.common.Constants;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;  
import org.springframework.web.servlet.ModelAndView;  


  
  
public class AccessStatisticsIntceptor implements HandlerInterceptor {  
	 private static Logger logger = Logger.getLogger(AccessStatisticsIntceptor.class);  
	
	@Override  
    public void afterCompletion(HttpServletRequest arg0,  
            HttpServletResponse arg1, Object arg2, Exception arg3)  
            throws Exception {  
        // TODO Auto-generated method stub  
		logger.info("==============执行顺序: 3、afterCompletion================");  
  
    }  
  
    @Override  
    public void postHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler, ModelAndView modelAndView) throws Exception {  
        // TODO Auto-generated method stub 
    	logger.info("==============执行顺序: 2、postHandle================");    
    }  
  
    @Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object obj) throws Exception {  
    	logger.info("==============执行顺序: 1、preHandle================");
    	String str = (String) request.getSession().getAttribute(Constants.CURRENT_USER_SESSION);  
        System.out.println("str=========>"+str);  
        
        String uri = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") +1);  
        System.out.println("uri=========>"+uri);
//        if(!AuthorityController.isAuthorized(uri, request.getSession())) {
        if(str==null){  
            //校验失败
        	response.sendRedirect("/client/home");
            return false; 
        }  
        return true;  
    }
}