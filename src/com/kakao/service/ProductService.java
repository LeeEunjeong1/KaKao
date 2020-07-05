package com.kakao.service;

import java.util.ArrayList;

import com.kakao.VO.ProductVO;
import com.kakao.dao.KakaoDao;

public class ProductService {

	private static ProductService service = new ProductService();
	private ProductService() {};
	public static ProductService serviceGetInstance()
	{
		return service;
	}
	KakaoDao dao = KakaoDao.getInstance();
	
	public ArrayList<ProductVO> getProductList()
	{
		return dao.getProductList();
	}
	
	public ArrayList<ProductVO> getProductList(String category, String cha)
	{
		return dao.getProductList(cha, category);
	}
	
	public ArrayList<ProductVO> getProductListOrder(String category, String cha)
	{
		return dao.getProductListByOrder(cha, category);
	}
	public ProductVO searchProduct(String name) {
		// TODO Auto-generated method stub
		return dao.searchProduct(name);
	}
	public void updateProduct(ProductVO vo, int num) {
		// TODO Auto-generated method stub
		dao.updateProduct(vo, num);
	}
	public void insertProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		dao.insertProduct(vo);
	}
	public void deleteProduct(int num) {
		// TODO Auto-generated method stub
		dao.deleteProduct(num);
	}
}
