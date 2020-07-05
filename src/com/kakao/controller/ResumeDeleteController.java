package com.kakao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.ResumeVO;
import com.kakao.service.ResumeService;

public class ResumeDeleteController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ResumeService service = ResumeService.getInstance();
		int userNum =  Integer.parseInt(req.getParameter("userNum"));
		service.deleteResume(userNum);
		HttpUtil.forward(req, res,"Apply.jsp");
		return;
	}

	
}
