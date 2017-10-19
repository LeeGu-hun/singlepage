package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.PboardCommand;
import page.PageService;

@Controller
public class PageController {

	private PageService pageSvc;
	
	public void setPageSvc(PageService pageSvc) {
		this.pageSvc = pageSvc;
	}

	@RequestMapping("/page")
	public String pageLoad(@ModelAttribute("pboardcmd") PboardCommand pbc, Model model, HttpServletRequest request) {
		
		
		
		
		
		
		
		
		
		return "page";
	}
}
