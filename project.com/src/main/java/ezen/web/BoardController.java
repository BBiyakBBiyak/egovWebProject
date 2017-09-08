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
//import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import ezen.example.ui.pagination.PaginationInfo;
import ezen.service.BoardService;
import ezen.service.BoardVO;
import ezen.service.PageVO;

@Controller
public class BoardController {

	/** BoardService */
	@Resource(name="Service")
	private BoardService service;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 게시글 입력(view)페이지
	 * @return boardWrite.jsp 화면
	 */
	@RequestMapping(value="/boardWrite.do")
	public String writeView() {
		return "board/boardWrite";
	}
	
	/**
	 * 게시글 저장(insert)
	 * @param vo
	 * @param model
	 * @param status
	 * @return 성공하면 boardList.jsp(게시판화면) / 실패(오류)하면 boardWrite.jsp(입력화면)
	 * @throws Exception
	 */
	@RequestMapping(value="/boardInsert.do", method = RequestMethod.POST)
	public String boardInsert(BoardVO vo, Model model, SessionStatus status)  {
		try {
			service.insertBoard(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "foward:/boardWrite.do";
		}
		status.setComplete(); 
		return "redirect:/boardList.do";			
	}
	
	/**
	 * 게시글 상세(view)페이지
	 * @param unq - 리스트로 부터 특정값(unq)
	 * @param model
	 * @param status
	 * @return boardDetail.jsp 
	 * @throws Exception
	 */
	@RequestMapping(value="/boardDetail.do")
	public String detailView(@RequestParam("unq") int unq, Model model, SessionStatus status) throws Exception {
		BoardVO vo = selectList(unq);
	
		model.addAttribute("vo", vo);
	
		service.updateBoardHit(Integer.valueOf(vo.getUnq()));
		status.setComplete();
		
		return "board/boardDetail";
	}
	
	@RequestMapping(value="/boardDetailProcess.do")
	@ResponseBody Map<String, Object> boardDetailView(BoardVO vo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		if(vo.getUnq() != 0) {
			vo = selectList(vo.getUnq());
			map.put("vo", vo);
		}
				
		return map;
	}
	
	
	/**
	 * 게시글 수정(view)페이지
	 * @param unq
	 * @param model
	 * @return boardModify.jsp
	 * @throws Exception
	 */
	@RequestMapping(value="/boardModifyView.do", method = RequestMethod.POST)
	public String modifyView(BoardVO vo, Model model) throws Exception {
		vo = selectList(vo.getUnq());
		model.addAttribute("vo", vo);
		
		return "board/boardModify";
	}
	
	/**
	 * 비밀번호 체크
	 * @param vo
	 * @return String (Matched or NotMatched)
	 * @throws Exception
	 */
	@RequestMapping(value="/checkedPwd.do", method=RequestMethod.POST)
	@ResponseBody Map<String, String> checkedPwd(BoardVO vo) throws Exception {
		Map<String, String> map = new HashMap<>();
		boolean result = service.checkPassword(vo); 
		
		if(!result) {
			// 비밀번호가 일치하지 않으면
			map.put("result", "NotMatched");
		} else {
			// 비밀번호가 일치하면 
			map.put("result", "Matched");	
		}
		return map;
	}
	
	/**
	 * 게시글 수정(update)
	 * @param 수정페이지로 부터 BoardVO를 받아 db update
	 * @param model
	 * @return 성공하면 boardDetail.jsp 
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.POST) 
	public String boardUpdate(BoardVO vo, Model model) throws Exception {	
		// 비밀번호가 변경되었을 경우를 대비해 핸번더 체크
		boolean result = service.checkPassword(vo); 
		
		if(result) {
			// 비밀번호가 일치하면 업데이트
			service.updateBoard(vo); 
			model.addAttribute("unq", vo.getUnq());
			
			return "redirect:/boardDetail.do";
		} else {
			// 비밀번호가 일치하지 않으면 현재페이지 reload와 함께 메세지 전달
			model.addAttribute("vo", vo);
            model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
		}
		return "board/boardModify";
	}
	
	/**
	 * 게시글 답변입력(view)페이지
	 * @param 상세(detail)페이지로 부터 BoardVO를 받아옴
	 * @param model
	 * @return boardWirteRE.jsp
	 * @throws Exception
	 */
	@RequestMapping(value="/boardWriteComm.do")
	public String CommentWriteView(BoardVO vo, Model model) throws Exception {	
		// detail에서 현재 선택된 값을 가져옴
		vo = selectList(vo.getUnq());
		model.addAttribute("vo",vo);
		
		return "board/boardWriteComm";	
	}
	
	
	/**
	 * 게시글 답글입력(Insert)
	 * @param myVO, parentVO(thread입력을 위해 댓글의 부모객체 필요)
	 * @param model
	 * @param status
	 * @return 성공시 insert후 boardList.jsp, 실패시 boardWriteComm.jsp
	 * @throws Exception
	 */
	@RequestMapping(value="/boardInsertComm.do")
	public String boardInsertComment(BoardVO myVO, Model model, SessionStatus status) throws Exception {
		// vo = selectList(vo.getUnq());
		BoardVO parentVO = new BoardVO();
		parentVO = selectList(myVO.getUnq());
		
		myVO.setFid(parentVO.getFid());
		myVO.setThread(parentVO.getThread());
				
		String maxThread = service.maxThread(myVO);
		String myThread = "";
		
		if(maxThread != null) {
			char zz = maxThread.charAt(maxThread.length() -1);
			char t2 = (char) ((int) zz+1);
			
			String t1 = maxThread.substring(0, maxThread.length() -1);
			myThread = t1 + t2;
		} else {
			myThread = myVO.getThread() + "a";
		}
		
		try {	
			myVO.setThread(myThread);
			service.insertComment(myVO);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "foward:/boardWriteComm.do";
		}
		
		status.setComplete(); 
		return "redirect:/boardList.do";			
	}
	
	/**
	 * 비밀번호 체크
	 * 입력받은 값을 @ModelAttribute로 vo에 넘겨줌
	 */
	@RequestMapping (value = "/BoardPwdCheck.do")
	public String pwdCheck(@ModelAttribute BoardVO vo) {
		return "board/popup/bPwdCheck";
	}
	
	/**
	 * 게시글 삭제(delete)
	 * @param vo
	 * @param model
	 * @param status
	 * @return 성공하면 boardList.jsp / 실패하면 boardModify.jsp(실패시 'message'에 result[실패했다는 내용] 담아보냄)
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody public Map<String, String> deleteBoard2(BoardVO vo) throws Exception {
		Map<String, String> map = new HashMap<>();
		
		boolean result = service.checkPassword(vo); 
		if(!result) {
			// 비밀번호가 일치하지 않으면
			map.put("result", "NotMatched");
			return map;
		} else {
			// 비밀번호가 일치하면  해당게시글에 대한 정보를 불러옴
			vo = selectList(vo.getUnq());
			// 해당게시글에 댓글이 있는지 파악
			int count = service.countCommnet(vo);
			if(count > 0) {
				// 댓글이 존재하면
				map.put("result", "fail");
				return map;
			} else {
				// 댓글이 존재하지 않으면
				service.deleteBoard(vo); 
				System.out.println("================삭제가능============");
				map.put("result", "success");
			}
		}
		return map;
		
	}
	
	/**
	 * 게시글 리스트(view)페이지
	 * @param model
	 * @return boardList.jsp
	 * @throws Exception
	 */
	@RequestMapping(value = "/boardList.do")
	public String selectAllList(@ModelAttribute("pageVO") PageVO pageVO, ModelMap model) throws Exception{

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

		
		List<?> list = service.selectBoardList(pageVO);
		model.addAttribute("result", list);
		
		int totCnt = service.countAllList(pageVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "board/boardList";
	}
	
	/**
	 * 게시글 리스트 '한개'(클릭or선택 된 게시글을 가져옴) 
	 * @param vo
	 * @return unq값을 토대로 db의 게시판의 1개의 레코드를 리턴
	 * @throws Exception
	 */
	public BoardVO selectList(@RequestParam("selUnq") int unq) throws Exception {
		return service.selectBoard(unq);
	}
}