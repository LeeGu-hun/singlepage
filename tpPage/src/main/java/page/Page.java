package page;

import java.util.Date;

public class Page {
	private int pid, ppoint, pmaster;
	private String pname, pnick, pintro, pgenre, ploc, pfile, pnewfile, pshowtime, platlng;
	private Date pdate, pperiod;

	public Page(int pid) {
		this.pid = pid;
	}
	
	public Page(int pmaster, String pname, String pnick, String pintro, String pgenre, String ploc, String pfile,
			String pnewfile, Date pperiod, String pshowtime, String platlng) {
		this.pmaster = pmaster;
		this.pname = pname;
		this.pnick = pnick;
		this.pintro = pintro;
		this.pgenre = pgenre;
		this.ploc = ploc;
		this.pfile = pfile;
		this.pnewfile = pnewfile;
		this.pperiod = pperiod;
		this.pshowtime = pshowtime;
		this.platlng = platlng;
	}
	
	public Page(int pid, int ppoint, int pmaster, String pname, String pnick, String pintro, String pgenre, String ploc,
			String pfile, String pnewfile, String pshowtime, Date pdate, Date pperiod, String platlng) {
		super();
		this.pid = pid;
		this.ppoint = ppoint;
		this.pmaster = pmaster;
		this.pname = pname;
		this.pnick = pnick;
		this.pintro = pintro;
		this.pgenre = pgenre;
		this.ploc = ploc;
		this.pfile = pfile;
		this.pnewfile = pnewfile;
		this.pshowtime = pshowtime;
		this.pdate = pdate;
		this.pperiod = pperiod;
		this.platlng = platlng;
	}

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

	public String getPfile() {
		return pfile;
	}

	public void setPfile(String pfile) {
		this.pfile = pfile;
	}

	public String getPnewfile() {
		return pnewfile;
	}

	public void setPnewfile(String pnewfile) {
		this.pnewfile = pnewfile;
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

	public Date getPperiod() {
		return pperiod;
	}

	public void setPperiod(Date pperiod) {
		this.pperiod = pperiod;
	}

	public String getPlatlng() {
		return platlng;
	}

	public void setPlatlng(String platlng) {
		this.platlng = platlng;
	}
	
}
