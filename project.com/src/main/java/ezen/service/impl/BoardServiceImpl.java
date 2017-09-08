package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ezen.service.BoardService;
import ezen.service.BoardVO;
import ezen.service.PageVO;

@Service("Service")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService{

	@Resource(name="DAO")
	private BoardDAO bDAO;
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bDAO.insertBoard(vo);
	}
	
	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		bDAO.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		bDAO.deleteBoard(vo);		
	}

	
	@Override
	public List<?> selectBoardList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bDAO.selectBoardList(vo);
	}

	
	@Override
	public int countAllList(PageVO vo) {
		// TODO Auto-generated method stub
		return bDAO.countAllList(vo);
	}

	@Override
	public BoardVO selectBoard(int unq) throws Exception {
		// TODO Auto-generated method stub
		BoardVO resultVO = bDAO.selectBoard(unq);
		if (resultVO == null)
			throw processException("***Null Exception : BoardVO값이 null입니다.");
		return resultVO;
	}


	@Override
	public int updateBoardHit(int unq) throws Exception {
		// TODO Auto-generated method stub
		return bDAO.updateBoardHit(unq);
	}

	@Override
	public Boolean checkPassword(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bDAO.checkPassword(vo);
	}

	@Override
	public String maxThread(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (String)bDAO.selectMaxThread(vo);
	}

	@Override
	public String insertComment(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (String)bDAO.insertComm(vo);
	}

	@Override
	public int countCommnet(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)bDAO.countComment(vo);
	}
}
