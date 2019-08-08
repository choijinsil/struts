package com.encore.s0808.actions;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0724.forms.CalcActionForm;
import com.encore.s0724.model.Calculator;

public class MissionAction2 extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	System.out.println("execute()");

	CalcActionForm caf = (CalcActionForm) form;
	String su1 = caf.getSu1();
	String su2 = caf.getSu2();
	String oper = caf.getOper();

	Calculator cal = new Calculator(Integer.parseInt(su1)
									, Integer.parseInt(su2)
									, oper);
	request.getSession().setAttribute("result", cal.getResultStr()); 

	return mapping.findForward("mission2");
	}

}
