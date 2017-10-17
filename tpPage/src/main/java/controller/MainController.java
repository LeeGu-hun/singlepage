package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import main.MainService;

@Controller
public class MainController {
	MainService mainService;

	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	@RequestMapping("/home")
	public String onLoad() {
		return "home";
	}

}


