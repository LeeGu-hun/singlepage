package board;

import java.util.Date;

public class Pblike {
	int mid, pblike, pbid;
	Date pblike_date;
	
	public Pblike(int mid, int pblike, int pbid, Date pblike_date) {
		this.mid = mid;
		this.pblike = pblike;
		this.pbid = pbid;
		this.pblike_date = pblike_date;
	}
	
	public Pblike(int pblike) {
		this.pblike = pblike;
	}

	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getPblike() {
		return pblike;
	}
	public void setPblike(int pblike) {
		this.pblike = pblike;
	}
	public int getPbid() {
		return pbid;
	}
	public void setPbid(int pbid) {
		this.pbid = pbid;
	}
	public Date getPblike_date() {
		return pblike_date;
	}
	public void setPblike_date(Date pblike_date) {
		this.pblike_date = pblike_date;
	}
}
