package com.kakao.VO;

public class MemberVO {

	private int num;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String address;
	private String gender;
	private String phone;
	private String birthDate;
	private int cho;
	
	public MemberVO()
	{
		
	}
	
	public MemberVO(String id, String pw,String name,String email, String address
			,String gender, String phone, String birthDate)
	{
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.address = address;
		this.gender = gender;
		this.phone = phone;
		this.birthDate = birthDate;
	} //회원가입할때 데이터를 나르는 용도
	
	public MemberVO(String id, String pw,String name,String email, String address
			,String gender, String phone, String birthDate, int cho)
	{
		this(id,pw,name,email,address,gender,phone,birthDate);
		this.cho = cho;
	} //초콜릿을 등록한후 다음 행동을 실행할때 초콜릿을 업데이트 시켜주는 용도
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCho() {
		return cho;
	}

	public void setCho(int cho) {
		this.cho = cho;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
