package com.encore.s0724.forms;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class TestActionForm extends ActionForm {
	// 유효성검사하기 위한 속성정의

	private String username;
	private String userage;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserage() {
		return userage;
	}

	public void setUserage(String userage) {
		this.userage = userage;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		// error List로 생각해도된다.

		System.out.println("validate()");
		ActionErrors err = new ActionErrors();
		// err.add("encore",new ActionMessage("mymsg" ));// 바구니에 error메세지 담기

		return err; // 에러메세지를 담는 바구니( 에러있으면 execute실행 아니면 null리턴)
	}
}
