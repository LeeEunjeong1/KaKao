package com.kakao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.service.FieldService;

public class FieldDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		FieldService service = FieldService.getInstance();
		int num = Integer.parseInt(req.getParameter("num"));
		service.fieldDelete(num);
		HttpUtil.forward(req, res, "FieldAdmin.jsp");
	}

}
