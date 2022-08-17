package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import command.MemberCommand;
 
public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		int memberAdminCk = (int)session.getAttribute("memberAdminCk");
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null || memberAdminCk == 0) {
			response.sendRedirect("/pjt/index");
			return false;
		}
		return true;
	}
	
}
