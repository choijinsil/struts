package com.encore.s0724.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0724.forms.TestActionForm;

public class TestAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("execute()");
		
		TestActionForm taf= (TestActionForm) form;
		
		String name=  taf.getUsername();
		String age= taf.getUserage();
		
		System.out.println("이름>>"+name+", 나이>>"+age);
		return mapping.findForward("siri");
	}
}
