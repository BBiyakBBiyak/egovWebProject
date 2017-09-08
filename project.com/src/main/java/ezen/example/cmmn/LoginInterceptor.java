package ezen.example.cmmn;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	List<String> urls;
	
	public void setUrls(List<String> urls) {
		this.urls = urls;
	}
	
	@Override
	public boolean preHandle ( HttpServletRequest request, 
			HttpServletResponse response, Object handler ) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if ( session == null ) {
			response.sendRedirect(request.getContextPath() + "/login/login.jsp");
			return false;
		}
		
		// 인증 체크가 필요없는 URL 체크
		for ( int i = 0; i < urls.size(); i++ ) {
			if ( request.getRequestURI().matches(urls.get(i))) {
				System.out.println("===== 인증 체크가 필요 없는 URL =====");
				System.out.println("=== URL : " + urls.get(i) + " ===");
				System.out.println("======== return true =======");
				System.out.println("========= 인터셉터 종료 ==========");
			}
			
			
			// 첫 페이가 로그인 페이지일 경우
			// 첫 페이지 jsession때문에 체크 ? 
			if ( request.getRequestURI().indexOf(urls.get(i)) != -1 ) {
				return true;
			}
		}
		
		
		return true;
		
	}

}
