package page;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class PageCommand {
	private String pname, pnick, pintro, pgenre, ploc, pupdir, pshowtime, platlng;
	private MultipartFile pfile;
	@DateTimeFormat(pattern="yyyyMMddHHmmss")
	private Date pperiod;
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
	public String getPshowtime() {
		return pshowtime;
	}
	public void setPshowtime(String pshowtime) {
		this.pshowtime = pshowtime;
	}
	public String getPlatlng() {
		return platlng;
	}
	public void setPlatlng(String platlng) {
		this.platlng = platlng;
	}
	public MultipartFile getPfile() {
		return pfile;
	}
	public void setPfile(MultipartFile pfile) {
		this.pfile = pfile;
	}
	public Date getPperiod() {
		return pperiod;
	}
	public void setPperiod(Date pperiod) {
		this.pperiod = pperiod;
	}

	
}
