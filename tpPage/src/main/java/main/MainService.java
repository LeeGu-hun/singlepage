package main;

import java.util.ArrayList;
import java.util.List;

import board.Pboard;
import dao.MainDao;
import page.Page;

public class MainService {
	MainDao mainDao;

	public MainService(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	
	public void getReco() {
		
	}
	
	public List<Pboard> getFavo(int page, int limit, int mid) {
		
		return mainDao.getBoardListFavo(page, limit, mid);
	}
	
	public List<Page> getFavoList(int mid) {

		return mainDao.getFavoList(mid);
	}
	
	public void getHot() {
		
	}
	
	public void getNewbie() {
		
	}
	
	
	
	public List<Pboard> getRandom(int limit) {
		List<Pboard> boardList = new ArrayList<Pboard>();
		if (mainDao.count()>0) {
			boardList = mainDao.getBoardListRandom(limit);
		}
		return boardList;
	}
	
	public List<Pboard> search(ArrayList<String> opts, int page, int limit) {
		return mainDao.getBoardListSome(page, limit, opts);
	}
	
	public List<Loc> getSidoList() {
		return mainDao.getSidoList();
	}
	
	public List<Loc> getGunguList() {
		return mainDao.getGunguList();
	}
	
}
