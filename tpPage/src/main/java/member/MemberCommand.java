package member;

public class MemberCommand {
	private int mid;
	private String mname, memail, mpw, confirmMpw;
	
	public MemberCommand(int mid, String mname, String memail, String mpw, String confirmMpw) {
		this.mid = mid;
		this.mname = mname;
		this.memail = memail;
		this.mpw = mpw;
		this.confirmMpw = confirmMpw;
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
	public String getConfirmMpw() {
		return confirmMpw;
	}
	public void setConfirmMpw(String confirmMpw) {
		this.confirmMpw = confirmMpw;
	}

}