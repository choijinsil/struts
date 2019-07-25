package guest.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import guest.dao.GuestDAO;

public class GuestUpdateFormAction extends Action {
	// 수정폼 요청

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		GuestDAO dao = new GuestDAO();
		request.setAttribute("vo", dao.selectById(Integer.parseInt(request.getParameter("no"))));

		return mapping.findForward("edit");
	}
}
