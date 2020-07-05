package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.ResumeVO;
import com.kakao.service.ResumeService;

public class ResumeInsertController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		ResumeService service = ResumeService.getInstance();
		res.setContentType("text/html; charset = UTF-8");
		PrintWriter out = res.getWriter();
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String field = req.getParameter("field");
		System.out.println("select field = " + field);
		int userNum = Integer.parseInt(req.getParameter("userNum"));
		System.out.println("userNum : " + userNum);
		ResumeVO resume = new ResumeVO();
		resume.setTitle(title);
		resume.setContent(content);
		resume.setField(field);
		service.insertResume(resume, userNum);
		out.println("<script type=\"text/javascript\">");
		out.println("alert('지원 완료');");
		out.println("location='Apply.jsp';");
		out.println("</script>");
		return;
	}

	
}
