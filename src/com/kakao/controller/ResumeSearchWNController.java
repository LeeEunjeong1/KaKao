package com.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.ResumeVO;
import com.kakao.service.ResumeService;

public class ResumeSearchWNController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResumeService service = ResumeService.getInstance();
		String name = req.getParameter("name");
		System.out.println("name in con : " + name);
		ArrayList<ResumeVO> list = service.searchResumeWN(name);
		req.setAttribute("searchList",list);
		HttpUtil.forward(req, res,"ApplyAdmin.jsp");
		return;
	}

	
}
