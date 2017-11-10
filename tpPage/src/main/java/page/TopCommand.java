package page;

import org.springframework.web.multipart.MultipartFile;

public class TopCommand {
	private int checked, turn, link, tupdir;
	private MultipartFile thum;
	
	public int getChecked() {
		return checked;
	}
	
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	public int getTurn() {
		return turn;
	}
	
	public void setTurn(int turn) {
		this.turn = turn;
	}
	
	public int getLink() {
		return link;
	}
	
	public void setLink(int link) {
		this.link = link;
	}
	
	public int getTupdir() {
		return tupdir;
	}
	
	public void setTupdir(int tupdir) {
		this.tupdir = tupdir;
	}
	
	public MultipartFile getThum() {
		return thum;
	}
	
	public void setThum(MultipartFile thum) {
		this.thum = thum;
	}
	

}
