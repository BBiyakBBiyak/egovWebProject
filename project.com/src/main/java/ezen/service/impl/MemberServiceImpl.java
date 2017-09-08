package ezen.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ezen.service.MemberService;
import ezen.service.MemberVO;
import ezen.service.PageVO;

@Service("mbService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {
	
	@Resource(name="mbDAO")
	private MemberDAO memberDAO;
	
	
	@Override
	public int idCheck(String str) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.idCheck(str);
	}
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertMb(vo);
	}
	
	

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object selectMember(String id) throws Exception{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<?> selectAllList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMbAllList(vo);
	}

	@Override
	public int countAllList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.countAllList(vo);
	}

	@Override
	public List<?> selectPostNumList(String dong) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectPostNList(dong);
	}

	

}
