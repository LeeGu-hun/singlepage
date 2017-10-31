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
		int page = Integer.parseInt(req.getParameter("page"));
		int startPage = page * 9 + 1;
		int limit = startPage + 9;
		Enumeration<String> e = req.getParameterNames();
		ArrayList<String> list = new ArrayList<String>();
		while (e.hasMoreElements()) {
			String name = e.nextElement();
			if(name.equals("page")) continue;
			String srchOpt = name + "=";
			String[] data = req.getParameterValues(name);
			if(data[0].equals("more")) {
				return onLoad(model, req);
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
		
//		List<Loc> locList = mainService.getLoc(sido);
		model.addAttribute("boardList", boardList);
		req.setAttribute("searched", boardList);
//		model.addAttribute("locList", locList);
		return "home";
	}
	
	@RequestMapping("/loadMain")
	public String load(HttpServletRequest req, Model model, @ModelAttribute("logincmd") MemberCommand logincmd) {
		System.out.println(req.getParameter("page"));
		int page = Integer.parseInt(req.getParameter("page"));
		int startPage = page * 9 + 1;
		int limit = startPage + 9;
		String srch = req.getParameter("srch");
		req.setAttribute("searched", srch);
		List<Pboard> appendList = new ArrayList<Pboard>();
		if(srch == null) {
			appendList = mainService.getRandom(page, limit);
		} else {
			Enumeration<String> e = req.getParameterNames();
			ArrayList<String> list = new ArrayList<String>();
			while (e.hasMoreElements()) {
				String name = e.nextElement();
				if(name.equals("page")) continue;
				String srchOpt = name + "=";
				String[] data = req.getParameterValues(name);
				if(data[0].equals("more")) {
					return onLoad(model, req);
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
			appendList = mainService.search(list, page, limit);
		}
		model.addAttribute("appendList", appendList);
		
		return "main/load";
	}
}

