package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.service.MemberService;

public class RegisterCoinController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		MemberService service = MemberService.serviceGetInstance();
		req.setCharacterEncoding("UTF-8");
		int coin = Integer.parseInt(req.getParameter("coin"));
		if(coin < 0 )
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('0이상의 수만 가능합니다.');");
			out.println("location='coin.jsp';");
			out.println("</script>");
			return;
		}
		int num = Integer.parseInt(req.getParameter("num")); 
		service.registerCoin(coin,num);
		HttpUtil.forward(req, res,"shopping.jsp");
	}

}
