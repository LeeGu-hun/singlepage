package member;

import java.util.Date;

public class Member {
	private int mid;
	private String mname;
	private String memail;
	private String mpw;
	private String mphone;
	private String mcheck;
	private int mpoint;
	private Date mdate;
	
	public Member(int mid, String mname, String memail, String mpw, String mphone, String mcheck, int mpoint,
			Date mdate) {
		this.mid = mid;
		this.mname = mname;
		this.memail = memail;
		this.mpw = mpw;
		this.mphone = mphone;
		this.mcheck = mcheck;
		this.mpoint = mpoint;
		this.mdate = mdate;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMcheck() {
		return mcheck;
	}

	public void setMcheck(String mcheck) {
		this.mcheck = mcheck;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
}