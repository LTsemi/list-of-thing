package com.buyme.young.wishList.model.vo;

public class Wishlist {
	
	private String pno;
	private String userid;
	
	public Wishlist(){
		
	}

	public Wishlist(String pno, String userid) {
		super();
		this.pno = pno;
		this.userid = userid;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Wishlist [pno=" + pno + ", userid=" + userid + "]";
	}
	
	

}
