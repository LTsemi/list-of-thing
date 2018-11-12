package com.buyme.sic.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable{
	private int rno;
	private String pno;
	private String userid;
	private String rcontent;
	private Date rdate;
	private String rrank;
	
	public Review() {}
	
	public Review(int rno, String pno, String userid, String rcontent, Date rdate, String rrank) {
		super();
		this.rno = rno;
		this.pno = pno;
		this.userid = userid;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rrank = rrank;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getRrank() {
		return rrank;
	}

	public void setRrank(String rrank) {
		this.rrank = rrank;
	}

	@Override
	public String toString() {
		return "Review [rno=" + rno + ", pno=" + pno + ", userid=" + userid + ", rcontent=" + rcontent + ", rdate="
				+ rdate + ", rrank=" + rrank + "]";
	}
	
	
	
}
