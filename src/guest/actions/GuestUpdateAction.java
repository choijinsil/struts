package guest.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import guest.dao.GuestDAO;
import guest.vo.Guest;

public class GuestUpdateAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
		// 수정처리

		GuestDAO dao = new GuestDAO();
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		String pass = req.getParameter("pass");
		String contents = req.getParameter("contents");
		String no = req.getParameter("no");

		Guest vo = new Guest();
		vo.setWriter(username);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setPass(pass);
		vo.setContents(contents);
		vo.setNo(Integer.parseInt(no));

		dao.update(vo);
		return mapping.findForward("list");
	}

}
