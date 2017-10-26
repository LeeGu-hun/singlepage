package page;

import java.util.Date;

public class PageLike {
	private int mid, plike, pid;
	private Date plike_date;
	
	public PageLike(int mid, int plike, int pid, Date plike_date) {
		super();
		this.mid = mid;
		this.plike = plike;
		this.pid = pid;
		this.plike_date = plike_date;
	}
	
	public PageLike(int plike) {
		this.plike = plike;
	}
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public Date getPlike_date() {
		return plike_date;
	}
	public void setPlike_date(Date plike_date) {
		this.plike_date = plike_date;
	}
	
}
