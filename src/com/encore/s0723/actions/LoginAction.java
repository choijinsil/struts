package com.encore.s0723.actions;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0723.dao.LoginProcess;
import com.encore.s0723.vo.UserInfo;

public class LoginAction extends Action { // Action ==Servlet Controller

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		/*
		 * ActionMapping: struts-config.xml에 매핑된 정보 얻어오기 
		 * ActionForm: 유효성 검사를 끝마친<form>안의 데이터 저장된 정보 얻어오기 
		 * ActionForward: execute()메소드 실행 후 이동할 페이지에 대한 정보를 담는 클래스
		 */

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		LoginProcess lp = new LoginProcess();
		UserInfo user = lp.login(id, pass);
		ActionForward forward;
		if (user == null) { // id가 존재하지 않거나 비번이 일치x
			forward = mapping.findForward("fail");
		} else { // 아이디존재, 비번 일치 (로그인 성공)
			forward = mapping.findForward("success");
			req.setAttribute("user", user);
		}

		return forward;
	}
}
