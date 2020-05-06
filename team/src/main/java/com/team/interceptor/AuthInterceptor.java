package com.team.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team.mapper.TaskMapper;
import com.team.service.LogService;
import com.team.service.TaskService;
import com.team.vo.Log;
import com.team.vo.Member;
import com.team.vo.Task;

//public class AuthInterceptor implements HandlerInterceptor {
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	@Qualifier("logService")
	private LogService logService;
	
	@Autowired
	@Qualifier("taskMapper")
	private TaskMapper taskMapper;

	// Controller 실행 (호출) 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
				
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		
		if (uri.contains("/feedback/") || uri.contains("/log/") || uri.contains("/project/") || uri.contains("/timeline") || uri.contains("/mypage")) { 
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
			String email = ((Member)request.getSession().getAttribute("loginuser")).getEmail();
			String state = null;
			int taskNo = 0;
			
			if (uri.contains("addtask")) {
				state = "생성";
				taskNo = ((Task) request.getSession().getAttribute("task")).getTaskNo();
			} else if (uri.contains("deletetask")) {
				state = "삭제";
				taskNo = (int) request.getSession().getAttribute("taskNo");
			} else {
				
			}

			if (taskNo == 0) return;
			
			// 임시 프로젝트 번호 : 1
			Log log = new Log(email, new Date(), taskNo, state, 1);
			logService.writeLog(log);
		}
		
		
	}
	
	// 요청 처리 후 (View 처리 후)
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
	
}
