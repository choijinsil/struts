package com.encore.s0724.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.encore.s0723.dao.LoginProcess;
import com.encore.s0723.vo.UserInfo;
import com.encore.s0724.forms.LoginActionForm;

public class LoginAction extends Action {
	// Action==Controller
	// Action은 추가적인 유효성 검사
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("execute()");
		// ActionForm form= new LoginActionForm();

		// Action만 사용시 --> String id= request.getParameter("id");
		// ActionForm과 Action사용시 -->String id=form.getId(); 유효성검증된 데이터를 받겠음
		LoginActionForm laf = (LoginActionForm) form;
		String id = laf.getId(); // 절대 빈값x, 아이디내에 공백문자x
		String pass = laf.getPass();
		
		LoginProcess lp = new LoginProcess();
		UserInfo user = lp.login(id, pass);
		if (user == null) {
			ActionMessages msgs = new ActionMessages();// 메시지를 담는 바구니 객체
			// 글로벌 메세지 추가
			msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("invalidlogin"));
			saveMessages(request, msgs); // 뷰와 공유하기 위해 저장
			return mapping.getInputForward(); // action태그의 input속성에 정의된 페이지를 리턴
		} else { // 로그인 성공
			// 세션에 사용자 정보 저장
			request.getSession().setAttribute("user", user);

		}
		return mapping.findForward("loginForm");
		// action태그 내의 자식태그<forward name="loginForm"정의
	}
}
