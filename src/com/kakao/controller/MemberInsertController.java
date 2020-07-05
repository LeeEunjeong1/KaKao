package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.MemberVO;
import com.kakao.dao.KakaoDao;
import com.kakao.service.MemberService;

public class MemberInsertController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		MemberService service = MemberService.serviceGetInstance();
		String id = req.getParameter("id");
		String pw = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email  = req.getParameter("email");
		String address = req.getParameter("address");
		String phone = req.getParameter("hp1");
		String birthDate = req.getParameter("birthDate");
		String gender = req.getParameter("gender"); 
		if(email.isEmpty()||name.isEmpty()||address.isEmpty()||id.isEmpty()||pw.isEmpty()||email.isEmpty()
				||phone.isEmpty()||birthDate.isEmpty()||gender.isEmpty())
		{
			req.setAttribute("error","모든 칸을 입력해주세요");
			HttpUtil.forward(req, res,"join.jsp");
			return;
		}
		MemberVO member = new MemberVO(id,pw,name,email,address,gender,phone,birthDate);
		service.MemberInsertService(member);
		if(KakaoDao.getIdchk())
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('중복된 아이디가 존재합니다.');");
			out.println("location='join.jsp';");
			out.println("</script>");
			return;
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('회원가입 성공! 환영합니다.');");
			out.println("location='index.jsp';");
			out.println("</script>");
		}
	}

	
}
