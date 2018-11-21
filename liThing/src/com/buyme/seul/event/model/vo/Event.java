package com.buyme.seul.event.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.buyme.young.member.model.vo.Member;

public class Event implements Serializable {

	private int eventallno;
	private int etype;
	private int eno;
	private String userid;
	private Date evtdate;
	private Date evtdateend;
	private String evtcontent;
	private String evttitle;
	private String e_file;
	private String Delflag;
	private String e_oname;
	private String e_cname;
	private String e_dtl_oname;
	private String e_dtl_cname;
	private int winner_cnt;
	private int dday;
	private int userCnt;
	private int evtEno;
	private int evteno_cnt;
	private String winResult;

	public Event() {
		super();
	}




	public Event(String userid, String evtcontent, String evttitle, Date evtdate, int evtEno) {
		super();
		this.userid = userid;
		this.evtcontent = evtcontent;
		this.evttitle = evttitle;
		this.evtdate = evtdate;
		this.evtEno = evtEno;
		
	}





	public Event(int eventallno, int etype, int eno, String userid, Date evtdate, Date evtdateend, String evtcontent,
			String evttitle, String e_file, String delflag, String e_oname, String e_cname, String e_dtl_oname,
			String e_dtl_cname, int winner_cnt, int dday, int userCnt , int evtEno) {
		super();
		this.eventallno = eventallno;
		this.etype = etype;
		this.eno = eno;
		this.userid = userid;
		this.evtdate = evtdate;
		this.evtdateend = evtdateend;
		this.evtcontent = evtcontent;
		this.evttitle = evttitle;
		this.e_file = e_file;
		Delflag = delflag;
		this.e_oname = e_oname;
		this.e_cname = e_cname;
		this.e_dtl_oname = e_dtl_oname;
		this.e_dtl_cname = e_dtl_cname;
		this.winner_cnt = winner_cnt;
		this.dday = dday;
		this.userCnt = userCnt;
		this.evtEno = evtEno;
	}




	public Event(int eventallno, int etype, int eno, String userid, Date evtdate, String evtcontent, String evttitle,
			String delflag, int winner_cnt, int userCnt, int evtEno) {
		super();
		this.eventallno = eventallno;
		this.etype = etype;
		this.eno = eno;
		this.userid = userid;
		this.evtdate = evtdate;
		this.evtcontent = evtcontent;
		this.evttitle = evttitle;
		this.Delflag = delflag;
		this.winner_cnt = winner_cnt;
		this.userCnt = userCnt;
		this.evtEno = evtEno;
		
	}


	public int getEventallno() {
		return eventallno;
	}


	public void setEventallno(int eventallno) {
		this.eventallno = eventallno;
	}


	public int getEtype() {
		return etype;
	}


	public void setEtype(int etype) {
		this.etype = etype;
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


	public String getE_dtl_oname() {
		return e_dtl_oname;
	}




	public void setE_dtl_oname(String e_dtl_oname) {
		this.e_dtl_oname = e_dtl_oname;
	}




	public String getE_dtl_cname() {
		return e_dtl_cname;
	}




	public void setE_dtl_cname(String e_dtl_cname) {
		this.e_dtl_cname = e_dtl_cname;
	}




	public void setUserid(String userid) {
		this.userid = userid;
	}


	public Date getEvtdate() {
		return evtdate;
	}


	public void setEvtdate(Date evtdate) {
		this.evtdate = evtdate;
	}


	public Date getEvtdateend() {
		return evtdateend;
	}


	public void setEvtdateend(Date evtdateend) {
		this.evtdateend = evtdateend;
	}


	public String getEvtcontent() {
		return evtcontent;
	}


	public void setEvtcontent(String evtcontent) {
		this.evtcontent = evtcontent;
	}


	public String getEvttitle() {
		return evttitle;
	}


	public void setEvttitle(String evttitle) {
		this.evttitle = evttitle;
	}


	public String getE_file() {
		return e_file;
	}


	public void setE_file(String e_file) {
		this.e_file = e_file;
	}


	public String getDelflag() {
		return Delflag;
	}


	public void setDelflag(String delflag) {
		Delflag = delflag;
	}


	public String getE_oname() {
		return e_oname;
	}


	public void setE_oname(String e_oname) {
		this.e_oname = e_oname;
	}


	public String getE_cname() {
		return e_cname;
	}


	public void setE_cname(String e_cname) {
		this.e_cname = e_cname;
	}

	public int getDday() {
		return dday;
	}


	public void setDday(int dday) {
		this.dday = dday;
	}


	public int getWinner_cnt() {
		return winner_cnt;
	}




	public void setWinner_cnt(int winner_cnt) {
		this.winner_cnt = winner_cnt;
	}




	public int getUserCnt() {
		return userCnt;
	}




	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}




	public int getEvtEno() {
		return evtEno;
	}




	public void setEvtEno(int evtEno) {
		this.evtEno = evtEno;
	}




	public int getEvteno_cnt() {
		return evteno_cnt;
	}




	public void setEvteno_cnt(int evteno_cnt) {
		this.evteno_cnt = evteno_cnt;
	}




	public String getWinResult() {
		return winResult;
	}




	public void setWinResult(String winResult) {
		this.winResult = winResult;
	}




	@Override
	public String toString() {
		return "Event [eventallno=" + eventallno + ", etype=" + etype + ", eno=" + eno + ", userid=" + userid
				+ ", evtdate=" + evtdate + ", evtdateend=" + evtdateend + ", evtcontent=" + evtcontent + ", evttitle="
				+ evttitle + ", e_file=" + e_file + ", Delflag=" + Delflag + ", e_oname=" + e_oname + ", e_cname="
				+ e_cname + ", e_dtl_oname=" + e_dtl_oname + ", e_dtl_cname=" + e_dtl_cname + ", winner_cnt="
				+ winner_cnt + ", dday=" + dday + ", userCnt=" + userCnt + ", evtEno=" + evtEno + "]";
	}




	
	
}