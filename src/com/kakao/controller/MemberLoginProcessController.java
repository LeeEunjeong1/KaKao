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


public class MemberLoginProcessController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		MemberService service = MemberService.serviceGetInstance();
		String id = req.getParameter("member_id");
		System.out.println("id = " + id);
		String pw = req.getParameter("member_password");
		System.out.println("pw = " + pw);
		String pwChk = service.MemberLoginProcessService(id);
		System.out.println("pwChk = " + pwChk);
		//System.out.println("pwChk = " + pwChk);
		HttpSession s = req.getSession();
		if((req.getMethod()).equals("GET"))
		{
			s.removeAttribute("cUser");
			HttpUtil.forward(req, res,"index.jsp");
			return;
		}
		/*if(id == null)
		{
			System.out.println("id 는 null");
		}*/
		if(id.isEmpty() || pw.isEmpty())
		{
			//System.out.println("빈칸 오류");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('빈칸 오류.');");
			out.println("location='login.jsp';");
			out.println("</script>");
			return;
		}
		if(id.equals(req.getAttribute("adminId")) && pw.equals(req.getAttribute("adminPw")))
		{
			HttpUtil.forward(req, res,"");
			return;
		}
		if(pwChk == null)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('아이디 존재 x.');");
			out.println("location='login.jsp';");
			out.println("</script>");
			return;
		}
		
		else if(pw.equals(pwChk))
		{
			if(s.getAttribute("cUser") != null)
			{
				System.out.println("중복 로그인");
				out.print("<script language = 'javascript'>");
				out.print("alert('중복로그인')");
				out.print("</script>");
				HttpUtil.forward(req, res,"login.jsp");
				return;
			}
			MemberVO member = null;
			ArrayList<MemberVO> list = service.getMemberList();
			for(MemberVO memberChk : list)
			{
				if((memberChk.getId()).equals(id))
				{
					member = memberChk;
				}
			}
			System.out.println(member.getId() + "님 로그인 완료");
			s.setAttribute("cUser",member);
			HttpUtil.forward(req, res,"index.jsp");
			return;
		}
		
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('비밀번호 틀림.');");
			out.println("location='login.jsp';");
			out.println("</script>");
			/*out.print("<script language = 'javascript'>");
			out.print("alert('비밀번호 틀림')");
			out.print("</script>");
			HttpUtil.forward(req, res,"/index.jsp");*/
			return;
		}
	}
	}

	

