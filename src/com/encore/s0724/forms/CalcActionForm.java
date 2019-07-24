package com.encore.s0724.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class CalcActionForm extends ActionForm {

	private String su1;
	private String su2;
	private String oper;

	public String getSu1() {
		return su1;
	}

	public void setSu1(String su1) {
		this.su1 = su1;
	}

	public String getSu2() {
		return su2;
	}

	public void setSu2(String su2) {
		this.su2 = su2;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		// 유효성 검사! (id>>빈값, 중간에 공백문자 포함, pass>>빈값)

		System.out.println("validate() 호출!");
		ActionErrors err = new ActionErrors(); // 에러(빈)바구니 생성
		if (su1 != null) {
			if (su1.equals("") || su2.equals("")) {
				err.add("siri", new ActionMessage("공백안되요. 데이터를 입력하세요", false));
				System.out.println("공백안되요.");
			} else if (!su1.matches("[0-9]+") || !su2.matches("[0-9]+")) {
				System.out.println("숫자를 입력해주세요.");
				err.add("siri", new ActionMessage("숫자를 입력 하세요!", false));
			} else if ("/".equals(oper) && "0".equals(su2)) {
				err.add("siri", new ActionMessage("0으로 나눌수 없어요!", false));
			}
		}else {
			err.add("siri", new ActionMessage("잘못된 접근입니다.", false));
		}
		return err;
	}
}
