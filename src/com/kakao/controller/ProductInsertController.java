package com.kakao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.VO.ProductVO;
import com.kakao.service.ProductService;

public class ProductInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService service = ProductService.serviceGetInstance();
		req.setCharacterEncoding("UTF-8");
		ProductVO vo = new ProductVO();
		String name = req.getParameter("name");
		int price = Integer.parseInt(req.getParameter("price"));
		String image = req.getParameter("image");
		String detail = req.getParameter("detail");
		String category = req.getParameter("category");
		String cha = req.getParameter("cha");
		vo.setName(name);
		vo.setDetail(detail);
		vo.setImage(image);
		vo.setPrice(price);
		vo.setCategory(category);
		vo.setCha(cha);
		service.insertProduct(vo);
		HttpUtil.forward(req, res,"ProductAdmin.jsp");
		return;
	}

}
