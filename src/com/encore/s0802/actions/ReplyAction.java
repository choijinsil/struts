package com.encore.s0802.actions;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0802.dao.ReplyDAO;
import com.encore.s0802.vo.Reply;

public class ReplyAction extends Action {
	// Acion==컨트롤러

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// insert, delete, update, list
		// 1. 요청 URL 분석
		String go = request.getParameter("go");
		String forName = null;
		ReplyDAO dao = new ReplyDAO();

		switch (go) {
		case "list": {
			request.setAttribute("list", dao.findAll());
			forName = "list";
		}
			break;

		case "insert": {// 댓글 입력요청
			// 포인트: DB입력
			String name = request.getParameter("name");
			String content = request.getParameter("content");

			// Reply vo = new Reply(0, name, content);
			Reply vo = new Reply();
			vo.setName(name);
			vo.setContent(content);

			if (dao.create(vo)) {
				request.setAttribute("msg", "success");
			} else {
				request.setAttribute("msg", "fail");
			}
			forName = "result";

		}
			break;

		case "update": {

			String name = request.getParameter("name");
			String content = request.getParameter("content");
			int no = Integer.parseInt(request.getParameter("no"));
			Reply vo = new Reply(no, name, content);
//				request.setAttribute("msg", "수정성공!");
//			}else {
//				request.setAttribute("msg", "수정실패!");
//			}
//			forName = "result";
			// 간단메세지의 경우 jsp페이지 없이 text만 전달 가능
			PrintWriter out = response.getWriter();
			if (dao.modify(vo)) {
				out.print("UpdateSuccess");
			} else {
				out.print("UpdateFail");
			}
			return null;

			}
		case "delete":{

			int no = Integer.parseInt(request.getParameter("no"));
			
			PrintWriter out = response.getWriter();
			if (dao.delete(no)) {
				out.print("DeleteSuccess");
			} else {
				out.print("DeleteFail");
			}
			return null;
		}
			
		}

		return mapping.findForward(forName);
	}
}
