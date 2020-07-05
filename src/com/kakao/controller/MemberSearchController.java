package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.MemberVO;
import com.kakao.service.MemberService;

public class MemberSearchController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		String id = req.getParameter("searchBox");
		MemberService service = MemberService.serviceGetInstance();
		MemberVO member = service.MemberSearhchService(id);
		if(member == null)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('검색 결과 존재하지않습니다.');");
			out.println("location='userAdmin.jsp';");
			out.println("</script>");
			return;
		}
		req.setAttribute("sUser",member);
		HttpUtil.forward(req, res,"userAdmin.jsp");
		return;
	}

	
}
