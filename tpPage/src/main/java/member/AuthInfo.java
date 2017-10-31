package member;

import java.util.Date;

public class AuthInfo {
	private int mid;
	private String mname;
	private String memail;
	private String mphone;
	private int mcheck;
	private int mpoint;
	private Date mdate;
	private int pid;
	
	public AuthInfo(int mid, String mname, String memail, String mphone, int mcheck, int mpoint, Date mdate, int pid) {
		this.mid = mid;
		this.mname = mname;
		this.memail = memail;
		this.mphone = mphone;
		this.mcheck = mcheck;
		this.mpoint = mpoint;
		this.mdate = mdate;
		this.pid = pid;
	}

	public int getMid() {
		return mid;
	}

	public String getMname() {
		return mname;
	}

	public String getMemail() {
		return memail;
	}

	public String getMphone() {
		return mphone;
	}

	public int getMcheck() {
		return mcheck;
	}

	public int getMpoint() {
		return mpoint;
	}

	public Date getMdate() {
		return mdate;
	}

	public int getPid() {
		return pid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public void setMcheck(int mcheck) {
		this.mcheck = mcheck;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
}