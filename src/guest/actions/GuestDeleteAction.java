package guest.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import guest.dao.GuestDAO;

public class GuestDeleteAction extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		GuestDAO dao= new GuestDAO();
		String no=request.getParameter("no");
		System.out.println("삭제번호: "+no);
		dao.delete(Integer.parseInt(no));
		return mapping.findForward("list");
	}

}
