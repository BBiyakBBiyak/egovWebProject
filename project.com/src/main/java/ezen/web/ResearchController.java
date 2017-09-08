package ezen.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.fdl.property.EgovPropertyService;
import ezen.example.ui.pagination.PaginationInfo;
import ezen.service.PageVO;
import ezen.service.ResearchService;
import ezen.service.ResearchVO;

@Controller
public class ResearchController {
	
	@Resource(name="ResearchService")
	private ResearchService rService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService pService;
	
	@RequestMapping(value="/surveyWrite.do")
	public String reSearchWrite() {
	
		return "research/researchWrite";
	}
	
	@RequestMapping(value="/surveySave.do", method = RequestMethod.POST)
	public String reSearchSave(ResearchVO vo) throws Exception {
		if(vo != null) {
			rService.insertResearch(vo);
			for(String comm : vo.getComm()){
				if(!comm.equals("")) {
					vo.setContent(comm);
					rService.insertResearchSub(vo);
				}
			}
		}
		return "redirect:/surveyList.do";
	}
	
	@RequestMapping(value="/surveyList.do")
	public String reSearchList(@ModelAttribute("searchVO") PageVO pVO, ModelMap model) throws Exception {
				pVO.setPageUnit(pService.getInt("pageUnit"));
				pVO.setPageSize(pService.getInt("pageSize"));
				
				/** pageing setting */
				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(pVO.getPageIndex());
				paginationInfo.setRecordCountPerPage(pVO.getPageUnit());
				paginationInfo.setPageSize(pVO.getPageSize());

				pVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
				pVO.setLastIndex(paginationInfo.getLastRecordIndex());
				pVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

				List<?> list = rService.selectReSearchList(pVO);
				int cnt = rService.cntReSearchList(pVO);
				
				model.addAttribute("result", list);
				
				paginationInfo.setTotalRecordCount(cnt);
				model.addAttribute("paginationInfo", paginationInfo);
		
		return "research/researchList";
	}
}
