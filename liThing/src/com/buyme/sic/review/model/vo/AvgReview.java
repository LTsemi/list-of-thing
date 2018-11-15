package com.buyme.sic.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AvgReview extends Review implements Serializable{
	private double avgRank;

	public AvgReview() {}

	public AvgReview(int rno, String pno, String userid, String rcontent, Date rdate, int rrank, double avgRank) {
		super(rno, pno, userid, rcontent, rdate, rrank);
		this.avgRank = avgRank;
	}

	public double getAvgRank() {
		return avgRank;
	}

	public void setAvgRank(double avgRank) {
		this.avgRank = avgRank;
	}

	@Override
	public String toString() {
		return "AvgReview [avgRank=" + avgRank + "]";
	}

	
	
	
	
	
}
