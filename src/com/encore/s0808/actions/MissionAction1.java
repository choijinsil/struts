package com.encore.s0808.actions;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class MissionAction1 extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String name=request.getParameter("name");
		System.out.println(name);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out= response.getWriter();
		out.print("안녕, "+name+"!!");
		
		return null;
	}

}
