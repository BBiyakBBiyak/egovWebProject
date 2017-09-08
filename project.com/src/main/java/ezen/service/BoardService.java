package ezen.service;

import java.util.List;


public interface BoardService {
	
	/**
	 * Insert Service
	 * @param vo - 등록할 게시글
	 * @return 게시글 등록
	 * @throws Exception
	 */
	public String insertBoard(BoardVO vo) throws Exception;

	public void updateBoard(BoardVO vo) throws Exception;

	public void deleteBoard(BoardVO vo) throws Exception;
	
	/** SelectList*/
	List<?> selectBoardList(PageVO vo) throws Exception;
	
	int countAllList(PageVO vo);

	
	BoardVO selectBoard(int unq) throws Exception;
	
	int updateBoardHit(int unq) throws Exception;
	
	Boolean checkPassword(BoardVO vo) throws Exception;
	
	String maxThread(BoardVO vo) throws Exception;
	
	public String insertComment(BoardVO vo) throws Exception;
	
	int countCommnet(BoardVO vo) throws Exception;
	
	

}
