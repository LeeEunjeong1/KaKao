package com.kakao.VO;

public class ResumeVO {

	private int num;
	private String title;
	private String content;
	private String field;
	private int userNum;

	public ResumeVO() {}
	
	public ResumeVO(String title,String content,String field)
	{
		this.title = title;
		this.content = content;
		this.field = field;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
}
