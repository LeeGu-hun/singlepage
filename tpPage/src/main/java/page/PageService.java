package page;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import dao.PageDao;
import member.AuthInfo;

public class PageService {

	PageDao pageDao;
	
	public PageService(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public int makePage(AuthInfo authInfo, PageCommand pmc, HttpServletRequest request) {
		int pmaster = authInfo.getMid();
		MultipartFile multi = pmc.getPfile();
		String pfile = multi.getOriginalFilename();
		if(!(pfile.equals(""))) {
			String pnewfile = System.currentTimeMillis() + "_" + pfile;
			Page page = new Page(pmaster, pmc.getPname(), pmc.getPnick(), pmc.getPintro(),
					pmc.getPgenre(), pmc.getPloc(), pfile, pnewfile, pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
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
			return pid;
		} else {
			Page page = new Page(pmaster, pmc.getPname(), pmc.getPnick(), pmc.getPintro(),
					pmc.getPgenre(), pmc.getPloc(), null, null, pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
			int pid = pageDao.makePage(page);
			authInfo = new AuthInfo(authInfo.getMid(), authInfo.getMname(), authInfo.getMemail(), authInfo.getMphone(),
					authInfo.getMcheck(), authInfo.getMpoint(), authInfo.getMdate(), pid);
			request.getSession().setAttribute("authInfo", authInfo);
			return pid;
		}
	}
	
	public List<Page> getRelatedPages(String genre, int hostId) {
		genre = genre.split(" - ")[0];
		List<Page> lists = pageDao.getRelatedPages(genre, hostId);
		return lists;
	}
	
	public void adminPage(int host, PageCommand pmc) {
		MultipartFile multi = pmc.getPfile();
		String pfile = multi.getOriginalFilename();
		if(!(pfile.equals(""))) {
			String pnewfile = System.currentTimeMillis() + "_" + pfile;
			Page page = new Page(host, pmc.getPname(), pmc.getPnick(), pmc.getPintro(),
					pmc.getPgenre(), pmc.getPloc(), pfile, pnewfile, pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
			pageDao.adminPage1(host, page);
			String path = pmc.getPupdir() + pnewfile;
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			Page page = new Page(host, pmc.getPname(), pmc.getPnick(), pmc.getPintro(),
					pmc.getPgenre(), pmc.getPloc(), pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
			pageDao.adminPage2(host, page);
		}
	}
	
	public void sendTop(int count, int pid, String[] turn, String[] link, MultipartFile[] thum, String[] checked, String[] tupdir) {	 
		for (int i = 0; i <count; i++) {
			String tfile = thum[i].getOriginalFilename();
			String newtfile = System.currentTimeMillis() + "_" + tfile;
			pageDao.addToplist(pid, turn[i], link[i], tfile, newtfile, checked[i]);
			String path = tupdir[i] + newtfile;
			try {
				File file = new File(path);
				thum[i].transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
