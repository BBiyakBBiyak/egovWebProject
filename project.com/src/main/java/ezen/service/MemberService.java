package ezen.service;

import java.util.List;

public interface MemberService {
	

	public String insertMember(MemberVO vo) throws Exception;
	public int idCheck(String str) throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
	
	public void deleteMember(MemberVO vo) throws Exception;
	
	public Object selectMember(String id) throws Exception;
	
	public List<?> selectAllList(PageVO vo) throws Exception;
	
	public int countAllList(PageVO vo) throws Exception;
	
	public List<?> selectPostNumList(String dong) throws Exception;
	
}
