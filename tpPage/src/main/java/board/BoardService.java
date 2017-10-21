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
		
		Pboard pboard = new Pboard(pbhostid, pbwriterid, pbsubject, pbcontent, pbfile, pbnewfile);
		boardDao.PboardWrite(pboard);
	}
	
	@Transactional
	public void mboardWrite(int mbhostid, int mbwriterid, String mbsubject, String mbcontent,
			String mbfile, String mbnewfile) {
		
		Mboard mboard = new Mboard(mbhostid, mbwriterid, mbsubject, mbcontent, mbfile, mbnewfile);
		boardDao.MboardWrite(mboard);
	}
}
