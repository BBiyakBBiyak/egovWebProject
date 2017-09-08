package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import ezen.service.BoardEService;
import ezen.service.BoardEVO;
import ezen.service.PageVO;

@Repository ("boardEService")
public class BoardEServiceImpl implements BoardEService {
	
	@Resource(name="boardEdao")
	BoardEDAO eDao;
	
	@Override
	public void insertBoardE(BoardEVO vo) throws Exception {
		// TODO Auto-generated method stub
		eDao.insertBoardE(vo);
	}
	
	@Override
	public void insertCommBoardE(BoardEVO vo) throws Exception {
		// TODO Auto-generated method stub
		eDao.insertCommBoardE(vo);
	}

	@Override
	public void updateBoardE(BoardEVO vo) throws Exception {
		// TODO Auto-generated method stub
		eDao.updateBoardE(vo);
	}
	
	@Override
	public void updateBoardHit(int unq) throws Exception {
		// TODO Auto-generated method stub
		eDao.updateBoardHit(unq);
	}

	@Override
	public void deleteBoardE(int unq) throws Exception {
		eDao.deleteBoardE(unq);
	}

	@Override
	public List<?> selectEList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eDao.selectListBoardE(vo);
	}

	@Override
	public int cntEList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eDao.cntListBoardE(vo);
	}

	@Override
	public BoardEVO selectBoardE(int unq) throws Exception {
		// TODO Auto-generated method stub
		return eDao.selectBoardE(unq);
	}


	@Override
	public Boolean checkPassword(BoardEVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (boolean) eDao.checkPassword(vo);
	}

	@Override
	public List<?> selectECommList(int unq) throws Exception {
		// TODO Auto-generated method stub
		return eDao.selectCommListBoardE(unq);
	}

	@Override
	public void updateCommBoardE(BoardEVO vo) throws Exception {
		// TODO Auto-generated method stub
		eDao.updateCommBoardE(vo);
		
	}

	@Override
	public void deleteCommBoardE(int unq) throws Exception {
		// TODO Auto-generated method stub
		eDao.deleteCommBoardE(unq);
		
	}

	@Override
	public BoardEVO selectBoardEComm(int unq) throws Exception {
		// TODO Auto-generated method stub
		return (BoardEVO) eDao.selectBoardEComm(unq);
	}

}
