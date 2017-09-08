package ezen.service;

import java.util.List;

public interface BoardEService {
	
	/** 게시글 입력 */
	public void insertBoardE(BoardEVO vo) throws Exception;
	/** 댓글 입력*/
	public void insertCommBoardE(BoardEVO vo) throws Exception;
	/** 게시글 업데이트 */
	public void updateBoardE(BoardEVO vo) throws Exception;
	/** 게시글 조회수 업데이트*/
	public void updateBoardHit(int unq) throws Exception;
	/** 비밀번호 체크 */
	public Boolean checkPassword(BoardEVO vo) throws Exception;
	/** 게시글 삭제 */
	public void deleteBoardE(int unq) throws Exception;
	
	/** 게시글 리스트 */
	public List<?> selectEList(PageVO vo) throws Exception;
	/** 게시글 리스트 갯수 */
	public int cntEList(PageVO vo) throws Exception;
	/** 게시물 보기*/
	public BoardEVO selectBoardE(int unq) throws Exception;
	
	/** 댓글 리스트 */
	public List<?> selectECommList(int unq) throws Exception;
	
	/** 댓글 업데이트 */
	public void updateCommBoardE(BoardEVO vo) throws Exception;
	/** 댓글 삭제 */
	public void deleteCommBoardE(int unq) throws Exception;
	/** 댓글 보기*/
	public BoardEVO selectBoardEComm(int unq) throws Exception;
	
}
