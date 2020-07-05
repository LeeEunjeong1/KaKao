package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kakao.VO.MemberVO;
import com.kakao.service.MemberService;


public class AdminLoginProcessController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		String id = req.getParameter("member_id");
		System.out.println("id = " + id);
		String pw = req.getParameter("member_password");
		System.out.println("pw = " + pw);
		//System.out.println("pwChk = " + pwChk);
		if((req.getMethod()).equals("GET"))
		{
			session.removeAttribute("admin");
			HttpUtil.forward(req, res,"index.jsp");
			return;
		}
		if(id.isEmpty() || pw.isEmpty())
		{
			//System.out.println("빈칸 오류");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('빈칸 오류.');");
			out.println("location='LoginAdmin.jsp';");
			out.println("</script>");
			return;
		}
		System.out.println("adminid : " + req.getParameter("adminId"));
		System.out.println("adminpw : " + req.getParameter("adminPw"));
		if(id.equals(req.getAttribute("adminId")) && pw.equals(req.getAttribute("adminPw")))
		{
			session.setAttribute("admin","true");
			HttpUtil.forward(req, res,"indexAdmin.jsp");
			return;
		}
		
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('관리자 로그인 실패.');");
			out.println("location='LoginAdmin.jsp';");
			out.println("</script>");
			return;
		}
	}
	}

	

