package com.kakao.VO;

public class FieldVO {

	private String name;
	private String explain;
	private String workPlace;
	private String employeeType;
	private String division;
	private int num;
	private int recruitNum;

	public FieldVO(){}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRecruitNum() {
		return recruitNum;
	}

	public void setRecruitNum(int recruitNum) {
		this.recruitNum = recruitNum;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getEmployeeType() {
		return employeeType;
	}

	public void setEmployeeType(String employeeType) {
		this.employeeType = employeeType;
	}
	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

}
