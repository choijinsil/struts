package com.encore.s0724.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginActionForm extends ActionForm {
	// ActionForm: 사용자가 입력한 데이터를 검사(유효성 검사)
	// --> 유효성검사에 필요한 필드 정의(HTML name과 일치하는 속성정의, 속성에 대한 게터세터)
	// 주의 private int age보다 String age를 사용하는게 좋다. 왜?
	// setAge(Integer.parseInt(request.getParameter("age"))) <-- getParameter속성이
	// String이라 자동으로 Integer.parseInt
	// 를 해준다. 이때 NumberFormatException발생 가능성이 있다. 숫자로 형변환은 excecute때 하면 된다.

	private String id;
	private String pass;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		// 유효성 검사! (id>>빈값, 중간에 공백문자 포함, pass>>빈값)
		System.out.println("validate() 호출!");
		ActionErrors err = new ActionErrors(); // 에러(빈)바구니 생성

		if (id == null || id.length() == 0) {
			err.add("errid", new ActionMessage("invalidid", "아이디 입력!")); // {0}안에 들어간다.
		} else if (id.indexOf(" ") > -1 || id.indexOf("\t") >= 0 || id.contains("\n")) { // 아이디: 공백문자
			err.add("errid", new ActionMessage("invalidid", "아이디 공백을 제거!"));
		}

		if (pass == null || "".equals(pass)) {
			err.add("errpass", new ActionMessage("invalidpass"));
		}

		return err;
	}

}
