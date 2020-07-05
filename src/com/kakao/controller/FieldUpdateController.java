package com.kakao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.FieldVO;
import com.kakao.service.FieldService;

public class FieldUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		FieldService service = FieldService.getInstance();
		String name = req.getParameter("name");
		String explain = req.getParameter("explain");
		String division = req.getParameter("division");
		String employeeType = req.getParameter("employeeType");
		String workPlace = req.getParameter("workPlace");
		System.out.println("workPlace : " + workPlace);
		int recruitNum = Integer.parseInt(req.getParameter("recruitNum"));
		int num = Integer.parseInt(req.getParameter("num"));		
		FieldVO field = new FieldVO();
		field.setName(name);
		field.setDivision(division);
		field.setEmployeeType(employeeType);
		field.setExplain(explain);
		field.setNum(num);
		field.setRecruitNum(recruitNum);
		field.setWorkPlace(workPlace);
		service.updateField(field,num);
		HttpUtil.forward(req, res, "FieldAdmin.jsp");
		return;
	}

	
}
