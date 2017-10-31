package page;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import dao.PageDao;
import member.AuthInfo;

public class PageService {

	PageDao pageDao;
	
	public PageService(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public void makePage(AuthInfo authInfo, PageCommand pmc, HttpServletRequest request) {
		int pmaster = authInfo.getMid();
		MultipartFile multi = pmc.getPfile();
		String pfile = multi.getOriginalFilename();
		if(!(pfile.equals(""))) {
			String pnewfile = System.currentTimeMillis() + "_" + pfile;
			Page page = new Page(pmaster, pmc.getPname(), pmc.getPnick(), pmc.getPintro(),
					pmc.getPgenre(), pmc.getPloc(), pfile, pnewfile, null, null);
			int pid = pageDao.makePage(page);
			String path = pmc.getPupdir() + pnewfile;
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			authInfo = new AuthInfo(authInfo.getMid(), authInfo.getMname(), authInfo.getMemail(), authInfo.getMphone(),
					authInfo.getMcheck(), authInfo.getMpoint(), authInfo.getMdate(), pid);
			request.getSession().setAttribute("authInfo", authInfo);
		} else {
			Page page = new Page(pmaster, pmc.getPname(), pmc.getPnick(), pmc.getPintro(),
					pmc.getPgenre(), pmc.getPloc(), null, null, null, null);
			int pid = pageDao.makePage(page);
			authInfo = new AuthInfo(authInfo.getMid(), authInfo.getMname(), authInfo.getMemail(), authInfo.getMphone(),
					authInfo.getMcheck(), authInfo.getMpoint(), authInfo.getMdate(), pid);
			request.getSession().setAttribute("authInfo", authInfo);
		}
	}
	
	public void registerPoint(HttpServletRequest request) {
		
	}
}
