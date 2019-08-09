package com.encore.s0808.actions;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0808.dao.EmpDAO;

public class MissionAction3 extends Action {//컨트롤러

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	    String search =  request.getParameter("search");
	    //search = "ename" 또는 "deptno"
	    String keyword = request.getParameter("keyword");
	    System.out.println("search:"+search+", keyword:"+ keyword);
	    
	    EmpDAO dao = new EmpDAO();
	      Map<String, Object> map = new HashMap<>();
		    //map.put("ename","%S%");
		    //map.put("deptno",20);
	         map.put(search, keyword);
	         
	     request.setAttribute("list",dao.selectMission3(map));//데이터 저장
	    
		return mapping.findForward("success");
		//response3.jsp ==> 데이터 조회, 출력
	}
}
