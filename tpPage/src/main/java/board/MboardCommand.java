package board;

import org.springframework.web.multipart.MultipartFile;

public class MboardCommand {
	private String mbsubject, mbcontent, mbupdir, mbTab, mbrecontent;
	private int mbhostid, mbwriterid, mbpage, mbid, mbreid;
	private MultipartFile mbfile;
	
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
	public String getMbupdir() {
		return mbupdir;
	}
	public void setMbupdir(String mbupdir) {
		this.mbupdir = mbupdir;
	}
	public String getMbTab() {
		return mbTab;
	}
	public void setMbTab(String mbTab) {
		this.mbTab = mbTab;
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
	public int getMbpage() {
		return mbpage;
	}
	public void setMbpage(int mbpage) {
		this.mbpage = mbpage;
	}
	public MultipartFile getMbfile() {
		return mbfile;
	}
	public void setMbfile(MultipartFile mbfile) {
		this.mbfile = mbfile;
	}
	public String getMbrecontent() {
		return mbrecontent;
	}
	public void setMbrecontent(String mbrecontent) {
		this.mbrecontent = mbrecontent;
	}
	public int getMbid() {
		return mbid;
	}
	public void setMbid(int mbid) {
		this.mbid = mbid;
	}
	public int getMbreid() {
		return mbreid;
	}
	public void setMbreid(int mbreid) {
		this.mbreid = mbreid;
	}
	
}