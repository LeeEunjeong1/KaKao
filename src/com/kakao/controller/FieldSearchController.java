package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.FieldVO;
import com.kakao.service.FieldService;

public class FieldSearchController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		FieldService service = FieldService.getInstance();
		String name = req.getParameter("name");
		FieldVO field = service.searchField(name);
		if(field==null)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('검색 결과 존재하지않습니다.');");
			out.println("location='FieldAdmin.jsp';");
			out.println("</script>");
			return;
		}
		req.setAttribute("sField",field);
		HttpUtil.forward(req, res,"FieldAdmin.jsp");
	}

	
}
