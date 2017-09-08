package ezen.service;

import java.util.List;

public interface ResearchService {

	public void insertResearch(ResearchVO rVO) throws Exception;
	public void insertResearchSub(ResearchVO rVO) throws Exception;
	
	public List<?> selectReSearchList(PageVO pVO) throws Exception;
	public int cntReSearchList(PageVO pVO) throws Exception;
	
	// main노출 설문조사
	public List<?> selectRSUseList(String today) throws Exception;
	public List<?> selectRSUseSubList(String mcd) throws Exception;
}
