package com.buyme.young.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String userId;
	private String password;
	private String userName;
	private String gender;
	private Date birth;
	private String email;
	private String phone;
	private String address;
    private Date enrollDate;
    
    public Member(){}

	public Member(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}

	public Member(String userId, String password, String userName, String gender, Date birth, String email,
			String phone, String address) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public Member(String userId, String password, String userName, String gender, Date birth, String email,
			String phone, String address, Date enrollDate) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", userName=" + userName + ", gender=" + gender
				+ ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", enrollDate=" + enrollDate + "]";
	}
	
	
    
    

}
