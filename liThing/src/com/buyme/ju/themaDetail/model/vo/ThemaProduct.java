package com.buyme.ju.themaDetail.model.vo;

import java.io.Serializable;

import com.buyme.sic.ranking.model.vo.Product;

public class ThemaProduct extends Product implements Serializable{

	private static final long serialVersionUID = 1L;

	private int thema_no;
	private String prod_no;
	
	public ThemaProduct() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
	@Override
	public String toString() {
		return "ThemaProduct [thema_no=" + thema_no + ", prod_no=" + prod_no + ", p_no=" + super.getPno() +"]";
	}

	public ThemaProduct(int thema_no, String prod_no) {
		super();
		this.thema_no = thema_no;
		this.prod_no = prod_no;
	}
	public int getThema_no() {
		return thema_no;
	}
	public void setThema_no(int thema_no) {
		this.thema_no = thema_no;
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
