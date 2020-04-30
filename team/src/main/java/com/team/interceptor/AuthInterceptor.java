package com.team.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team.service.LogService;
import com.team.vo.Log;
import com.team.vo.Member;
import com.team.vo.Task;

//public class AuthInterceptor implements HandlerInterceptor {
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	@Qualifier("logService")
	private LogService logService;

	// Controller 실행 (호출) 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
				
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();

		System.out.println("URI : " + uri);
		
		if (uri.contains("/feedback/") || uri.contains("/log/") || uri.contains("/project/")) { 
			if (session.getAttribute("loginuser") == null) {
				response.sendRedirect("/team/account/login.action");
				return false; // 컨트롤러로 요청을 전달하지 마세요
			}
		} else if (uri.contains("/workspace/")) { // 조승연 팀원 작업 영역
			if (session.getAttribute("loginuser") == null) {
				response.sendRedirect("/team/account/login.action");
				return false; // 컨트롤러로 요청을 전달하지 마세요
			}
		}
		
		return true; // 컨트롤러로 요청을 전달하세요
	}
	
	// Controller 실행 (호출) 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

		String uri = request.getRequestURI();
		
		if (uri.contains("/addtask.action") || uri.contains("/deletetask.action")) {
			Task task = (Task) request.getSession().getAttribute("task");
			String email = ((Member)request.getSession().getAttribute("loginuser")).getEmail();
			String state = uri.contains("add") ? "생성" : uri.contains("delete") ? "삭제" : "수정";
			
			// 임시 프로젝트 번호 : 1
			Log log = new Log(email, new Date(), task.getTaskNo(), state, 1);
			System.out.println(log.toString());
			logService.writeLog(log);
		}
		
		
	}
	
	// 요청 처리 후 (View 처리 후)
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
	
}
