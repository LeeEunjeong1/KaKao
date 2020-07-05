package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.OrderVO;
import com.kakao.service.OrderService;

public class OrderSearchController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		OrderService service = OrderService.serviceGetInstance();
		String name = req.getParameter("name");
		ArrayList<OrderVO> list = service.orderSearch(name);
		System.out.println(list);
		if(list.isEmpty())
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('검색 결과 존재하지않습니다.');");
			out.println("location='orderAdmin.jsp';");
			out.println("</script>");
			return;
		}
		req.setAttribute("slist", list);
		HttpUtil.forward(req, res,"orderAdmin.jsp");
		return;		
	}

	
}
