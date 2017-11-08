package board;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import dao.BoardDao;
import member.AuthInfo;

public class BoardService {
	
	private BoardDao boardDao;
	
	public BoardService(BoardDao boardDao) {
		
		this.boardDao = boardDao;
	}

	public int pboardpage(int pageHostId) {
		int page = 1;
		int listCount = boardDao.getPboardListCount(pageHostId);
		int startPage = 1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			page = 0;
		}
		if(listCount == 0) {
			page = -1;
		}
		return page;
	}

	public List<Pboard> getPboardList(int pageHostId) {
		int page = 1;
		int listCount = boardDao.getPboardListCount(pageHostId);
		int startPage = 1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			page = 0;
		}
		if(listCount == 0) {
			page = -1;
		}
		List<Pboard> pboardList = boardDao.getPboardList(pageHostId, startPage, endPage);
		return pboardList;
	}
	
	public int mboardpage(int pageHostId) {
		int page = 1;
		int listCount = boardDao.getMboardListCount(pageHostId);
		int startPage = 1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			page = 0;
		}
		if(listCount == 0) {
			page = -1;
		}
		return page;
	}
	
	public List<Mboard> getMboardList(int pageHostId) {
		int page = 1;
		int listCount = boardDao.getMboardListCount(pageHostId);
		int startPage = 1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			page = 0;
		}
		if(listCount == 0) {
			page = -1;
		}
		List<Mboard> mboardList = boardDao.getMboardList(pageHostId, startPage, endPage);
		return mboardList;
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

	public void pbrewrite(PboardCommand pbrecmd, AuthInfo authInfo) {
		
		boardDao.pbrewrite(pbrecmd.getPbid(), pbrecmd.getPbreid(), pbrecmd.getPbcontent() , pbrecmd.getPbhostid(), authInfo.getMid());
	}

	public void mbrewrite(MboardCommand mbrecmd, AuthInfo authInfo) {
		boardDao.mbrewrite(mbrecmd.getMbid(), mbrecmd.getMbreid(), mbrecmd.getMbcontent() , mbrecmd.getMbhostid(), authInfo.getMid());
	}
}



