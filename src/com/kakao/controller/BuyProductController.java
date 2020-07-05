package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kakao.VO.MemberVO;
import com.kakao.service.MemberService;

public class BuyProductController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		MemberService service = MemberService.serviceGetInstance();
		MemberVO member = (MemberVO) session.getAttribute("cUser");
		int count = Integer.parseInt(req.getParameter("count"));
		String productName = req.getParameter("productName");
		int userNum = member.getNum();
		//int userNum = Integer.parseInt(req.getParameter("userNum"));
		int productNum = Integer.parseInt(req.getParameter("productNum"));
		int price = Integer.parseInt(req.getParameter("price"));
		int totalPrice = count * price;
		if(member.getCho() < totalPrice)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('초코가 부족합니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			return;
		}
		service.buyProduct(userNum, productNum, totalPrice, count, productName);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('구매완료');");
		out.println("location = 'myList.jsp';");
		out.println("</script>");
	}

	
}
