package ezen.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import ezen.service.MemberVO;
import ezen.service.PageVO;

@Repository("mbDAO")
public class MemberDAO extends EgovAbstractDAO {
	
	public String insertMb(MemberVO vo) throws Exception {
		return (String) insert("member.insert", vo);
	}
	
	public int idCheck(String id) throws Exception {
		// id값으 던져 비교값을 int로 리턴(id가 존재하면 >0, 존재하지 않으면 0)
		return (int) select("member.idcheck", id);
	}
	
	
	public List<?> selectMbAllList(PageVO vo) throws Exception {
		return list("member.selectList", vo);
	}
	
	public int countAllList(PageVO vo) {
		return (Integer) select("member.countAllList", vo);
	}
	
	public List<?> selectPostNList(String dong) throws Exception {
		return list("get.postnumList", dong);
	}
}
