package controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.Pboard;
import dao.MainDao;
import main.Loc;
import main.MainService;
import member.AuthInfo;
import member.MemberCommand;

@Controller
public class MainController {
	MainService mainService;

	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	@RequestMapping("/home")
	public String onLoad(@ModelAttribute("logincmd") MemberCommand logincmd, Model model, HttpServletRequest req) {
		int page = 1; int limit = 9;
		List<Pboard> boardList = mainService.getRandom(page, limit);
		model.addAttribute("boardList", boardList);
		return "home";
	}
	
	@RequestMapping("/srch")
	public String srch(HttpServletRequest req, Model model, @ModelAttribute("logincmd") MemberCommand logincmd) {
		int page = 1; int limit = 9;
		Enumeration<String> e = req.getParameterNames();
		ArrayList<String> list = new ArrayList<String>();
		while (e.hasMoreElements()) {
			String name = e.nextElement();
			if(name.equals("page")) continue;
			String srchOpt = name + "=";
			String[] data = req.getParameterValues(name);
			if(data[0].equals("more")) {
				return onLoad(logincmd, model, req);
			}
			if(data[0].equals("all")) continue;
			if(data!=null) {
				for(int i = 0; i <= data.length-1; i++) {
					srchOpt += data[i];
					if (i != data.length-1) srchOpt += ",";
				}
				list.add(srchOpt);
			}
		}
		List<Pboard> boardList = mainService.search(list, page, limit);
		List<Loc> sidoList = mainService.getSidoList();
		List<Loc> gunguList = mainService.getGunguList();

		model.addAttribute("sidoList", sidoList);
		model.addAttribute("gunguList", gunguList);
		model.addAttribute("boardList", boardList);
		req.setAttribute("searched", sidoList);
		return "home";
	}
	
	@RequestMapping("/loadSrch")
	public String loadSrch(HttpServletRequest req, Model model, @ModelAttribute("logincmd") MemberCommand logincmd) {
		int page = 1;
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		page = page * 9 + 1;
		int limit = page + 8;
		Enumeration<String> e = req.getParameterNames();
		ArrayList<String> list = new ArrayList<String>();
		while (e.hasMoreElements()) {
			String name = e.nextElement();
			if(name.equals("page")) continue;
			String srchOpt = name + "=";
			String[] data = req.getParameterValues(name);
			if(data!=null) {
				for(int i = 0; i <= data.length-1; i++) {
					srchOpt += data[i];
					if (i != data.length-1) srchOpt += ",";
				}
				list.add(srchOpt);
			}
		}
		List<Pboard> appendList = mainService.search(list, page, limit);
		model.addAttribute("appendList", appendList);
		
		return "main/load";
	}
	
	
	@RequestMapping("/loadMain")
	public String load(HttpServletRequest req, Model model, @ModelAttribute("logincmd") MemberCommand logincmd) {
		int page = 1;
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		page = page * 9 + 1;
		int limit = page + 8;
		List<Pboard> appendList = mainService.getRandom(page, limit);
		model.addAttribute("appendList", appendList);
		
		return "main/load";
	}
	
	
	@RequestMapping("/favo")
	public String favo(HttpServletRequest req, Model model, @ModelAttribute("logincmd") MemberCommand logincmd) {
		int page = 1; int limit = 9;
		AuthInfo authInfo = (AuthInfo)req.getSession().getAttribute("authInfo");
		List<Pboard> boardList = mainService.getFavo(page, limit, authInfo.getMid());
		model.addAttribute("boardList", boardList);
		req.setAttribute("favo", 0);
		
		return "home";
	}
	
	@RequestMapping("/loadFavo")
	public String loadFavo(HttpServletRequest req, Model model, @ModelAttribute("logincmd") MemberCommand logincmd) {
		int page = 1;
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		page = page * 9 + 1;
		int limit = page + 8;
		AuthInfo authInfo = (AuthInfo)req.getSession().getAttribute("authInfo");
		List<Pboard> favoList = mainService.getFavo(page, limit, authInfo.getMid());
		model.addAttribute("appendList", favoList);
		
		return "main/load";
	}
}

