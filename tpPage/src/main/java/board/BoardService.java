package board;

import org.springframework.transaction.annotation.Transactional;

import dao.BoardDao;

public class BoardService {
	
	private BoardDao boardDao;
	
	public BoardService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@Transactional
	public void pboardWrite(int pbhostid, int pbwriterid, String pbsubject, String pbcontent,
			String pbfile, String pbnewfile) {
		
		Pboard pboard;
		pboard = new Pboard(pbhostid, pbwriterid, pbsubject, pbcontent, pbfile, pbnewfile);
		boardDao.PboardWrite(pboard);
	}
}
