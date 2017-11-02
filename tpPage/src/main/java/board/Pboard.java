package board;

import java.sql.Timestamp;
import java.util.Date;

public class Pboard {
	
	private int pbid, pbre_ref, pbre_lev, pbre_seq, pbreadcount, pbhostid, pbwriterid;
	private String pbsubject, pbcontent, pbfile, pbnewfile, pname, mname;
	private Date pbdate;
	
	public Pboard(int pbhostid, int pbwriterid, String pbsubject, String pbcontent, String pbfile,
			String pbnewfile) {
		this.pbhostid = pbhostid;
		this.pbwriterid = pbwriterid;
		this.pbsubject = pbsubject;
		this.pbcontent = pbcontent;
		this.pbfile = pbfile;
		this.pbnewfile = pbnewfile;
	}
	
	public Pboard(int pbid, int pbre_ref, int pbre_lev, int pbre_seq, int pbreadcount, int pbhostid, int pbwriterid,
			String pbsubject, String pbcontent, String pbfile, String pbnewfile, Date pbdate) {
		this.pbid = pbid;
		this.pbre_ref = pbre_ref;
		this.pbre_lev = pbre_lev;
		this.pbre_seq = pbre_seq;
		this.pbreadcount = pbreadcount;
		this.pbhostid = pbhostid;
		this.pbwriterid = pbwriterid;
		this.pbsubject = pbsubject;
		this.pbcontent = pbcontent;
		this.pbfile = pbfile;
		this.pbnewfile = pbnewfile;
		this.pbdate = pbdate;
	}

	public Pboard(int pbid, String pbsubject, String pbcontent, String pbfile, String pbnewfile, int pbreadcount, Date pbdate,
			int pbhostid, int pbwriterid, String pname, String mname) {
		this.pbid = pbid;
		this.pbsubject = pbsubject;
		this.pbcontent = pbcontent;
		this.pbfile = pbfile;
		this.pbnewfile = pbnewfile;
		this.pbreadcount = pbreadcount;
		this.pbdate = pbdate;
		this.pbhostid = pbhostid;
		this.pbwriterid = pbwriterid;
		this.pname = pname;
		this.mname = mname;
	}
	
	public Pboard(int pbid, int pbre_ref, int pbre_lev, int pbre_seq, int pbreadcount, int pbhostid, int pbwriterid,
			String pbsubject, String pbcontent, String pbfile, String pbnewfile, String pname, String mname,
			Date pbdate) {
		this.pbid = pbid;
		this.pbre_ref = pbre_ref;
		this.pbre_lev = pbre_lev;
		this.pbre_seq = pbre_seq;
		this.pbreadcount = pbreadcount;
		this.pbhostid = pbhostid;
		this.pbwriterid = pbwriterid;
		this.pbsubject = pbsubject;
		this.pbcontent = pbcontent;
		this.pbfile = pbfile;
		this.pbnewfile = pbnewfile;
		this.pname = pname;
		this.mname = mname;
		this.pbdate = pbdate;
	}

	public int getPbid() {
		return pbid;
	}
	public void setPbid(int pbid) {
		this.pbid = pbid;
	}
	public int getPbre_ref() {
		return pbre_ref;
	}
	public void setPbre_ref(int pbre_ref) {
		this.pbre_ref = pbre_ref;
	}
	public int getPbre_lev() {
		return pbre_lev;
	}
	public void setPbre_lev(int pbre_lev) {
		this.pbre_lev = pbre_lev;
	}
	public int getPbre_seq() {
		return pbre_seq;
	}
	public void setPbre_seq(int pbre_seq) {
		this.pbre_seq = pbre_seq;
	}
	public int getPbreadcount() {
		return pbreadcount;
	}
	public void setPbreadcount(int pbreadcount) {
		this.pbreadcount = pbreadcount;
	}
	public int getPbhostid() {
		return pbhostid;
	}
	public void setPbhostid(int pbhostid) {
		this.pbhostid = pbhostid;
	}
	public int getPbwriterid() {
		return pbwriterid;
	}
	public void setPbwriterid(int pbwriterid) {
		this.pbwriterid = pbwriterid;
	}
	public String getPbsubject() {
		return pbsubject;
	}
	public void setPbsubject(String pbsubject) {
		this.pbsubject = pbsubject;
	}
	public String getPbcontent() {
		return pbcontent;
	}
	public void setPbcontent(String pbcontent) {
		this.pbcontent = pbcontent;
	}
	public String getPbfile() {
		return pbfile;
	}
	public void setPbfile(String pbfile) {
		this.pbfile = pbfile;
	}
	public String getPbnewfile() {
		return pbnewfile;
	}
	public void setPbnewfile(String pbnewfile) {
		this.pbnewfile = pbnewfile;
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
	public Date getPbdate() {
		return pbdate;
	}
	public void setPbdate(Date pbdate) {
		this.pbdate = pbdate;
	}
}
