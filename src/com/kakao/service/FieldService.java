package com.kakao.service;

import java.util.ArrayList;

import com.kakao.VO.FieldVO;
import com.kakao.dao.KakaoDao;

public class FieldService {

	KakaoDao dao = KakaoDao.getInstance();
	private static FieldService service = new FieldService();
	private FieldService() {}
	public static FieldService getInstance()
	{
		return service;
	}
	
	public FieldVO searchField(String name)
	{
		return dao.searchField(name);
	}
	public void updateField(FieldVO field, int num)
	{
		dao.fieldUpdate(field, num);
	}
	public ArrayList<FieldVO> getFieldList()
	{
		return dao.getFieldList();
	}
	
	public ArrayList<FieldVO> getSearchDivisionFieldList(String division)
	{
		return dao.fieldDivisionSearch(division);
	}
	public void insertField(FieldVO field) {
		// TODO Auto-generated method stub
		dao.insertField(field);
	}
	public void fieldDelete(int num) {
		// TODO Auto-generated method stub
		dao.fieldDelete(num);
	}
}
