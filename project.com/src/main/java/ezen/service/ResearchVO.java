package ezen.service;

import java.util.ArrayList;

public class ResearchVO {

	/** common */
	private int		unq;

	
	/** rschMain */
	private String	mcd;
	private String 	title;
	private String	sdate;
	private String	edate;
	private	String	use;
	private String 	rdate;
	
	/** common */
	private	String 	scd;
	
	/** rschSub */
	private	ArrayList<String>	comm;
	private String content;

	
	/**
	 * Getter Setter
	 **/
	public int getUnq() {
		return unq;
	}

	public void setUnq(int unq) {
		this.unq = unq;
	}

	public String getMcd() {
		return mcd;
	}

	public void setMcd(String mcd) {
		this.mcd = mcd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getScd() {
		return scd;
	}

	public void setScd(String scd) {
		this.scd = scd;
	}
	
	public ArrayList<String> getComm() {
		return comm;
	}

	public void setComm(ArrayList<String> comm) {
		this.comm = comm;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	/** rschEnter */
	private String	cnt;
}
