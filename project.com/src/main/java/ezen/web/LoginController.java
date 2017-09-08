package ezen.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import ezen.service.LoginService;
import ezen.service.LoginVO;


@Controller
public class LoginController {
	
	/** Service */
	@Resource(name="loginService")
	private LoginService service;
	
	/** MappingJackson2JsonView */
	@Resource(name = "jsonView")
	protected MappingJackson2JsonView jsonView;
	
	// 로그인 화면
	@RequestMapping(value="/login.do")
	public String loginView(HttpServletRequest request) {
		String referrer = request.getHeader("Referer");
		
		// session에 페이지 저장
		HttpSession session = request.getSession();
		session.setAttribute("url", referrer);

		return "login/login";
	}
	
	@RequestMapping(value = "/loginProcess.do")
	@ResponseBody public int loginProcess ( LoginVO vo, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("id", vo.getuId());
		param.put("pwd", vo.getuPwd());
		
		int loginResult  = service.loginCheck(param);
		
		if ( loginResult > 0 ) {
			session.setAttribute("id", vo.getuId());
			session.setAttribute("pwd", vo.getuPwd());
			
			request.getSession().setAttribute("session", session);
		}
	
		return loginResult;
	}
	
	@RequestMapping( value = "/loginpage.do") 
	public ModelAndView loginpage(HttpSession session, Model model, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		
		if (id != null) {
			//mav.setViewName("redirect:/main.do");
			mav.setViewName( "redirect:" +  session.getAttribute("url"));
			session.removeAttribute("url");
			
			return mav;
		}
		mav.setViewName("redirect:" +  session.getAttribute("url"));
		session.removeAttribute("url");

		return mav;
	}
	
	// 로그아웃 화면
	@RequestMapping( value = "/logout.do")
	public String logout(HttpSession session, HttpServletRequest request, Model model) {
		// 로그아웃 시 이전 주소 기억
		session.setAttribute("url", request.getHeader("Referer"));
		
		String path = "redirect:" +  session.getAttribute("url");
		session.invalidate();
		
		return path;
	}

}
