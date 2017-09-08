package ezen.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.BoardVO;
import ezen.service.PageVO;

@Repository("dataDAO")
public class DataBoardDAO extends EgovAbstractDAO {

	public String insertDataBoard(BoardVO vo) throws Exception {
		return (String) insert("dataBoard.insert", vo);
	}

	public void updateDataBoard(BoardVO vo) throws Exception {
		update("dataBoard.update", vo);
	}
	
	public void deleteDataFile(BoardVO vo) throws Exception {
		update("dataBoard.deleteFile", vo);
	}
	
	public void updateDataBoardHit(int unq) throws Exception {
		update("dataBoard.updateHit", unq);
	}

	public List<?> selectDataBoardList(PageVO vo) throws Exception {
		return list("dataBoard.selectAllList", vo);
	}
	
	public int cntDataBoardList(PageVO vo) {
		return (Integer) select("dataBoard.countAllList", vo);
	}
	
	
	public BoardVO selectDataBoard(int unq) throws Exception {
		return (BoardVO) select("dataBoard.select", unq);
	}
	
	public BoardVO selectDataBoard(BoardVO vo) throws Exception {
		return (BoardVO) select("dataBoard.getBoard", vo);
	}
	
	
}
