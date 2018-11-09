package com.buyme.ju.customerService.model.vo;

import java.sql.Date;

public class CustomerService {
	
	private int cno;
	private String ctitle;
	private String userid;
	private String ccontent;
	private Date cdate;
	
	public CustomerService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerService(int cno, String ctitle, String userid, String ccontent, Date cdate) {
		super();
		this.cno = cno;
		this.ctitle = ctitle;
		this.userid = userid;
		this.ccontent = ccontent;
		this.cdate = cdate;
	}

	public CustomerService(String ctitle, String ccontent) {
		super();
		this.ctitle = ctitle;
		this.ccontent = ccontent;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	@Override
	public String toString() {
		return "CustomerService [cno=" + cno + ", ctitle=" + ctitle + ", userid=" + userid + ", ccontent=" + ccontent
				+ ", cdate=" + cdate + "]";
	}
}
