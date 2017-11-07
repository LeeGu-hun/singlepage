package board;

import org.springframework.web.multipart.MultipartFile;

public class PboardCommand {
	
	private String pbsubject, pbcontent, pbupdir, pbrecontent;
	private int pbhostid, pbwriterid, pbpage, pbid, pbreid;
	private MultipartFile pbfile;
	
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
	public String getPbupdir() {
		return pbupdir;
	}
	public void setPbupdir(String pbupdir) {
		this.pbupdir = pbupdir;
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
	public int getPbpage() {
		return pbpage;
	}
	public void setPbpage(int pbpage) {
		this.pbpage = pbpage;
	}
	public MultipartFile getPbfile() {
		return pbfile;
	}
	public void setPbfile(MultipartFile pbfile) {
		this.pbfile = pbfile;
	}
	public int getPbid() {
		return pbid;
	}
	public void setPbid(int pbid) {
		this.pbid = pbid;
	}
	public String getPbrecontent() {
		return pbrecontent;
	}
	public void setPbrecontent(String pbrecontent) {
		this.pbrecontent = pbrecontent;
	}
	public int getPbreid() {
		return pbreid;
	}
	public void setPbreid(int pbreid) {
		this.pbreid = pbreid;
	}
	
	
}
