package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import command.MemberCommand;

public class CartInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null) {
			response.sendRedirect("/pjt/member/login");
			return false;
		}
		return true;
	}
	
}
