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

	public AuthInfo(int mid, String mname, String memail, String mphone, int mcheck, int mpoint, Date mdate) {
		this.mid = mid;
		this.mname = mname;
		this.memail = memail;
		this.mphone = mphone;
		this.mcheck = mcheck;
		this.mpoint = mpoint;
		this.mdate = mdate;
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
	
}