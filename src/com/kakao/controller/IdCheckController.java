package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.service.MemberService;

public class IdCheckController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset = UTF-8");
		MemberService service = MemberService.serviceGetInstance();
		PrintWriter out = res.getWriter();
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		boolean value = service.idCheckService(id);
		System.out.println("value : " + value);
		if(!value)
		{
			req.setAttribute("error","중복되는 아이디가 존재 합니다.");
			req.removeAttribute("id");
			System.out.println("아이디 중복");
			out.println("<script language = 'javascript'>");
			out.print("alert('아이디가 중복됩니다');");
			out.print("history.back(-1)");
			out.println("</script>");
			out.close();
			HttpUtil.forward(req, res,"join.jsp");
			return;
		}
		req.setAttribute("id",id);
		req.setAttribute("msg","사용할 수 있는 아이디입니다.");
		HttpUtil.forward(req, res,"join.jsp");
		/*out.println("<script language = 'javascript'>");
		out.print("alert('사용가능한 아이디입니다.');");
		out.print("history.back(-1)");
		out.println("</script>");
		out.close();*/
		return;
	}

	
}
