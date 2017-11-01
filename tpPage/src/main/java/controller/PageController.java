package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import board.BoardService;
import board.Mboard;
import board.MboardCommand;
import board.Pboard;
import board.PboardCommand;
import dao.MemberDao;
import dao.PageDao;
import member.AuthInfo;
import member.Member;
import member.MemberCommand;
import page.Page;
import page.PageCommand;
import page.PageLike;
import page.PageService;

@Controller
public class PageController {

	private PageDao pageDao;
	private PageService pageSvc;
	private BoardService boardSvc;
	private MemberDao memberDao;
	
	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public void setPageSvc(PageService pageSvc) {
		this.pageSvc = pageSvc;
	}
	
	public void setBoardSvc(BoardService boardSvc) {
		this.boardSvc = boardSvc;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@RequestMapping("/page")
	public String pageLoad(@RequestParam("host") int host, @ModelAttribute("pboardcmd") PboardCommand pbc,
			@ModelAttribute("mboardcmd") MboardCommand mbc, @ModelAttribute("logincmd") MemberCommand logincmd,
			Model model, HttpServletRequest request) {
		int pageHostId = host;
		Page page = pageDao.getPage(pageHostId);
		/*System.out.println(page.getPlatlng());*/
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
	
	@RequestMapping("/pagemaker")
	public String pageMaker(@ModelAttribute("pagecmd") PageCommand pmc, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "redirect:/membermanager";
		} else {
			return "page/pageMaker";
		}		
	}
	
	@RequestMapping("/makepage")
	public String makePage(@ModelAttribute("pagecmd") PageCommand pmc,
			HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "redirect:/membermanager";
		} else {
			int host = pageSvc.makePage(authInfo, pmc, request);
			return "redirect:/page?host=" + host;
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
	
	@RequestMapping("/pointDonate")
	public String pointDonate(HttpServletRequest request, AuthInfo authInfo, Page page) {
		int mid = Integer.parseInt(request.getParameter("mid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		int ppoint = Integer.parseInt(request.getParameter("ppoint"));
//		int ppoint = page.getPpoint();
//		System.out.println(ppoint);
		int mpoint = authInfo.getMpoint();
		int dpoint = Integer.parseInt(request.getParameter("dmoney"));
		
		pageDao.regDonate(mid, pid, ppoint, dpoint);
		memberDao.regDonate(mid, pid, mpoint, dpoint);
		return "page";
	}
	
	@RequestMapping("/pointCharge")
	public void pointCharge(HttpServletRequest request, AuthInfo authInfo, HttpSession session) {
		int mid = Integer.parseInt(request.getParameter("mid"));
		int charge = Integer.parseInt(request.getParameter("charge"));
		int mpoint = authInfo.getMpoint();
		memberDao.regCharge(mid, charge, mpoint);
		authInfo = (AuthInfo) session.getAttribute("authInfo");
		Member member = memberDao.selectByEmail(authInfo.getMemail());
		authInfo.setMpoint((member.getMpoint()));
		session.setAttribute("authInfo", authInfo);
	}

//	@RequestMapping("/modify") 
//	public String pageModify() {
//		
//		return "page/pageModify";
//	}
}
