package controller;

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
	public String onLoad(HttpServletRequest req, Model model) {
		List<Pboard> boardList = mainService.getRandom(1, 6);
		model.addAttribute("boardList", boardList);
		return "home";
	}
	
	@RequestMapping("/srch")
	public String srch(HttpServletRequest req) {
		String city = req.getParameter("city");
		System.out.println(city);

		return "home";
	}

}


