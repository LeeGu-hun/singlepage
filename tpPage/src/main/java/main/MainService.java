package main;

import java.util.ArrayList;
import java.util.List;

import board.Pboard;
import dao.MainDao;

public class MainService {
	MainDao mainDao;

	public MainService(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	
	public void getReco() {
		
	}
	
	public void getFavo() {
		
	}
	
	public void getHot() {
		
	}
	
	public void getNewbie() {
		
	}
	
	
	
	public List<Pboard> getRandom(int page, int limit) {
		List<Pboard> boardList = new ArrayList<Pboard>();
		if (mainDao.count()>0) {
			boardList = mainDao.getBoardListRandom(limit);
		}
		return boardList;
	}
	
	public List<Pboard> search(ArrayList<String> opts, int page, int limit) {
		return mainDao.getBoardListSome(page, limit, opts);
	}
	
	public List getCage(String cate) {
		List results = new ArrayList();
		
		
		return results;
	}
	
	
	
}
