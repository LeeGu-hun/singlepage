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
		if (!(pfile.equals(""))) {
			String pnewfile = System.currentTimeMillis() + "_" + pfile;
			Page page = new Page(pmaster, pmc.getPname(), pmc.getPnick(), pmc.getPintro(), pmc.getPgenre(),
					pmc.getPloc(), pfile, pnewfile, pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
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
			Page page = new Page(pmaster, pmc.getPname(), pmc.getPnick(), pmc.getPintro(), pmc.getPgenre(),
					pmc.getPloc(), null, null, pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
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
		if (!(pfile.equals(""))) {
			String pnewfile = System.currentTimeMillis() + "_" + pfile;
			Page page = new Page(host, pmc.getPname(), pmc.getPnick(), pmc.getPintro(), pmc.getPgenre(), pmc.getPloc(),
					pfile, pnewfile, pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
			pageDao.adminPage1(host, page);
			String path = pmc.getPupdir() + pnewfile;
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			Page page = new Page(host, pmc.getPname(), pmc.getPnick(), pmc.getPintro(), pmc.getPgenre(), pmc.getPloc(),
					pmc.getPperiod(), pmc.getPshowtime(), pmc.getPlatlng());
			pageDao.adminPage2(host, page);
		}
	}

	public void sendTop(int originCnt, int count, int pid, String[] tid, String[] turn, String[] link, MultipartFile[] thum,
			String[] checked, String[] tupdir) {
		if (originCnt == 0) {
			for (int i = 0; i < count; i++) {	
				String tfile = thum[i].getOriginalFilename();
				if (!(tfile.equals(""))) {					
					String newtfile = System.currentTimeMillis() + "_" + tfile;
					pageDao.addToplist1(pid, turn[i], link[i], tfile, newtfile, checked[i]);
					String path = tupdir[i] + newtfile;
					try {
						File file = new File(path);
						thum[i].transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					pageDao.addToplist2(pid, turn[i], link[i], checked[i]);
				}
			}
		} else if (originCnt <= count) {			
			for (int i = 0; i < count; i++) {			
				String stid = pageDao.selectExistTurn(turn[i]);
				if (stid.equals("")) {
					String tfile = thum[i].getOriginalFilename();
					if (!(tfile.equals(""))) {					
						String newtfile = System.currentTimeMillis() + "_" + tfile;
						pageDao.addToplist1(pid, turn[i], link[i], tfile, newtfile, checked[i]);
						String path = tupdir[i] + newtfile;
						try {
							File file = new File(path);
							thum[i].transferTo(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						pageDao.addToplist2(pid, turn[i], link[i], checked[i]);
					}
				} else if (!(stid.equals(tid[i]))) {
					pageDao.deleteTurn(pid, turn[i]);
					if (tid[i].equals("")) {
						String tfile = thum[i].getOriginalFilename();
						if (!(tfile.equals(""))) {					
							String newtfile = System.currentTimeMillis() + "_" + tfile;
							pageDao.addToplist1(pid, turn[i], link[i], tfile, newtfile, checked[i]);
							String path = tupdir[i] + newtfile;
							try {
								File file = new File(path);
								thum[i].transferTo(file);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
							pageDao.addToplist2(pid, turn[i], link[i], checked[i]);
						}
					} else {
						String tfile = thum[i].getOriginalFilename();
						if (!(tfile.equals(""))) {					
							String newtfile = System.currentTimeMillis() + "_" + tfile;
							pageDao.updateToplist1(tid[i], turn[i], link[i], tfile, newtfile, checked[i]);
							String path = tupdir[i] + newtfile;
							try {
								File file = new File(path);
								thum[i].transferTo(file);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
							pageDao.updateToplist2(tid[i], turn[i], link[i], checked[i]);
						}
					}
				} else {
					String tfile = thum[i].getOriginalFilename();
					if (!(tfile.equals(""))) {					
						String newtfile = System.currentTimeMillis() + "_" + tfile;
						pageDao.updateToplist1(tid[i], turn[i], link[i], tfile, newtfile, checked[i]);
						String path = tupdir[i] + newtfile;
						try {
							File file = new File(path);
							thum[i].transferTo(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						pageDao.updateToplist2(tid[i], turn[i], link[i], checked[i]);
					}
				}
			}
		} else {
			for (int i = 0; i < count; i++) {				
				String stid = pageDao.selectExistTurn(turn[i]);
				if (stid.equals("")) {
					String tfile = thum[i].getOriginalFilename();
					if (!(tfile.equals(""))) {					
						String newtfile = System.currentTimeMillis() + "_" + tfile;
						pageDao.addToplist1(pid, turn[i], link[i], tfile, newtfile, checked[i]);
						String path = tupdir[i] + newtfile;
						try {
							File file = new File(path);
							thum[i].transferTo(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						pageDao.addToplist2(pid, turn[i], link[i], checked[i]);
					}
				} else if (!(stid.equals(tid[i]))) {
					pageDao.deleteTurn(pid, turn[i]);
					if (tid[i].equals("")) {
						String tfile = thum[i].getOriginalFilename();
						if (!(tfile.equals(""))) {					
							String newtfile = System.currentTimeMillis() + "_" + tfile;
							pageDao.addToplist1(pid, turn[i], link[i], tfile, newtfile, checked[i]);
							String path = tupdir[i] + newtfile;
							try {
								File file = new File(path);
								thum[i].transferTo(file);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
							pageDao.addToplist2(pid, turn[i], link[i], checked[i]);
						}
					} else {
						String tfile = thum[i].getOriginalFilename();
						if (!(tfile.equals(""))) {					
							String newtfile = System.currentTimeMillis() + "_" + tfile;
							pageDao.updateToplist1(tid[i], turn[i], link[i], tfile, newtfile, checked[i]);
							String path = tupdir[i] + newtfile;
							try {
								File file = new File(path);
								thum[i].transferTo(file);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
							pageDao.updateToplist2(tid[i], turn[i], link[i], checked[i]);
						}
					}
				} else {
					String tfile = thum[i].getOriginalFilename();
					if (!(tfile.equals(""))) {					
						String newtfile = System.currentTimeMillis() + "_" + tfile;
						pageDao.updateToplist1(tid[i], turn[i], link[i], tfile, newtfile, checked[i]);
						String path = tupdir[i] + newtfile;
						try {
							File file = new File(path);
							thum[i].transferTo(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						pageDao.updateToplist2(tid[i], turn[i], link[i], checked[i]);
					}
				}
			}
			for (int i = (count+1); i <= originCnt; i++) {
				pageDao.deleteTurn(pid, String.valueOf(i));
			}
		}
	}
}
