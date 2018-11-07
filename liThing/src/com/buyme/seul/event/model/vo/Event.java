package com.buyme.seul.event.model.vo;

import java.io.Serializable;
import java.util.Date;

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
	
	public Event() {
		super();
	}

	public Event(int eventallno, int etype, int eno, String userid, Date evtdate, Date evtdateend, String evtcontent,
			String evttitle, String e_file) {
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

	@Override
	public String toString() {
		return "Event [eventallno=" + eventallno + ", etype=" + etype + ", eno=" + eno + ", userid=" + userid
				+ ", evtdate=" + evtdate + ", evtdateend=" + evtdateend + ", evtcontent=" + evtcontent + ", evttitle="
				+ evttitle + ", e_file=" + e_file + "]";
	}
	
	
}
