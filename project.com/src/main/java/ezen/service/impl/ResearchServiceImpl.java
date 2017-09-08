package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import ezen.service.PageVO;
import ezen.service.ResearchService;
import ezen.service.ResearchVO;

@Repository(value="ResearchService")
public class ResearchServiceImpl implements ResearchService {

	@Resource(name="ResearchDAO")
	private ResearchDAO rDao;
	
	@Override
	public void insertResearch(ResearchVO rVO) throws Exception {
		// TODO Auto-generated method stub
		rDao.insertReSearch(rVO);
		
	}

	@Override
	public void insertResearchSub(ResearchVO rVO) throws Exception {
		// TODO Auto-generated method stub
		rDao.insertReSearchSub(rVO);
	}

	@Override
	public List<?> selectReSearchList(PageVO pVO) throws Exception {
		// TODO Auto-generated method stub
		return rDao.selectReSearchList(pVO);
	}

	@Override
	public int cntReSearchList(PageVO pVO) throws Exception {
		// TODO Auto-generated method stub
		return rDao.cntReSearchList(pVO);
	}

	// main노출 list
	@Override
	public List<?> selectRSUseList(String today) throws Exception {
		// TODO Auto-generated method stub
		return rDao.selectRSUseList(today);
	}

	@Override
	public List<?> selectRSUseSubList(String mcd) throws Exception {
		// TODO Auto-generated method stub
		return rDao.selectRSUseSubList(mcd);
	}

	

}
