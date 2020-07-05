package com.kakao.service;

import java.util.ArrayList;

import com.kakao.VO.MemberVO;
import com.kakao.dao.KakaoDao;

public class MemberService {

	private static MemberService service = new MemberService();
	private MemberService() {};
	public static MemberService serviceGetInstance()
	{
		return service;
	}
	KakaoDao dao = KakaoDao.getInstance();
	public boolean idCheckService(String id)
	{
		return dao.idCheck(id);
	}
	public void MemberInsertService(MemberVO member)
	{
		dao.memberInsert(member);
	}
	
	public String MemberLoginProcessService(String id)
	{
		return dao.MemberLoginProcess(id);
	}
	
	public MemberVO MemberSearhchService(String id)
	{
		return dao.MemberSearch(id);
	}
	public MemberVO MemberUpdate(int num)
	{
		return dao.MemberUpdate(num);
	}
	public void MemberUpdateService(MemberVO member, int num)
	//어드민 버전
	{
		dao.MemberUpdate(member, num);
	}
	
	public void MemberUpdateService(MemberVO member)
	//유저 버전
	{
		dao.MemberUpdate(member);
	}
	
	public void MemberDeleteService(int num)
	{
		dao.MemberDelete(num);
	}
	
	public String getMemberId(int num)
	{
		return dao.getMemberId(num);
	}
	public ArrayList<MemberVO> getMemberList()
	{
		return dao.memberList();
	}
	public void registerCoin(int coin, int num) {
		// TODO Auto-generated method stub
		dao.registerCoin(coin,num);
	}
	public void buyProduct(int userNum,int productNum, int totalPrice,int count, String productName)
	{
		dao.buyProduct(userNum, productNum, totalPrice, count, productName);
	}
}
