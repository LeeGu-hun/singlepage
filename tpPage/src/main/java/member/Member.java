package member;

import java.util.Date;

import vali_exception.IdPasswordNotMatchingException;

public class Member {
	private int mid;
	private String mname;
	private String memail;
	private String mpw;
	private String mphone;
	private int mcheck;
	private int mpoint;
	private Date mdate;
	
	public Member(String mname, String memail, String mpw, String mphone) {
		this.mname = mname;
		this.memail = memail;
		this.mpw = mpw;
		this.mphone = mphone;								//회원정보변경
	}

	public Member(int mid, String mname, String memail, String mpw, String mphone, int mcheck, int mpoint,
			Date mdate) {
		this.mid = mid;
		this.mname = mname;
		this.memail = memail;
		this.mpw = mpw;
		this.mphone = mphone;
		this.mcheck = mcheck;
		this.mpoint = mpoint;
		this.mdate = mdate;									//AuthInfo에 담길 것들
	}

	public Member(String mname, String memail, String mpw) {
		this.mname = mname;
		this.memail = memail;
		this.mpw = mpw;										//회원가입 할때
	}

	public Member(String memail) {
		this.memail = memail;                   	        //mpw 비교할때
	}
	
	public Member(int mid) {
		this.mid = mid;
	}

	/*public Member(int mid, String mname, String memail, String mpw) {
		this.mid = mid;
		this.mname = mname;
		this.memail = memail;
		this.mpw = mpw;                       				
	}*/

	
	
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

	public int getMcheck() {
		return mcheck;
	}

	public void setMcheck(int mcheck) {
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

	public boolean matchPassword(String mpw) {
		return this.mpw.equals(mpw);
	}
}