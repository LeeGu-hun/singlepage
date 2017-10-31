package page;

import org.springframework.web.multipart.MultipartFile;

public class PageCommand {
	private String pname, pnick, pintro, pgenre, ploc, pupdir, pperiod, phowtime, latlng;
	private MultipartFile pfile;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPnick() {
		return pnick;
	}
	public void setPnick(String pnick) {
		this.pnick = pnick;
	}
	public String getPintro() {
		return pintro;
	}
	public void setPintro(String pintro) {
		this.pintro = pintro;
	}
	public String getPgenre() {
		return pgenre;
	}
	public void setPgenre(String pgenre) {
		this.pgenre = pgenre;
	}
	public String getPloc() {
		return ploc;
	}
	public void setPloc(String ploc) {
		this.ploc = ploc;
	}
	public String getPupdir() {
		return pupdir;
	}
	public void setPupdir(String pupdir) {
		this.pupdir = pupdir;
	}
	public String getPperiod() {
		return pperiod;
	}
	public void setPperiod(String pperiod) {
		this.pperiod = pperiod;
	}
	public String getPhowtime() {
		return phowtime;
	}
	public void setPhowtime(String phowtime) {
		this.phowtime = phowtime;
	}
	public MultipartFile getPfile() {
		return pfile;
	}
	public void setPfile(MultipartFile pfile) {
		this.pfile = pfile;
	}
	public String getLatlng() {
		return latlng;
	}
	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}
	
}
