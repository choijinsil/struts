package com.encore.s0723.dao;

import java.util.HashMap;

import com.encore.s0723.vo.UserInfo;

public class LoginProcess {
	// HashMap==DB(데이터 저장소)
	HashMap<String, String> userPasswords; // 아이디와비번
	HashMap<String, UserInfo> userInfos; // 아이디와 사용자 정보

	public LoginProcess() {
		userPasswords = new HashMap<String, String>();
		userInfos = new HashMap<String, UserInfo>();

		userPasswords.put("siri", "1111");
		userPasswords.put("sani", "2222");
		userPasswords.put("hey", "3333");
		userInfos.put("siri", new UserInfo("시리", "siri@naver.com", "010-8787-8787"));
		userInfos.put("sani", new UserInfo("사니", "sani0422@naver.com", "010-1234-1234"));
		userInfos.put("hey", new UserInfo("헤이", "hey!@naver.com", "011-9797-7777"));
	}

	// 로그인체크
	public UserInfo login(String id, String pass) {
		// id, pass는 HTML폼으로부터 전달된데이터
		String dbPass = userPasswords.get(id);
		if (dbPass == null) {
			return null; // 아이디가 존재하지 않는다면
		}
		if (!dbPass.equals(pass)) { // 비밀번호가 일치하지 않는다면
			return null;
		}

		UserInfo user = userInfos.get(id);
		return user;
	}
}
