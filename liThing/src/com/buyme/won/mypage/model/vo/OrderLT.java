package com.buyme.won.mypage.model.vo;

import java.sql.Date;

public class OrderLT {


	private int ordernum;
	private String userid;
	private Date orderdate;
	private int price;
	private String useraddress;
	private String priceck;
	private String tracking_num;
	private Date end_order;
	private String delf;
	
	public OrderLT() {
		super();
	}



	public OrderLT(int ordernum, String userid, Date orderdate, int price, String useraddress, String priceck,
			String tracking_num) {
		super();
		this.ordernum = ordernum;
		this.userid = userid;
		this.orderdate = orderdate;
		this.price = price;
		this.useraddress = useraddress;
		this.priceck = priceck;
		this.tracking_num = tracking_num;
	}



	public int getOrdernum() {
		return ordernum;
	}



	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public Date getOrderdate() {
		return orderdate;
	}



	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getUseraddress() {
		return useraddress;
	}



	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}



	public String getPriceck() {
		return priceck;
	}



	public void setPriceck(String priceck) {
		this.priceck = priceck;
	}



	public String getTracking_num() {
		return tracking_num;
	}



	public void setTracking_num(String tracking_num) {
		this.tracking_num = tracking_num;
	}
	

	public Date getEnd_order() {
		return end_order;
	}



	public void setEnd_order(Date end_order) {
		this.end_order = end_order;
	}
	

	public String getDelf() {
		return delf;
	}



	public void setDelf(String delf) {
		this.delf = delf;
	}



	@Override
	public String toString() {
		return "OrderLT [ordernum=" + ordernum + ", userid=" + userid + ", orderdate=" + orderdate + ", price=" + price
				+ ", useraddress=" + useraddress + ", priceck=" + priceck + ", tracking_num=" + tracking_num + "]";
	}

	
}