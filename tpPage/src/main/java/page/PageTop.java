package page;

public class PageTop {
	private int pid, tid, tcheck, turn;
	private String url, thum, newthum;
	
	public PageTop(int pid, int tid, int tcheck, int turn, String url, String thum, String newthum) {
		super();
		this.pid = pid;
		this.tid = tid;
		this.tcheck = tcheck;
		this.turn = turn;
		this.url = url;
		this.thum = thum;
		this.newthum = newthum;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public int getTid() {
		return tid;
	}
	
	public void setTid(int tid) {
		this.tid = tid;
	}
	
	public int getTcheck() {
		return tcheck;
	}
	
	public void setTcheck(int tcheck) {
		this.tcheck = tcheck;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getThum() {
		return thum;
	}
	
	public void setThum(String thum) {
		this.thum = thum;
	}

	public int getTurn() {
		return turn;
	}

	public void setTurn(int turn) {
		this.turn = turn;
	}

	public String getNewthum() {
		return newthum;
	}

	public void setNewthum(String newthum) {
		this.newthum = newthum;
	}
}
