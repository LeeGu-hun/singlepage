package member;

public class MemberCommand {
	private int mid, nowpid;
	private String mname, memail, mpw, mpwconf, mphone, newmpw, newmpwconf, mpwfmemail, mpwrmemail;
	private boolean rememberMemail;
	
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
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getNewmpw() {
		return newmpw;
	}
	public void setNewmpw(String newmpw) {
		this.newmpw = newmpw;
	}
	public String getNewmpwconf() {
		return newmpwconf;
	}
	public void setNewmpwconf(String newmpwconf) {
		this.newmpwconf = newmpwconf;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMpwconf() {
		return mpwconf;
	}
	public void setMpwconf(String mpwconf) {
		this.mpwconf = mpwconf;
	}
	public int getNowpid() {
		return nowpid;
	}
	public void setNowpid(int nowpid) {
		this.nowpid = nowpid;
	}
	public boolean isRememberMemail() {
		return rememberMemail;
	}
	public void setRememberMemail(boolean rememberMemail) {
		this.rememberMemail = rememberMemail;
	}
	public boolean isPasswordEqualToConfirmPassword() {
		return mpw.equals(mpwconf);
	}
	public boolean ismpwEqualTonewmpw() {
		return mpw.equals(newmpw);
	}
	public boolean isnewmpwEqualTonewmpwconf() {
		return newmpw.equals(newmpwconf);
	}
	public String getMpwfmemail() {
		return mpwfmemail;
	}
	public void setMpwfmemail(String mpwfmemail) {
		this.mpwfmemail = mpwfmemail;
	}
	public String getMpwrmemail() {
		return mpwrmemail;
	}
	public void setMpwrmemail(String mpwrmemail) {
		this.mpwrmemail = mpwrmemail;
	}
}