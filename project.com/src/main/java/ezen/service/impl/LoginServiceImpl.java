package ezen.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.service.LoginService;


@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name="LoginDAO")
	LoginDAO loginDAO;
	@Override
	public int loginCheck(HashMap<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.loginDAO(map);
	}

}
