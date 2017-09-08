package ezen.service;

import java.util.List;


public interface DataBoardService {
	
	public String insertDataBoard(BoardVO vo) throws Exception;
	
	public void updateDataBoard(BoardVO vo) throws Exception;

	public void deleteDataFile(BoardVO vo) throws Exception;
	
	public void updateDataBoardHit(int unq) throws Exception;
	
	/** SelectList*/
	List<?> selectDataBoardList(PageVO vo) throws Exception;
	int cntDataBoardList(PageVO vo);
	
	BoardVO selectDataBoard(int unq) throws Exception;
	BoardVO getDataBoard(BoardVO vo) throws Exception;

}
