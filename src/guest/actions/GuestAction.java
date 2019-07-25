package guest.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import guest.dao.GuestDAO;
import guest.vo.Guest;

public class GuestAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
		String action = req.getParameter("action");

		ActionForward forward = null;
		if (action.equals("form")) {
			forward = mapping.findForward("form");
		} else if (action.equals("insert")) {

			GuestDAO dao = new GuestDAO();
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String tel = req.getParameter("tel");
			String pass = req.getParameter("pass");
			String contents = req.getParameter("contents");

			Guest vo = new Guest();
			vo.setWriter(username);
			vo.setEmail(email);
			vo.setTel(tel);
			vo.setPass(pass);
			vo.setContents(contents);

			dao.insert(vo);
			forward = mapping.findForward("list");
		}

		return forward;
	}

}
