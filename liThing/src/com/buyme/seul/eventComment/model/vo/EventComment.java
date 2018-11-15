package com.buyme.seul.eventComment.model.vo;

import java.sql.Date;

public class EventComment {

	private int cno;
	private int eno;
	private String ccontent;
	private String cwriter;
	private Date cdate;

	public EventComment() {
		super();
	}

	

	public EventComment(int cno, int eno, String ccontent, String cwriter, Date cdate) {
		super();
		this.cno = cno;
		this.eno = eno;
		this.ccontent = ccontent;
		this.cwriter = cwriter;
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



	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}



	@Override
	public String toString() {
		return "EventComment [cno=" + cno + ", eno=" + eno + ", ccontent="
				+ ccontent+ ", cwriter=" + cwriter  + ", cdate=" + cdate + "]";
	}


	
	
	
}
