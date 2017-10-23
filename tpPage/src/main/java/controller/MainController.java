package controller;

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
	public String onLoad(Model model) {
		List<Pboard> boardList = mainService.getRandom(1, 6);
		model.addAttribute("boardList", boardList);
		return "home";
	}
	
	@RequestMapping("/srch")
	public String srch(HttpServletRequest req, Model model) {
		String city = req.getParameter("city");
		Enumeration<String> e = req.getParameterNames();
		while (e.hasMoreElements()) {
			String name = e.nextElement();
			String[] data = req.getParameterValues(name);
			if(data!=null) {
				for(int i = 0; i <= data.length-1; i++) {
					System.out.print(data[i]);
					if (i != data.length-1) System.out.print(" / ");
				}
				System.out.println("");
			}
		}
		
		return "home";
	}

}


