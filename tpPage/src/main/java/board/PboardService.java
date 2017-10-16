package board;

import org.springframework.transaction.annotation.Transactional;

import dao.PboardDao;

public class PboardService {
	
	private PboardDao pboardDao;
	
	public PboardService(PboardDao pboardDao) {
		this.pboardDao = pboardDao;
	}
	
	@Transactional
	public void pboardWrite(int pbhostid, int pbwriterid, String pbsubject, String pbcontent, String pbfile,
			String pbnewfile) {
		
		Pboard pboard;
		pboard = new Pboard(pbhostid, pbwriterid, pbsubject, pbcontent, pbfile, pbnewfile);
		pboardDao.PboardWrite(pboard);
	}
}
