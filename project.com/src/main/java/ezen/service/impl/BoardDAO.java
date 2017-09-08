package ezen.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.BoardVO;
import ezen.service.PageVO;

@Repository("DAO")
public class BoardDAO extends EgovAbstractDAO {

	public String insertBoard(BoardVO vo) throws Exception {
		return (String) insert("board.insert", vo);
	}
	
	public void updateBoard(BoardVO vo) throws Exception {
		update("board.update", vo);
	}
	
	public void deleteBoard(BoardVO vo) throws Exception {
		delete("board.delete", vo);
	}
	
	public List<?> selectBoardList(PageVO vo) throws Exception {
		return list("board.selectAllList", vo);
	}
	
	public int countAllList(PageVO vo) {
		return (Integer) select("board.countAllList", vo);
	}
	
	public BoardVO selectBoard(int unq) throws Exception {
		return (BoardVO) select("board.select", unq);
	}

	public int updateBoardHit(int unq) throws Exception {
		return (Integer) update("board.updateHit", unq);
	}
	
	public Boolean checkPassword(BoardVO vo) throws Exception {
		boolean result = false;
        
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("unq", vo.getUnq());
        map.put("pwd", vo.getPwd());
        
        int count = (Integer)select("board.pwdCheck", map);
        if(count == 1) 
        	result= true;
        return result;

	}
	
	public String selectMaxThread(BoardVO vo) throws Exception {		
		return (String) select("board.maxThread", vo);
	}
	
	public String insertComm(BoardVO vo) throws Exception {
		return (String) insert("board.insertComm", vo);
	}
	
	public int countComment(BoardVO vo) throws Exception {
		return (Integer) select("board.recount", vo);
	}
	
}
