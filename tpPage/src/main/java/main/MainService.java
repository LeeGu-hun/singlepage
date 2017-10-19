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
	
	public void getWing() {
		
	}
	
	public void getNewbie() {
		
	}
	
	public List<Pboard> getRandom(int page, int limit) {
		List<Pboard> boardList = new ArrayList<Pboard>();
		if (mainDao.count()>0) {
			for (int i = page; i <= limit; i++) {
				Pboard newboard = mainDao.getBoardListRandom();
				boardList.add(newboard);
			}
		}
		return boardList;
	}
	
	
	
}
