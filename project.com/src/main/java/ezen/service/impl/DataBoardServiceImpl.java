package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ezen.service.BoardVO;
import ezen.service.DataBoardService;
import ezen.service.PageVO;

@Service("dataService")
public class DataBoardServiceImpl extends EgovAbstractServiceImpl implements DataBoardService{

	@Resource(name="dataDAO")
	private DataBoardDAO dataDAO;
	
	@Override
	public String insertDataBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataDAO.insertDataBoard(vo);
	}
	
	@Override
	public void updateDataBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dataDAO.updateDataBoard(vo);
	}
	
	@Override
	public void updateDataBoardHit(int unq) throws Exception {
		// TODO Auto-generated method stub
		dataDAO.updateDataBoardHit(unq);
	}
	
	@Override
	public BoardVO getDataBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataDAO.selectDataBoard(vo);
	}
	
	@Override
	public List<?> selectDataBoardList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dataDAO.selectDataBoardList(vo);
	}
	
	public int cntDataBoardList(PageVO vo) {
		// TODO Auto-generated method stub
		return dataDAO.cntDataBoardList(vo);
	}
	
	@Override
	public BoardVO selectDataBoard(int unq) throws Exception {
		return (BoardVO) dataDAO.selectDataBoard(unq);
	}

	@Override
	public void deleteDataFile(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dataDAO.deleteDataFile(vo);
	}

	


	

}
