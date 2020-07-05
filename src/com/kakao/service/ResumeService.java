package com.kakao.service;

import java.util.ArrayList;

import com.kakao.VO.FieldVO;
import com.kakao.VO.ResumeVO;
import com.kakao.dao.KakaoDao;

public class ResumeService {

	private static ResumeService service = new ResumeService();
	private ResumeService() {}
	public static ResumeService getInstance()
	{
		return service;
	}
	
	KakaoDao dao = KakaoDao.getInstance();
	public ArrayList<FieldVO> getFieldList()
	{
		return dao.getFieldList();
	}
	
	public void insertResume(ResumeVO resume,int userNum)
	{
		dao.resumeInsert(resume, userNum);
	}
	
	public void updateResume(ResumeVO resume, int userNum)
	{
		dao.resumeUpdate(resume, userNum);
	}
	
	public ResumeVO searchResume(String id)
	{
		return dao.searchResume(id);
	}
	public ArrayList<ResumeVO> searchResumeWN (String name)
	{
		return dao.searchResumeWN(name);
	}
	public void deleteResume(int userNum)
	{
		dao.resumeDelete(userNum);
	}
	public ResumeVO showResume(int num)
	{
		return dao.showResume(num);
	}
	public ArrayList<ResumeVO> getResumeList()
	{
		return dao.getResumeList();
	}
	
}
