package com.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.FieldVO;
import com.kakao.service.FieldService;

public class FieldSearchDivisionController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FieldService service = FieldService.getInstance();
		String division = req.getParameter("division");
		ArrayList<FieldVO> list = service.getSearchDivisionFieldList(division);
		req.setAttribute("searchList", list);
		HttpUtil.forward(req, res, "ApplyNotice.jsp");
		return;
	}

	
}
