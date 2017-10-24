package controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import board.Pboard;
import main.MainService;

@Controller
public class MainController {
	MainService mainService;

	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	@RequestMapping("/home")
	public String onLoad(Model model, HttpServletRequest req) {
//		int page = Integer.parseInt(req.getParameter("page"));
//		int limit = Integer.parseInt(req.getParameter("limit"));
		int page = 1; int limit = 6;
		List<Pboard> boardList = mainService.getRandom(page, limit);
		model.addAttribute("boardList", boardList);
		return "home";
	}
	
	@RequestMapping("/srch")
	public String srch(HttpServletRequest req, Model model) {
//		int page = Integer.parseInt(req.getParameter("page"));
//		int limit = Integer.parseInt(req.getParameter("limit"));
		int page = 1; int limit = 6;
		Enumeration<String> e = req.getParameterNames();
		ArrayList<String> list = new ArrayList<String>();
		while (e.hasMoreElements()) {
			String name = e.nextElement();
			String srchOpt = name + "=";
			String[] data = req.getParameterValues(name);
			if(data[0].equals("more")) break;
			if(data[0].equals("all")) continue;
			if(data!=null) {
				for(int i = 0; i <= data.length-1; i++) {
					srchOpt += data[i];
					if (i != data.length-1) srchOpt += ",";
				}
				list.add(srchOpt);
			}
		}
		for(int i = 0; i <=list.size()-1; i++) {
			System.out.println(list.get(i));
		}
		List<Pboard> boardList = mainService.search(list, page, limit);
		model.addAttribute("boardList", boardList);
		return "home";
	}
}


