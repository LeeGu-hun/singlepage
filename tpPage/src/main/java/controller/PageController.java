package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.BoardService;
import board.Mboard;
import board.Pboard;
import board.PboardCommand;
import member.AuthInfo;
import page.PageService;

@Controller
public class PageController {

	private PageService pageSvc;
	private BoardService boardSvc;
	
	public void setPageSvc(PageService pageSvc) {
		this.pageSvc = pageSvc;
	}
	
	public void setBoardSvc(BoardService boardSvc) {
		this.boardSvc = boardSvc;
	}

	@RequestMapping("/page")
	public String pageLoad(@ModelAttribute("pboardcmd") PboardCommand pbc, Model model, HttpServletRequest request) {
		int pageHostId = 1;
		int pbPage = boardSvc.pboardpage(pageHostId);
		List<Pboard> pboardList = boardSvc.getPboardList(pageHostId);
		int mbPage = boardSvc.mboardpage(pageHostId);
		List<Mboard> mboardList = boardSvc.getMboardList(pageHostId);
		request.setAttribute("pbPage", pbPage);
		model.addAttribute("pboardList", pboardList);
		request.setAttribute("mbPage", mbPage);
		model.addAttribute("mboardList", mboardList);
		return "page";
	}
	
	
}
