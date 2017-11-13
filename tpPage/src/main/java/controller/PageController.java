package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.tools.ToolProvider;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.BoardService;
import board.Mboard;
import board.MboardCommand;
import board.Pboard;
import board.PboardCommand;
import dao.BoardDao;
import dao.MemberDao;
import dao.PageDao;
import member.AuthInfo;
import member.Member;
import member.MemberCommand;
import member.MemberService;
import page.Page;
import page.PageCommand;
import page.PageLike;
import page.PageService;
import page.PageTop;
import page.TopCommand;

@Controller
public class PageController {

	private PageDao pageDao;
	private PageService pageSvc;
	private BoardDao boardDao;
	private BoardService boardSvc;
	private MemberDao memberDao;
	private MemberService memberSvc;
	
	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public void setPageSvc(PageService pageSvc) {
		this.pageSvc = pageSvc;
	}
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public void setBoardSvc(BoardService boardSvc) {
		this.boardSvc = boardSvc;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void setMemberSvc(MemberService memberSvc) {
		this.memberSvc = memberSvc;
	}

	@RequestMapping("/page/{host}")
	public String pageLoad(@PathVariable("host") int host, @ModelAttribute("logincmd") MemberCommand logincmd,
			@ModelAttribute("pboardcmd") PboardCommand pbc, @ModelAttribute("mboardcmd") MboardCommand mbc,
			@ModelAttribute("pbrecmd") PboardCommand pbrecmd, Model model, HttpServletRequest request) {
		int pageHostId = host;
		Page page = pageDao.getPage(pageHostId);
		if(page == null) {
			return "redirect:/home"; 
		} else {
			if(request.getParameter("pbid") != null) {
				int pbid = Integer.parseInt(request.getParameter("pbid"));
				Pboard pboard = boardDao.getPboard(pbid);
				if(pboard != null) {
					model.addAttribute("gopbid", pboard.getPbid());
				}
			}
			model.addAttribute("nowpid", page.getPid());
			
			//board 부분
			int pbPage = boardSvc.pboardpage(pageHostId);
			List<Pboard> pboardList = boardSvc.getPboardList(pageHostId);
			int mbPage = boardSvc.mboardpage(pageHostId);
			List<Mboard> mboardList = boardSvc.getMboardList(pageHostId);
			model.addAttribute("page", page);
			request.setAttribute("pbPage", pbPage);
			model.addAttribute("pboardList", pboardList);
			request.setAttribute("mbPage", mbPage);
			model.addAttribute("mboardList", mboardList);
			
			//right 부분
			List<Page> related = pageSvc.getRelatedPages(page.getPgenre(), page.getPid());
			model.addAttribute("related", related);
			
			//left 부분
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
			
			//carousel
			List<PageTop> ptop = pageDao.selectCarousel(host);
			model.addAttribute("ptop", ptop);
			
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
			return "redirect:/page/" + host;
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
	public String pointDonate(HttpServletRequest request, HttpSession session, Model model) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		int mid = Integer.parseInt(request.getParameter("mid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		int ppoint = Integer.parseInt(request.getParameter("ppoint"));
		int dpoint = Integer.parseInt(request.getParameter("dmoney"));
		int mpoint = authInfo.getMpoint();	
		
		pageDao.regDonate(mid, pid, ppoint, dpoint);
		memberDao.regDonate(mid, pid, mpoint, dpoint);
		
		Member member = memberSvc.getAuthInfo(mid);
		AuthInfo authInfo2 = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(), member.getMphone(),
				member.getMcheck(), member.getMpoint(), member.getMdate(), authInfo.getPid());
		session.setAttribute("authInfo", authInfo2);
		model.addAttribute("ck" , authInfo2.getMpoint());
		return "page/ck";
	}
	
	@RequestMapping("/pointCharge")
	public String pointCharge(HttpServletRequest request, HttpSession session, Model model) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		int mid = Integer.parseInt(request.getParameter("mid"));
		int charge = Integer.parseInt(request.getParameter("charge"));
		int mpoint = authInfo.getMpoint();

		memberDao.regCharge(mid, charge, mpoint);
		
		Member member = memberSvc.getAuthInfo(mid);
		AuthInfo authInfo2 = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(), member.getMphone(),
				member.getMcheck(), member.getMpoint(), member.getMdate(), authInfo.getPid());
		session.setAttribute("authInfo", authInfo2);
		model.addAttribute("ck" , authInfo2.getMpoint());
		return "page/ck";
	}
	
	@RequestMapping("/admin")
	public String admin(HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		int pid = authInfo.getPid();
		Page page = pageDao.getPage(pid);
		String genre = page.getPgenre().split("-")[0].trim();
		String genreDetail = page.getPgenre().split("-")[1].trim();
		
		String start = page.getPshowtime().split("-")[0].trim();
		String end= page.getPshowtime().split("-")[1].trim();
		
		String[] genres = {"임의","노래","댄스","연주","연극","기타"};
		
		String lat = page.getPlatlng();
		if(lat != null) {			
			lat = page.getPlatlng().split("//")[0].trim();
		}
		String lng= page.getPlatlng();
		if(lng != null) {			
			lng= page.getPlatlng().split("//")[1].trim();
		}
		
		model.addAttribute("genres", genres);
		model.addAttribute("page", page);
		model.addAttribute("genre", genre);
		model.addAttribute("genreDetail", genreDetail);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		return "page/pageAdmin";
	}
	
	@RequestMapping("/adminpage")
	public String adminPage(@ModelAttribute("pagecmd") PageCommand pmc, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		int host = authInfo.getPid();
		pageSvc.adminPage(host, pmc);
		return "redirect:/page/" + host;
	}	
	
	@RequestMapping("/topModify")
	public String topModify(HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		int pid = authInfo.getPid();
		List<PageTop> ptop = pageDao.selectTop(pid);
		
		model.addAttribute("ptop", ptop);
		return "page/topModify";
	}
	
	@RequestMapping("/sendTop")
	public String modifyTop(@RequestParam("thum") MultipartFile[] thum, HttpServletRequest request, Model model) {
		System.out.println("asfdasdfasfdf");
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		int pid = authInfo.getPid();
		int count = Integer.parseInt(request.getParameter("count"));
		int originCnt = Integer.parseInt(request.getParameter("originCnt"));
		String[] tid = request.getParameterValues("tid");
		String[] turn = request.getParameterValues("turn");
		String[] link = request.getParameterValues("link");
		String[] checked = request.getParameterValues("checked");
		String[] tupdir = request.getParameterValues("tupdir");
		
		pageSvc.sendTop(originCnt, count, pid, tid, turn, link, thum, checked, tupdir);

		return "redirect:/page/" + pid;
	}
}
