package ezen.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ezen.service.ResearchService;
import ezen.service.ResearchVO;

@Controller
public class MainController {
	@Resource(name="ResearchService")
	ResearchService rService;

	/** MainView */
	@RequestMapping ( value = "/main.do" )
	public String main(Model model) throws Exception {
		// 노출된 설문조사 가져오기(제목, unq, mcd)
		
		// 오늘날짜구하기 
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String today = sdf.format(cal.getTime());

	
		List<?> list = rService.selectRSUseList(today);
		model.addAttribute("rsList", list);

		return "main/main";
	}
	
	@RequestMapping ( value = "/notice.do" )
	public String notice() {
		return "main/notice";
	}
	
	@RequestMapping ( value = "/popSurvey.do")
	public String popResearch(ResearchVO vo, Model model) throws Exception {
		
		List<?> list = rService.selectRSUseSubList(vo.getMcd());
		model.addAttribute("subList", list);
		
		EgovMap map = (EgovMap)list.get(0);
		String title = (String) map.get("title");
		
		 model.addAttribute("title", title);		
		
		return "research/popup/rsVote";
	}
}
