package com.buyme.won.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {
	
	// 공지사항 한개를 저장할 수 있는 노티스
	
    // 3. 오라클과 맞춰서 작성하기
	// no는 연속적으로 하나씩 늘어남 시퀀스가 그 객체임 오라클가서 만들기
	
	// 오라클
	// 4. VO만들기-오라클 노티스 테이블대로 만들기 
	// nno 값은 항상 작성시마다 증가해야함 순서가 연속적 발생 이걸 처리하는 데이터 베이스 객체가 있음 시퀀스!!
	private int nno;
	private String ntitle;
	private String ncontent;
	private String nwriter;
	private int ncount;
	private Date ndate;
	
	
	
	public Notice() {
		super();
	}

	public Notice(String ntitle, String ncontent, String nwriter) {
		// 내가입력할때
		super();
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nwriter = nwriter;
	}

	public Notice(int nno, String ntitle, String ncontent, String nwriter, int ncount, Date ndate) {
		// 나중에 전체 입력할 때
		super();
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nwriter = nwriter;
		this.ncount = ncount;
		this.ndate = ndate;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", nwriter=" + nwriter
				+ ", ncount=" + ncount + ", ndate=" + ndate + "]";
	}
	
	
	    
	
	
	
	
	
}