package controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.PboardCommand;
import dao.BoardDao;
import member.AuthInfo;
import board.BoardService;
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
		int pageHostId = 1;
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
		return "page/pbMoreList";
	}
	
	@RequestMapping("/pbmorelistscroll") 
	public String pbMoreListScroll(HttpServletRequest request, Model model) {
		int pageHostId = 1;
		int mpage = Integer.parseInt(request.getParameter("pbPage"));
		int listCount = boardDao.getPboardListCount(pageHostId);
		int startPage = ((mpage - 1) * 10) +1;
		int endPage = startPage + 9;
		if(endPage >= listCount) {
			mpage = 0;
		}
		List<Pboard> pboardList = boardDao.getPboardList(pageHostId, startPage, endPage);
		model.addAttribute("pboardList", pboardList);
		request.setAttribute("pbMpage", mpage);
		return "page/pbMoreListScroll";
	}
	
	@RequestMapping("/pbwrite")
	public String pboardWrite(@ModelAttribute("pboardcmd") PboardCommand pbc, HttpServletRequest request) {
		AuthInfo authinfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authinfo == null) {
			return "redirect:/login";
		} else { 
			int pbhostid = 1;
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
			return "redirect:/page";
		}
	}
	
	@RequestMapping("/mbwrite")
	public String MboardWrite(MultipartHttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "page/mboardR";
		} else {
			int mbhostid = 1;
			int mbwriterid = authInfo.getMid();
			if(!(request.getFileNames().hasNext() == false)) {
				Iterator<String> itr = request.getFileNames();
				String str = itr.next();
				MultipartFile multi = request.getFile(str);
				String mbfile = multi.getOriginalFilename();
				String mbnewfile = System.currentTimeMillis() + "_" + mbfile;
				boardSvc.mboardWrite(mbhostid, mbwriterid, request.getParameter("mbsubject"), request.getParameter("mbcontent"), mbfile, mbnewfile);
				String path = request.getParameter("mbupdir") + mbnewfile;
				try {
					File file = new File(path);
					multi.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				boardSvc.mboardWrite(mbhostid, mbwriterid, request.getParameter("mbsubject"), request.getParameter("mbcontent"), null, null);
			}
			return "page/mboardR";
		}
	}
}















