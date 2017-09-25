package com.seeya.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeya.login.model.Login;
import com.seeya.member.repository.MemberMapper;
import com.seeya.member.model.Member;

@Service
public class LoginService {

	@Autowired
	private MemberMapper memberMapper;
	
	public void checkMemeberLogin(Login login) {
		Member member = memberMapper.selectByMemberId(login.getMemberid());
		if(member == null) {
			login.setError("Check your ID.");
		} else {
			if( !member.getPassword().equals(login.getPassword())) {
				login.setError("check your password.");
			} else {
				login.setError(null);
			}
		}
	}
}
