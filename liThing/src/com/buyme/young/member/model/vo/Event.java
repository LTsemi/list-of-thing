package com.buyme.young.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.buyme.seul.event.model.vo.Attachment;

public class Event extends Attachment implements Serializable {

	private ArrayList<Attachment> attachments;

	public Event() {
		super();
	}

	public Event(int eventallno, int etype, int eno, String userid, java.util.Date evtdate, java.util.Date evtdateend,
			String evtcontent, String evttitle, String e_oname, String e_cname, String e_file) {
		super(eventallno, etype, eno, userid, evtdate, evtdateend, evtcontent, evttitle, e_oname, e_cname, e_file);
	}

	public Event(String userid, java.util.Date evtdate, java.util.Date evtdateend,
			String evtcontent, String evttitle, String e_oname, String e_cname, String e_file) {
		super(userid, evtdate evtdateend, evtcontent, evttitle, e_oname, e_cname, e_file);
	}
	
	

}
