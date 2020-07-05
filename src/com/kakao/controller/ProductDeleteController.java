package com.kakao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.ProductVO;
import com.kakao.service.ProductService;

public class ProductDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService service = ProductService.serviceGetInstance();
		int num = Integer.parseInt(req.getParameter("num"));
		service.deleteProduct(num);
		HttpUtil.forward(req, res,"ProductAdmin.jsp");
		return;
	}

}
