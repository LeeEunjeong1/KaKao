package com.kakao.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FrontController extends HttpServlet{

	HashMap<String,Controller> list = null;
	String adminId = null;
	String adminPw = null;
	public void init(ServletConfig config) throws ServletException
	{
		list = new HashMap<String, Controller>();
		list.put("/memberInsert.do",new MemberInsertController());
		list.put("/idCheck.do",new IdCheckController());
		list.put("/registerCho.do",new RegisterCoinController());
		list.put("/memberSearch.do",new MemberSearchController());
		list.put("/buyProduct.do",new BuyProductController());
		list.put("/orderSearch.do",new OrderSearchController());
		list.put("/memberUpdate.do",new MemberUpdateController());
		list.put("/memberDelete.do",new MemberDeleteController());
		list.put("/memberLoginProcess.do",new MemberLoginProcessController());
		list.put("/adminLoginProcess.do",new AdminLoginProcessController());
		list.put("/resumeInsert.do",new ResumeInsertController());
		list.put("/resumeUpdate.do",new ResumeUpdateController());
		list.put("/resumeDelete.do",new ResumeDeleteController());
		list.put("/resumeSearch.do",new ResumeSearchController());
		list.put("/resumeSearchWN.do",new ResumeSearchWNController());
		list.put("/fieldSearch.do",new FieldSearchController());
		list.put("/fieldUpdate.do",new FieldUpdateController());
		list.put("/fieldInsert.do",new FieldInsertController());
		list.put("/fieldDelete.do",new FieldDeleteController());
		list.put("/fieldSearchDivision.do",new FieldSearchDivisionController());
		list.put("/productInsert.do",new ProductInsertController());
		list.put("/productUpdate.do",new ProductUpdateController());
		list.put("/productDelete.do",new ProductDeleteController());
		list.put("/productSearch.do",new ProductSearchController());
		adminId = config.getInitParameter("adminId");
		adminPw = config.getInitParameter("adminPw");
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String url = request.getRequestURI(); 
		String contextPath = request.getContextPath();
		String path = url.substring(contextPath.length());
		System.out.println("path : " + path);
		if(path.equals("/adminLoginProcess.do"))
		{
			request.setAttribute("adminId",adminId);
			request.setAttribute("adminPw",adminPw);
		}
		Controller subController = list.get(path);
		subController.execute(request, response);
	}
}
