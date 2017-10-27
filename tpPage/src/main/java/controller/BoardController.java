package controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.PboardCommand;
import dao.BoardDao;
import dao.PageDao;
import member.AuthInfo;
import page.Page;
import board.BoardService;
import board.Mboard;
import board.Pboard;

@Controller
public class BoardController {
	
	private PageDao pageDao;
	private BoardService boardSvc;
	private BoardDao boardDao;

	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public void setBoardSvc(BoardService boardSvc) {
		this.boardSvc = boardSvc;
	}

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@RequestMapping("/pbmorelist")
	public String pbMoreList(HttpServletRequest request, Model model) {
		int pageHostId = Integer.parseInt(request.getParameter("pbhostid"));
		int page = Integer.parseInt(request.getParameter("pbPage"));
		int listCount = boardDao.getPboardListCount(pageHostId);
		int startPage = 1;
		int endPage = startPage + (((page - 1) * 10) + 9);
		if(endPage >= listCount) {
			page = 0;
		}
		List<Pboard> pboardList = boardDao.getPboardList(pageHostId, startPage, endPage);
		model.addAttribute("pboardList", pboardList);
		request.setAttribute("pbPage", page);
		return "board/pbMoreList";
	}
	
	@RequestMapping("/pbmorelistscroll") 
	public String pbMoreListScroll(HttpServletRequest request, Model model) {
		int pageHostId = Integer.parseInt(request.getParameter("pbhostid"));
		int mpage = Integer.parseInt(request.getParameter("pbPage"));
		int listCount = boardDao.getPboardListCount(pageHostId);
		int startPage = ((mpage - 1) * 10) +1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			mpage = -1;
		}
		List<Pboard> pboardList = boardDao.getPboardList(pageHostId, startPage, endPage);
		model.addAttribute("pboardList", pboardList);
		request.setAttribute("pbMpage", mpage);
		return "board/pbMoreListScroll";
	}
	
	@RequestMapping("/pbwrite")
	public String pboardWrite(@ModelAttribute("pboardcmd") PboardCommand pbc, HttpServletRequest request) {
		AuthInfo authinfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authinfo == null) {
			return "redirect:/login";
		} else { 
			int pbhostid = pbc.getPbhostid();
			int pbwriterid = authinfo.getMid();
			MultipartFile multi = pbc.getPbfile();
			String pbfile = multi.getOriginalFilename();
				if(!(pbfile.equals(""))) {
				String pbnewfile = System.currentTimeMillis() + "_" + pbfile;
				boardSvc.pboardWrite(pbhostid, pbwriterid, pbc.getPbsubject(), pbc.getPbcontent(), pbfile, pbnewfile);
				String path = pbc.getPbupdir() + pbnewfile;
				try {
					File file = new File(path);
					multi.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				boardSvc.pboardWrite(pbhostid, pbwriterid, pbc.getPbsubject(), pbc.getPbcontent(), null, null);
			}
			return "redirect:/page?host=" + pbhostid;
		}
	}
	
	@RequestMapping("/mbmorelist")
	public String mbMoreList(HttpServletRequest request, Model model) {
		int pageHostId = Integer.parseInt(request.getParameter("mbhostid"));
		int page = Integer.parseInt(request.getParameter("mbPage"));
		int listCount = boardDao.getMboardListCount(pageHostId);
		int startPage = 1;
		int endPage = startPage + (((page - 1) * 10) + 9);
		if(endPage >= listCount) {
			page = 0;
		}
		List<Mboard> mboardList = boardDao.getMboardList(pageHostId, startPage, endPage);
		model.addAttribute("mboardList", mboardList);
		request.setAttribute("mbPage", page);
		return "board/mbMoreList";
	}
	
	@RequestMapping("/mbmorelistscroll") 
	public String mbMoreListScroll(HttpServletRequest request, Model model) {
		int pageHostId = Integer.parseInt(request.getParameter("mbhostid"));
		int mpage = Integer.parseInt(request.getParameter("mbPage"));
		int listCount = boardDao.getMboardListCount(pageHostId);
		int startPage = ((mpage - 1) * 10) +1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			mpage = -1;
		}
		List<Mboard> mboardList = boardDao.getMboardList(pageHostId, startPage, endPage);
		model.addAttribute("mboardList", mboardList);
		request.setAttribute("mbMpage", mpage);
		return "board/mbMoreListScroll";
	}
	
	@RequestMapping("/mbmorelistW")
	public String mbMoreListW(HttpServletRequest request, Model model) {
		int pageHostId = Integer.parseInt(request.getParameter("mbhostid"));
		int page = Integer.parseInt(request.getParameter("mbPageW"));
		int listCount = boardDao.getMboardListCount(pageHostId);
		int startPage = 1;
		int endPage = startPage + (((page - 1) * 10) + 9);
		if(endPage >= listCount) {
			page = 0;
		}
		List<Mboard> mboardList = boardDao.getMboardList(pageHostId, startPage, endPage);
		model.addAttribute("mboardList", mboardList);
		request.setAttribute("mbPageW", page);
		return "board/mbMoreListW";
	}
	
	@RequestMapping("/mbmorelistscrollW") 
	public String mbMoreListScrollW(HttpServletRequest request, Model model) {
		int pageHostId = Integer.parseInt(request.getParameter("mbhostid"));
		int mpage = Integer.parseInt(request.getParameter("mbPageW"));
		int listCount = boardDao.getMboardListCount(pageHostId);
		int startPage = ((mpage - 1) * 10) +1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			mpage = -1;
		}
		List<Mboard> mboardList = boardDao.getMboardList(pageHostId, startPage, endPage);
		model.addAttribute("mboardList", mboardList);
		request.setAttribute("mbMpageW", mpage);
		return "board/mbMoreListScrollW";
	}
	
	@RequestMapping("/mbwrite")
	public String MboardWrite(MultipartHttpServletRequest mrequest, Model model, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "board/mboardW";
		} else {
			int mbhostid = Integer.parseInt(mrequest.getParameter("mbhostid"));
			Page page = pageDao.getPage(mbhostid);
			int mbwriterid = authInfo.getMid();
			if(!(mrequest.getFileNames().hasNext() == false)) {
				Iterator<String> itr = mrequest.getFileNames();
				String str = itr.next();
				MultipartFile multi = mrequest.getFile(str);
				String mbfile = multi.getOriginalFilename();
				String mbnewfile = System.currentTimeMillis() + "_" + mbfile;
				boardSvc.mboardWrite(mbhostid, mbwriterid, mrequest.getParameter("mbsubject"), mrequest.getParameter("mbcontent"), mbfile, mbnewfile);
				String path = mrequest.getParameter("mbupdir") + mbnewfile;
				try {
					File file = new File(path);
					multi.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				int mbPageW = boardSvc.mboardpage(mbhostid);
				model.addAttribute("page", page);
				List<Mboard> mboardList = boardSvc.getMboardList(mbhostid);
				request.setAttribute("mbPageW", mbPageW);
				model.addAttribute("mboardList", mboardList);
			} else {
				boardSvc.mboardWrite(mbhostid, mbwriterid, mrequest.getParameter("mbsubject"), mrequest.getParameter("mbcontent"), null, null);
				int mbPageW = boardSvc.mboardpage(mbhostid);
				model.addAttribute("page", page);
				List<Mboard> mboardList = boardSvc.getMboardList(mbhostid);
				request.setAttribute("mbPageW", mbPageW);
				model.addAttribute("mboardList", mboardList);
			}
			return "board/mboardW";
		}
	}
}















