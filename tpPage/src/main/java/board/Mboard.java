package board;

import java.util.Date;

public class Mboard {
	
	private int mbid, mbre_ref, mbre_lev, mbre_seq, mbreadcount, mbhostid, mbwriterid;
	private String mbsubject, mbcontent, mbfile, mbnewfile, pname, mname;
	private Date mbdate;
	
	public Mboard(int mbhostid, int mbwriterid, String mbsubject, String mbcontent, String mbfile, String mbnewfile) {
		super();
		this.mbhostid = mbhostid;
		this.mbwriterid = mbwriterid;
		this.mbsubject = mbsubject;
		this.mbcontent = mbcontent;
		this.mbfile = mbfile;
		this.mbnewfile = mbnewfile;
	}
	
	public Mboard(int mbid, String mbsubject, String mbcontent, String mbfile, String mbnewfile, int mbreadcount, Date mbdate,
			int mbhostid, int mbwriterid, String pname, String mname) {
		this.mbid = mbid;
		this.mbsubject = mbsubject;
		this.mbcontent = mbcontent;
		this.mbfile = mbfile;
		this.mbnewfile = mbnewfile;
		this.mbreadcount = mbreadcount;
		this.mbdate = mbdate;
		this.mbhostid = mbhostid;
		this.mbwriterid = mbwriterid;
		this.pname = pname;
		this.mname = mname;
	}
	
	public int getMbid() {
		return mbid;
	}
	public void setMbid(int mbid) {
		this.mbid = mbid;
	}
	public int getMbre_ref() {
		return mbre_ref;
	}
	public void setMbre_ref(int mbre_ref) {
		this.mbre_ref = mbre_ref;
	}
	public int getMbre_lev() {
		return mbre_lev;
	}
	public void setMbre_lev(int mbre_lev) {
		this.mbre_lev = mbre_lev;
	}
	public int getMbre_seq() {
		return mbre_seq;
	}
	public void setMbre_seq(int mbre_seq) {
		this.mbre_seq = mbre_seq;
	}
	public int getMbreadcount() {
		return mbreadcount;
	}
	public void setMbreadcount(int mbreadcount) {
		this.mbreadcount = mbreadcount;
	}
	public int getMbhostid() {
		return mbhostid;
	}
	public void setMbhostid(int mbhostid) {
		this.mbhostid = mbhostid;
	}
	public int getMbwriterid() {
		return mbwriterid;
	}
	public void setMbwriterid(int mbwriterid) {
		this.mbwriterid = mbwriterid;
	}
	public String getMbsubject() {
		return mbsubject;
	}
	public void setMbsubject(String mbsubject) {
		this.mbsubject = mbsubject;
	}
	public String getMbcontent() {
		return mbcontent;
	}
	public void setMbcontent(String mbcontent) {
		this.mbcontent = mbcontent;
	}
	public String getMbfile() {
		return mbfile;
	}
	public void setMbfile(String mbfile) {
		this.mbfile = mbfile;
	}
	public String getMbnewfile() {
		return mbnewfile;
	}
	public void setMbnewfile(String mbnewfile) {
		this.mbnewfile = mbnewfile;
	}
	public Date getMbdate() {
		return mbdate;
	}
	public void setMbdate(Date mbdate) {
		this.mbdate = mbdate;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
}
