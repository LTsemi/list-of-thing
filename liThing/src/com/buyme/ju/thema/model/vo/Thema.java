package com.buyme.ju.thema.model.vo;

import java.io.Serializable;

public class Thema implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int tno;
	private String userid;
	private String ttitle;
	private String tcontent;
	private String timage;
	
	public Thema() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Thema(int tno, String userid, String ttitle, String tcontent, String timage) {
		super();
		this.tno = tno;
		this.userid = userid;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.timage = timage;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTtitle() {
		return ttitle;
	}

	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getTimage() {
		return timage;
	}

	public void setTimage(String timage) {
		this.timage = timage;
	}

	@Override
	public String toString() {
		return "Thema [tno=" + tno + ", userid=" + userid + ", ttitle=" + ttitle + ", tcontent=" + tcontent
				+ ", timage=" + timage + "]";
	}
	

}
