package ezen.service.impl;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository(value="LoginDAO")
public class LoginDAO extends EgovAbstractDAO {
	
	public int loginDAO (HashMap<String, String> param) throws Exception {
		return (int)select("login.check", param);
	}
}
