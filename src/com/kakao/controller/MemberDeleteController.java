package com.kakao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.service.MemberService;

public class MemberDeleteController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberService service = MemberService.serviceGetInstance();
		int num = Integer.parseInt(req.getParameter("num"));
		service.MemberDeleteService(num);
		HttpUtil.forward(req, res,"userAdmin.jsp");
		return;
	}

	
}
