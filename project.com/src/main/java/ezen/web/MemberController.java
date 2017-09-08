package ezen.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.rte.fdl.property.EgovPropertyService;
import ezen.example.ui.pagination.PaginationInfo;
import ezen.service.MemberService;
import ezen.service.MemberVO;
import ezen.service.PageVO;

@Controller
public class MemberController {
	
	/** BoardService */
	@Resource(name="mbService")
	private MemberService mservice;
	
	/** MappingJackson2JsonView */
	@Resource(name = "jsonView")
	protected MappingJackson2JsonView jsonView;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	/**
	 * 회원정보입력View & 저장
	 * @return memberResiget.jsp(view)
	 */
	@RequestMapping(value="/mRegister.do")
	public String memberRegister() {
		return "member/memberRegister";
	}
	@RequestMapping(value = "/mRegisterSave.do", method = RequestMethod.POST) 
	@ResponseBody public Map<String, Object> insertMember( MemberVO vo ) throws Exception {
		Map<String, Object> map = new  HashMap<String, Object>();
		String result = "";
		
		result = mservice.insertMember(vo);
		if(result == null) 
			result = "ok";
		map.put("result", result);
		
		return map;
	}
	/***** 회원정보입력View & 저장 끝 *****/
	
	
	/** IdCheck to Query */
	@RequestMapping(value = "/mIdCheck.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, String> idCheck( MemberVO vo ) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		int cnt = 0;
		
		// 서비스 호출 
		cnt = mservice.idCheck(vo.getId());
		if(cnt == 0)
			// id값이 존재
			map.put("result", "ok");
		else 
			map.put("result", "fail");
		return map;
	}
	
	/** Find Postnum to Query*/
	@RequestMapping(value = "/post1.do")
	public String postNumInsert() {
		return "others/post1";
	}
	@RequestMapping(value = "/postSelect.do")
	public String selectPostList(@RequestParam("dong") String dong, Model model ) throws Exception {
		
		List<?> list = mservice.selectPostNumList(dong);
		model.addAttribute("postList", list);
		return "others/post2";
	}
	
	
	@RequestMapping ( value = "/mList.do")
	public String selectAllMember( @ModelAttribute("pageVO") PageVO pageVO, Model model ) throws Exception {
		/** EgovPropertyService.sample */
		pageVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pageVO.setPageSize(propertiesService.getInt("pageSize"));
		
		System.out.println(pageVO.getSearchCondition());
		System.out.println(pageVO.getSearchKeyword());
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pageVO.getPageUnit());
		paginationInfo.setPageSize(pageVO.getPageSize());

		pageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<?> list = mservice.selectAllList(pageVO);
		model.addAttribute("member", list);
		
		int totCnt = mservice.countAllList(pageVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "member/memberList";
	}
}
