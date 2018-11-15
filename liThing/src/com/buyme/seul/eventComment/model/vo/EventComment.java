package com.buyme.seul.eventComment.model.vo;

import java.sql.Date;

public class EventComment {
	
	private int cno;
	private int eno;
	private String userid;
	private String name;
	private String ccontent;
	private Date cdate;
	
	public EventComment() {
		super();
	}

	public EventComment(int cno, int eno, String userid, String name, String ccontent, Date cdate) {
		super();
		this.cno = cno;
		this.eno = eno;
		this.userid = userid;
		this.name = name;
		this.ccontent = ccontent;
		this.cdate = cdate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return "EventComment [cno=" + cno + ", eno=" + eno + ", userid=" + userid + ", name=" + name + ", ccontent="
				+ ccontent + ", cdate=" + cdate + "]";
	}
	
	
	
	
}
