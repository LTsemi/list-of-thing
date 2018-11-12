package com.buyme.sic.ranking.model.vo;

import java.io.Serializable;

public class Product implements Serializable{
	private String pno;
	private String pnn;
	private String kno;
	private String pname;
	private int pprice;
	private String pindg;
	private String brand;
	private String pcap;
	private int rank;
	private int count;
	private String pimg;
	private String oname;
	private String cname;
	private String pexp;
	
	public Product() {
		super();
	}

	

	public Product(String pno, String pnn, String kno, String pname, int pprice, String pindg, String brand,
			String pcap, int rank, int count, String pimg, String oname, String cname, String pexp) {
		super();
		this.pno = pno;
		this.pnn = pnn;
		this.kno = kno;
		this.pname = pname;
		this.pprice = pprice;
		this.pindg = pindg;
		this.brand = brand;
		this.pcap = pcap;
		this.rank = rank;
		this.count = count;
		this.pimg = pimg;
		this.oname = oname;
		this.cname = cname;
		this.pexp = pexp;
	}



	public Product(String pnn, String kno, String pname, int pprice, String pindg, String brand, String pcap,
			String pimg, String oname, String cname, String pexp) {
		super();
		this.pnn = pnn;
		this.kno = kno;
		this.pname = pname;
		this.pprice = pprice;
		this.pindg = pindg;
		this.brand = brand;
		this.pcap = pcap;
		this.pimg = pimg;
		this.oname = oname;
		this.cname = cname;
		this.pexp = pexp;
	}

	
	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPnn() {
		return pnn;
	}

	public void setPnn(String pnn) {
		this.pnn = pnn;
	}

	public String getKno() {
		return kno;
	}

	public void setKno(String kno) {
		this.kno = kno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getPindg() {
		return pindg;
	}

	public void setPindg(String pindg) {
		this.pindg = pindg;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getPcap() {
		return pcap;
	}

	public void setPcap(String pcap) {
		this.pcap = pcap;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}



	public String getPexp() {
		return pexp;
	}



	public void setPexp(String pexp) {
		this.pexp = pexp;
	}



	@Override
	public String toString() {
		return "Product [pno=" + pno + ", pnn=" + pnn + ", kno=" + kno + ", pname=" + pname + ", pprice=" + pprice
				+ ", pindg=" + pindg + ", brand=" + brand + ", pcap=" + pcap + ", rank=" + rank + ", count=" + count
				+ ", pimg=" + pimg + ", oname=" + oname + ", cname=" + cname + ", pexp=" + pexp + "]";
	}

	

	
	
	
}
