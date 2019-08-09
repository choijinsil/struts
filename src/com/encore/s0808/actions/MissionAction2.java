package com.encore.s0808.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0724.model.Calculator;

public class MissionAction2 extends Action {//컨트롤러

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
//http://localhost/struts/mission/response2.do?su1=10&su2=20&oper=+&subject=jquery&ajax
		
	    String su1 = request.getParameter("su1");
	    String su2 = request.getParameter("su2");
	    String oper = request.getParameter("oper");
	    
	    System.out.println("oper>>>"+ oper);
	    System.out.println("subject>>>"+ 
	                   request.getParameter("subject"));
	    
	    String result;
	    if(oper.equals("/")  &&  su2.equals("0")) {
	    	result = "<font color=red>0으로 나눌 수 없습니다</font>";
	    }else {
	    	Calculator calc = new Calculator(Integer.parseInt(su1),
	    			Integer.parseInt(su2), oper);
	    	result = "<font color=blue>"+calc.getResultStr()+"</font>";// result="결과값: 2+3=5"
	    }
		
	    request.setAttribute("result", result);
	    
		return mapping.findForward("success");//response2.jsp이동
	}
}
