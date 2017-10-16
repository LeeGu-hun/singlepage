package controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import board.PboardCommand;
import board.PboardService;

@Controller
public class PboardController {
	
	private PboardService pboardSvc;

	public void setPboardSvc(PboardService pboardSvc) {
		this.pboardSvc = pboardSvc;
	}
	
	@RequestMapping("/page")
	public String page(@ModelAttribute("pboardcmd") PboardCommand pbc) {
		return "page";
	}
	
	@RequestMapping("/pboard/write")
	public String pboardWrite(@ModelAttribute("pboardcmd") PboardCommand pbc) {
		System.out.println("controller");
		int pbhostid = 1;
		int pbwriterid = 2;
		MultipartFile multi = pbc.getPbfile();
		String pbfile = multi.getOriginalFilename();
		if(!(pbfile.equals(""))) {
			String pbnewfile = System.currentTimeMillis() + "_" + pbfile;
			pboardSvc.pboardWrite(pbhostid, pbwriterid, pbc.getPbsubject(), pbc.getPbcontent(), pbfile, pbnewfile);
			String path = pbc.getPbupdir() + pbnewfile;
			try {
				File file = new File(path);
				multi.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			pboardSvc.pboardWrite(pbhostid, pbwriterid, pbc.getPbsubject(), pbc.getPbcontent(), null, null);
		}
		return "redirect:/page";
	}
}
