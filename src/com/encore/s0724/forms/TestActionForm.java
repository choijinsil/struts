package com.encore.s0724.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class TestActionForm extends ActionForm{
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		//error List로 생각해도된다. 
		System.out.println("validate()");
		ActionErrors err= new ActionErrors();
		err.add("encore",new ActionMessage("mymsg" ));// 바구니에 error메세지 담기
		
		return err; // 에러메세지를 담는 바구니( 에러있으면 execute실행 아니면 null리턴)
	}
}
