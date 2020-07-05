package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.ResumeVO;
import com.kakao.service.ResumeService;

public class ResumeSearchController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		ResumeService service = ResumeService.getInstance();
		String id = req.getParameter("id");
		ResumeVO resume = service.searchResume(id);
		if(resume==null)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('검색 결과 존재하지않습니다.');");
			out.println("location='ApplyAdmin.jsp';");
			out.println("</script>");
			return;
		}
		req.setAttribute("sResume",resume);
		HttpUtil.forward(req, res, "ApplyAdmin.jsp");
		return;
		
	}

	
}
