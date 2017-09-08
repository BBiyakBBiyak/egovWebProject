package ezen.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import ezen.example.ui.pagination.PaginationInfo;
import ezen.service.BoardEService;
import ezen.service.BoardEVO;
import ezen.service.PageVO;

/**
 * @author SuyeonKang
 * 실시간 CommentBoard Controller
 * ajax -> @ResponseBody
 */

@Controller
public class BoardEController {
	/** BoardEService */
	@Resource(name ="boardEService")
	BoardEService eService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService pService;
	

	/** BoardE 게시판 */
	
	@RequestMapping ( value = "/boardEWrite.do" ) 
	public String boardWrite() {
		return "boardE/boardEWrite";
	}
	
	@RequestMapping( value = "/boardESave.do")
	public String insertBoard(BoardEVO vo, SessionStatus status) throws Exception {
		
		try {
			eService.insertBoardE(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return "foward:/boardDWrite.do";
		}
		status.setComplete(); 
		
		return "redirect:/boardEList.do";
	} 
	
	
	
	@RequestMapping(value = "/boardEList.do")
	public String selectAllList(@ModelAttribute("searchVO") PageVO searchVO, ModelMap model) throws Exception{

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(pService.getInt("pageUnit"));
		searchVO.setPageSize(pService.getInt("pageSize"));
		
		System.out.println(searchVO.getSearchCondition());
		System.out.println(searchVO.getSearchKeyword());
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		
		List<?> list = eService.selectEList(searchVO);
		model.addAttribute("result", list);
		
		int totCnt = eService.cntEList(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "boardE/boardEList";
	}
	
	@RequestMapping (value = "/boardEDetail.do")
	public String datailView(BoardEVO vo, Model model) throws Exception {
		// 선택한 게시글 정보 가져옴
		vo = eService.selectBoardE(vo.getUnq());
		model.addAttribute("vo", vo);
		// 게시글 클릭시 조회수 없데이트
		eService.updateBoardHit(vo.getUnq());
		
		// 댓글 게시판
		List<?> list = eService.selectECommList(vo.getUnq());
		model.addAttribute("result", list);
		
		return "boardE/boardEDetail";
	}
	
	@RequestMapping (value = "/boardEModify.do")
	public String modifyView(BoardEVO vo, Model model) throws Exception {
		vo = eService.selectBoardE(vo.getUnq());
		model.addAttribute("vo", vo);
		
		return "boardE/boardEModify";
	}
	
	@RequestMapping(value = "/boardEUpdate.do", method = RequestMethod.POST) 
	public String boardUpdate(BoardEVO vo, Model model, SessionStatus status) throws Exception {	
		boolean result = eService.checkPassword(vo); 
		
		if(result) {
			eService.updateBoardE(vo); 
			status.setComplete();
			
			return "redirect:/boardEList.do";
		} else {
			model.addAttribute("vo", vo);
            model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
		}
		return "boardE/boardEModify";
	}
	
	
	@RequestMapping(value = "boardEDelete.do", method = RequestMethod.POST)
	public String DeleteBoardE(BoardEVO vo, Model model, SessionStatus status) throws Exception {
		// 패스워드 일치여부 확인
		boolean result = eService.checkPassword(vo); 

		if(result) {
			eService.deleteBoardE(vo.getUnq()); 
			status.setComplete();
			
			return "redirect:/boardEList.do";
		} else {
			model.addAttribute("vo", vo);
            model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
		}
		return "boardE/boardEModify";

	}
	

	/** 실시간 댓글 작성 */
	
	@RequestMapping (value = "/boardECommSave.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> insertComment( BoardEVO vo ) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 서비스 호출 
		try {
			eService.insertCommBoardE(vo);
			map.put("result", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
	
	@RequestMapping (value = "/boardESelectComm.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> modifyCommview(BoardEVO vo) throws Exception {
		Map<String, Object> map = new  HashMap<String, Object>();
		
		vo = eService.selectBoardEComm(vo.getUnq());
		map.put("result", vo);
		
		return map;
	}
	
	@RequestMapping (value = "/boardEModifyComm.do", method = RequestMethod.POST)
	public String modifyCommView(@RequestParam("unq") String unq, Model model) throws Exception {
		int commUnq = Integer.valueOf(unq);
		BoardEVO vo = eService.selectBoardEComm(commUnq);
		model.addAttribute("vo", vo);
		
		return "boardE/popup/commModify";
	}
	
	@RequestMapping (value = "/boardECommUpdate.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> updateComment( BoardEVO vo ) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 서비스 호출 
		try {
			eService.updateCommBoardE(vo);
			map.put("result", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}
			
		return map;
	}
	
	@RequestMapping (value = "/boardECommDelete.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, String> deleteBoardEComm( BoardEVO vo ) {
		Map<String, String> map = new HashMap<String, String>();

		// 서비스 호출 
		try {
			eService.deleteCommBoardE(vo.getUnq());
			map.put("result", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}	
		return map;
	}
	
	@RequestMapping (value = "/commPwdCheck.do")
	public String pwdCheck() {
		return "boardE/popup/commPwdCheck";
	}
	
	@RequestMapping (value = "/checkCommPwd.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> pwdChecked( BoardEVO vo ) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean result = false;
		
		// 서비스 호출 
		result = eService.checkPassword(vo);
		if(result)
			// id값이 존재
			map.put("result", "success");
		else 
			map.put("result", "fail");
		return map;
	}

	


}
