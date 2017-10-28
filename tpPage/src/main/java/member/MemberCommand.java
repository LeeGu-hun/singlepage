package member;

public class MemberCommand {
	private int mid;
	private String mname, memail, mpw, mpwconf, mphone, newmpw, newmpwconf;
	
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
	public String getMpwconf() {
		return mpwconf;
	}
	public void setMpwconf(String mpwconf) {
		this.mpwconf = mpwconf;
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
	public boolean isPasswordEqualToConfirmPassword() {
		return mpw.equals(mpwconf);
	}
	public boolean isoldmpwEqualTonewmpw() {
		return mpw.equals(newmpw);
	}
	public boolean isnewmpwEqualTonewmpwconf() {
		return newmpw.equals(newmpwconf);
	}
}