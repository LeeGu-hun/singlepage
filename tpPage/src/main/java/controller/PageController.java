package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardService;
import board.Mboard;
import board.MboardCommand;
import board.Pboard;
import board.PboardCommand;
import dao.PageDao;
import member.AuthInfo;
import page.Page;
import page.PageCommand;
import page.PageLike;
import page.PageService;

@Controller
public class PageController {

	private PageDao pageDao;
	private PageService pageSvc;
	private BoardService boardSvc;
	
	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public void setPageSvc(PageService pageSvc) {
		this.pageSvc = pageSvc;
	}
	
	public void setBoardSvc(BoardService boardSvc) {
		this.boardSvc = boardSvc;
	}

	@RequestMapping("/page")
	public String pageLoad(@RequestParam("host") int host, @ModelAttribute("pboardcmd") PboardCommand pbc,
			@ModelAttribute("mboardcmd") MboardCommand mbc, Model model, HttpServletRequest request) {
		int pageHostId = host;
		Page page = pageDao.getPage(pageHostId);
		if(page == null) {
			return "redirect:/home"; 
		} else {	
			int pbPage = boardSvc.pboardpage(pageHostId);
			List<Pboard> pboardList = boardSvc.getPboardList(pageHostId);
			int mbPage = boardSvc.mboardpage(pageHostId);
			List<Mboard> mboardList = boardSvc.getMboardList(pageHostId);
			model.addAttribute("page", page);
			request.setAttribute("pbPage", pbPage);
			model.addAttribute("pboardList", pboardList);
			request.setAttribute("mbPage", mbPage);
			model.addAttribute("mboardList", mboardList);
			
			AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
			if (authInfo !=null) {
				int memId = authInfo.getMid();
				List<PageLike> ckList = pageDao.plikeCheck(memId, pageHostId);
				if (ckList.size() == 0) {
					model.addAttribute("ck", 0);
				} else {
					int ck = ckList.get(0).getPlike();
					model.addAttribute("ck", ck);
				} 
			}
			return "page";
		}
	}
	
	/*@RequestMapping("/page/{pid}")
	public String pageLoadp(@PathVariable int pid, @ModelAttribute("pboardcmd") PboardCommand pbc, Model model, HttpServletRequest request) {
		int pageHostId = pid;
		int pbPage = boardSvc.pboardpage(pageHostId);
		List<Pboard> pboardList = boardSvc.getPboardList(pageHostId);
		int mbPage = boardSvc.mboardpage(pageHostId);
		List<Mboard> mboardList = boardSvc.getMboardList(pageHostId);
		request.setAttribute("pbPage", pbPage);
		model.addAttribute("pboardList", pboardList);
		request.setAttribute("mbPage", mbPage);
		model.addAttribute("mboardList", mboardList);
		
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if (authInfo !=null) {
			int memId = authInfo.getMid();
			int pageId = authInfo.getPid();
			List<PageLike> ckList = pageDao.plikeCheck(memId, pageId);
			if (ckList.size() == 0) {
				model.addAttribute("ck", 0);
			} else {
				int ck = ckList.get(0).getPlike();
				model.addAttribute("ck", ck);
			} 
		}
		return "page";
	}*/
	
	@RequestMapping("/pagemaker")
	public String pageMaker(@ModelAttribute("pagecmd") PageCommand pmc, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "redirect:/login";
		} else {
			return "page/pageMaker";
		}		
	}
	
	@RequestMapping("/makepage")
	public String makePage(@ModelAttribute("pagecmd") PageCommand pmc,
			HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "redirect:/login";
		} else {
			pageSvc.makePage(authInfo, pmc, request);
			return "redirect:/home";
		}
	}	
	
	@RequestMapping("/chklike")
	public String chkLike(HttpServletRequest request, Model model) {
		int memId = Integer.parseInt(request.getParameter("mid"));
		int pageId = Integer.parseInt(request.getParameter("pid"));
		int ck = Integer.parseInt(request.getParameter("ck"));
		if (ck == 0) {
			pageDao.plikeToggle(1, memId, pageId);
		} else {
			pageDao.plikeToggle(0, memId, pageId);
		}
		
		List<PageLike> ckList = pageDao.plikeCheck(memId, pageId);
		model.addAttribute("ck", ckList.get(0).getPlike());
		return "page/ck";
	}
	
	/*@RequestMapping("/modify") 
	public String pageModify() {
		
		return "page/pageModify";
	}*/
}
