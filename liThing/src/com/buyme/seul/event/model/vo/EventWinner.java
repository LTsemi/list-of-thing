package com.buyme.seul.event.model.vo;

public class EventWinner {
	private int eno;
	private String cwriter;
	private String userName;
	private int evtEno;
	
	
	public EventWinner() {
		super();
	}

	public EventWinner(int eno) {
		super();
		this.eno = eno;
	}

	public EventWinner(String cwriter) {
		super();
		this.cwriter = cwriter;
	}

	

	public EventWinner(int eno, String cwriter, String userName, int evtEno) {
		super();
		this.eno = eno;
		this.cwriter = cwriter;
		this.userName = userName;
		this.evtEno = evtEno;
	}

	public EventWinner(int eno, String cwriter) {
		super();
		this.eno = eno;
		this.cwriter = cwriter;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	

	public int getEvtEno() {
		return evtEno;
	}

	public void setEvtEno(int evtEno) {
		this.evtEno = evtEno;
	}

	@Override
	public String toString() {
		return "EventWinner [eno=" + eno + ", cwriter=" + cwriter + ", userName=" + userName + ", evtEno=" + evtEno
				+ "]";
	}






	
	
}
