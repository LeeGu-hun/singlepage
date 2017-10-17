package login;

public class AuthInfo {
	private String mname;
	private String memail;
	private int mid;
	
	public AuthInfo(String mname, String memail, int mid) {
		super();
		this.mname = mname;
		this.memail = memail;
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
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	
}