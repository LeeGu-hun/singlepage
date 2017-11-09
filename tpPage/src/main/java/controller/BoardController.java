package controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.PboardCommand;
import dao.BoardDao;
import dao.PageDao;
import member.AuthInfo;
import member.MemberCommand;
import page.Page;
import page.PageLike;
import board.BoardService;
import board.Mboard;
import board.MboardCommand;
import board.Pblike;
import board.Pboard;

@Controller
public class BoardController {
	
	private BoardService boardSvc;
	private BoardDao boardDao;

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
			return "redirect:/page/" + pbhostid;
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
	
	
	@RequestMapping("/mbwrite")
	public String mboardWrite(@ModelAttribute("mboardcmd") MboardCommand mbc, HttpServletRequest request,
			RedirectAttributes ra) {
		AuthInfo authinfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authinfo == null) {
			return "redirect:/login";
		} else { 
			String reMbTab = mbc.getMbTab();
			int mbhostid = mbc.getMbhostid();
			int mbwriterid = authinfo.getMid();
			MultipartFile multi = mbc.getMbfile();
			String mbfile = multi.getOriginalFilename();
			if(!(mbfile.equals(""))) {
				String mbnewfile = System.currentTimeMillis() + "_" + mbfile;
				boardSvc.mboardWrite(mbhostid, mbwriterid, mbc.getMbsubject(), mbc.getMbcontent(), mbfile, mbnewfile);
				String path = mbc.getMbupdir() + mbnewfile;
				try {
					File file = new File(path);
					multi.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				boardSvc.mboardWrite(mbhostid, mbwriterid, mbc.getMbsubject(), mbc.getMbcontent(), null, null);
			}
			ra.addFlashAttribute("reMbTab", reMbTab);
			return "redirect:/page/" + mbhostid;
		}
	}
	
	@RequestMapping("/loadpboard") 
	public String loadpboard(@ModelAttribute("pbrecmd") PboardCommand pbrecmd, HttpServletRequest request, Model model) {
		int pbid =  Integer.parseInt(request.getParameter("pbid"));
		Pboard pboard = boardDao.getpbDetail(pbid);
		List<Pboard> pbrelist = boardDao.getpbreDetail(pbid);
		model.addAttribute("pboard", pboard);
		model.addAttribute("pbrelist", pbrelist);
		
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if (authInfo != null) {
			Pblike pblike = boardDao.pblikeChk(authInfo.getMid(), pboard.getPbid());
			if (pblike == null) {
				model.addAttribute("pblikechk", 0);
			} else {
				model.addAttribute("pblikechk", pblike.getPblike());
			} 
		}
		return "board/loadpboardR";
	}
	
	@RequestMapping("/pbrewrite") 
	public String pbrewrite(@ModelAttribute("pbrecmd") PboardCommand pbrecmd, HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "board/ajaxlogin";
		} else {
			boardSvc.pbrewrite(pbrecmd, authInfo);
			List<Pboard> pbrelist = boardDao.getpbreDetail(pbrecmd.getPbid());
			model.addAttribute("pbrelist", pbrelist);
		}
		
		int pbid =  pbrecmd.getPbid();
		Pboard pboard = boardDao.getpbDetail(pbid);
		List<Pboard> pbrelist = boardDao.getpbreDetail(pbid);
		model.addAttribute("pboard", pboard);
		model.addAttribute("pbrelist", pbrelist);
		
		if (authInfo != null) {
			Pblike pblike = boardDao.pblikeChk(authInfo.getMid(), pboard.getPbid());
			if (pblike == null) {
				model.addAttribute("pblikechk", 0);
			} else {
				model.addAttribute("pblikechk", pblike.getPblike());
			} 
		}
		return "board/loadpboardR";
	}
	
	@RequestMapping("/pblike") 
	public String pblike(HttpServletRequest request, Model model) {
		
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		int mid = authInfo.getMid();
		int pbid = Integer.parseInt(request.getParameter("pbid"));
		int pblikechk = Integer.parseInt(request.getParameter("pblikechk"));
		
		if(pblikechk == 0) {
			boardDao.pblike(1, mid, pbid);
		} else {
			boardDao.pblike(0, mid, pbid);
		}
		
		Pblike pblike = boardDao.pblikeChk(authInfo.getMid(), pbid);
		model.addAttribute("pblikechk", pblike.getPblike());
		return "board/pblike";
	}
	
	@RequestMapping("/loadmboard") 
	public String loadmboard(@ModelAttribute("mbrecmd") MboardCommand mbrecmd, HttpServletRequest request, Model model) {
		int mbid =  Integer.parseInt(request.getParameter("mbid"));
		Mboard mboard = boardDao.getmbDetail(mbid);
		List<Mboard> mbrelist = boardDao.getmbreDetail(mbid);
		model.addAttribute("mboard", mboard);
		model.addAttribute("mbrelist", mbrelist);
		return "board/loadmboardR";
	}
	
	@RequestMapping("/mbrewrite") 
	public String mbrewrite(@ModelAttribute("mbrecmd") MboardCommand mbrecmd, HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "board/ajaxlogin";
		} else {
			boardSvc.mbrewrite(mbrecmd, authInfo);
			List<Mboard> mbrelist = boardDao.getmbreDetail(mbrecmd.getMbid());
			model.addAttribute("mbrelist", mbrelist);
		}
		
		int mbid = mbrecmd.getMbid();
		Mboard mboard = boardDao.getmbDetail(mbid);
		List<Mboard> mbrelist = boardDao.getmbreDetail(mbid);
		model.addAttribute("mboard", mboard);
		model.addAttribute("mbrelist", mbrelist);
		return "board/loadmboardR";
	}
	
	@RequestMapping("/pbreremove")
	public String pbreremove(HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "board/ajaxlogin";
		} else {
			int pbid = Integer.parseInt(request.getParameter("pbid"));
			int rmpbid = Integer.parseInt(request.getParameter("rmpbid"));
			model.addAttribute("pbid", pbid);
			model.addAttribute("rmpbid", rmpbid);
			return "board/pbreremoveR";
		}
	}
	
	@RequestMapping("/pbreremovego")
	public String pbreremovego(@ModelAttribute("pbrecmd") PboardCommand pbrecmd, HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "board/ajaxlogin";
		} else {
			int rmpbid = Integer.parseInt(request.getParameter("rmpbid"));
			boardDao.pbrerm(rmpbid);
		}
		
		int pbid = Integer.parseInt(request.getParameter("pbid"));
		Pboard pboard = boardDao.getpbDetail(pbid);
		List<Pboard> pbrelist = boardDao.getpbreDetail(pbid);
		model.addAttribute("pboard", pboard);
		model.addAttribute("pbrelist", pbrelist);
		return "board/loadpboardR";
	}
	
	@RequestMapping("/pbidrm")
	public String pbidrm(HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "board/ajaxlogin";
		} else {
			int pbid = Integer.parseInt(request.getParameter("pbid"));
			model.addAttribute("pbid", pbid);
			return "board/pbidrmR";
		}
	}
	
	@RequestMapping("/pbidrmgo")
	public String pbidrmgo(HttpServletRequest request, Model model) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "board/ajaxlogin";
		} else {
			
			return "board/null";
		}
	}
}













