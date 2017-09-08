package ezen.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.BoardEVO;
import ezen.service.PageVO;

@Repository ("boardEdao")
public class BoardEDAO extends EgovAbstractDAO{
	
	public void insertBoardE(BoardEVO vo) {
		insert("boardE.insert", vo);
	}
	
	public List<?> selectListBoardE(PageVO vo) {
		return list("boardE.selectList", vo);	
	}
	
	public int cntListBoardE(PageVO vo) {
		return (int) select("boardE.cntList", vo);
	}
	
	public BoardEVO selectBoardE(int unq) {
		return (BoardEVO) select("boardE.selected", unq);
	}

	public void updateBoardE(BoardEVO vo) throws Exception {
		update("boardE.update", vo);
	}
	
	public void deleteBoardE(int unq) throws Exception {
		delete("boardE.delete", unq);
	}

	public void updateBoardHit(int unq) throws Exception {
		update("boardE.updateHit", unq);
	}
	
	public Boolean checkPassword(BoardEVO vo) throws Exception {
		boolean result = false;
        
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("unq", vo.getUnq());
        map.put("pwd", vo.getPwd());
        
        int count = (Integer)select("boardE.pwdCheck", map);
        if(count == 1) 
        	result= true;
        return result;

	}
	
	/** comment */
	public void insertCommBoardE(BoardEVO vo) {
		insert("boardE.insertComm", vo);
	}
	public BoardEVO selectBoardEComm(int unq) {
		return (BoardEVO) select("boardE.selectedComm", unq);
	}
	public void updateCommBoardE(BoardEVO vo) throws Exception {
		update("boardE.updateComm", vo);
	}
	public void deleteCommBoardE(int unq) throws Exception {
		delete("boardE.deleteComm", unq);
	}
	public List<?> selectCommListBoardE(int unq) {
		return list("boardE.selectCommList", unq);
				
	}
	
	
	
 
}
