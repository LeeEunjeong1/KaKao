package com.kakao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.ResumeVO;
import com.kakao.service.ResumeService;

public class ResumeUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		ResumeService service = ResumeService.getInstance();
		ResumeVO resume = new ResumeVO();
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String field = req.getParameter("field");
		int userNum =  Integer.parseInt(req.getParameter("userNum"));
		resume.setTitle(title);
		resume.setContent(content);
		resume.setField(field);
		service.updateResume(resume, userNum);
		HttpUtil.forward(req, res,"Apply.jsp");
		return;
	}

	
}
