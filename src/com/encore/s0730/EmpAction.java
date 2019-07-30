package com.encore.s0730;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0729.Emp;
import com.encore.s0729.EmpDAO;

public class EmpAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		EmpDAO dao = new EmpDAO();
		String deptnoStr = request.getParameter("deptno");

		int deptno = 0;
		if ("".equals(deptnoStr)) { // 부서정보를 받지 못했다면?
			System.out.println("jjj");
			deptno = dao.selectMinDeptNo();// 가장작은 부서명 조회
			request.setAttribute("msg", "success");
		} else { // 부서 정보를 받았다면?
			if (!deptnoStr.matches("[\\d]+")) {
				System.out.println("숫자입력필요");
				request.setAttribute("msg", "oops");
			} else {
				deptno = Integer.parseInt(deptnoStr);

				boolean isDeptNo = dao.selectDeptNo(deptno);
				if (!isDeptNo) {
					request.setAttribute("msg", "fail");
				} else {
					request.setAttribute("msg", "success");
				}
			}
		}

		List<Emp> list = (List<Emp>) dao.selectDeptInfo(deptno);// 조회
		System.out.println(list.size());
		// 뷰가 공유할 데이터를 저장 response8과함께
		request.setAttribute("list", list);
		request.setAttribute("deptno", deptno);

		return mapping.findForward("response");
	}

}
