package com.kakao.service;

import java.util.ArrayList;

import com.kakao.VO.OrderVO;
import com.kakao.dao.KakaoDao;

public class OrderService {

	private static OrderService service = new OrderService();
	private OrderService() {};
	public static OrderService serviceGetInstance()
	{
		return service;
	}
	KakaoDao dao = KakaoDao.getInstance();

	public ArrayList<OrderVO> orderSearch(String name)
	{
		return dao.searchOrder(name);
	}
	
	public ArrayList<OrderVO> getOrderList()
	{
		return dao.getOrderList();
	}
	
	public ArrayList<OrderVO> getOrderList(int userNum)
	{
		return dao.getOrderList(userNum);
	}
}
