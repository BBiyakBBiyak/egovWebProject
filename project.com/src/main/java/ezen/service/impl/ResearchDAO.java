package ezen.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.PageVO;
import ezen.service.ResearchVO;

@Repository(value="ResearchDAO")
public class ResearchDAO extends EgovAbstractDAO{

	public void insertReSearch(ResearchVO rVO) throws Exception {
		insert("rschMain.insert", rVO);
	}
	public void insertReSearchSub(ResearchVO rVO) throws Exception {
		insert("rschSub.insert", rVO);
	}
	
	public List<?> selectReSearchList(PageVO vo) throws Exception {
		return list("rschList.select", vo);
	}
	public int cntReSearchList(PageVO vo) throws Exception {
		return (int) select("rschList.count", vo);
	}
	
	// main노출 설문조사
	public List<?> selectRSUseList(String today) throws Exception {
		return list("rschUseList.select");
	}
	public List<?> selectRSUseSubList(String mcd) throws Exception {
		return list("rschSubList.select", mcd);
	}
}
