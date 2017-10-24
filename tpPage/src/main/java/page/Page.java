package page;

import java.util.Date;

public class Page {
	private int pid, ppoint, pmaster;
	private String pname, pnick, pintro, pgenre, ploc, pperiod, pshowtime;
	private Date pdate;

<<<<<<< HEAD
=======
	public Page(int pid) {
		this.pid = pid;
	}

>>>>>>> branch 'temp' of https://github.com/LeeGu-hun/singlepage.git
	public int getPid() {
		return pid;
	}
	
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public int getPpoint() {
		return ppoint;
	}
	
	public void setPpoint(int ppoint) {
		this.ppoint = ppoint;
	}
	
	public int getPmaster() {
		return pmaster;
	}
	
	public void setPmaster(int pmaster) {
		this.pmaster = pmaster;
	}
	
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
	
	public String getPperiod() {
		return pperiod;
	}
	
	public void setPperiod(String pperiod) {
		this.pperiod = pperiod;
	}
	
	public String getPshowtime() {
		return pshowtime;
	}
	
	public void setPshowtime(String pshowtime) {
		this.pshowtime = pshowtime;
	}
	
	public Date getPdate() {
		return pdate;
	}
	
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
}
