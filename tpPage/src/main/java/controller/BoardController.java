package controller;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.PboardCommand;
import board.BoardService;

@Controller
public class BoardController {
	
	private BoardService boardSvc;

	public void setBoardSvc(BoardService boardSvc) {
		this.boardSvc = boardSvc;
	}

	/*@RequestMapping("/pbwrite")
	public String pboardWrite(@ModelAttribute("pboardcmd") PboardCommand pbc) {
		int pbhostid = 1;
		int pbwriterid = 1;
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
	*/
	@RequestMapping(value="/mbwrite", method=RequestMethod.POST, produces="text/plain")
	public String MboardWrite(MultipartHttpServletRequest requset) {
		
		/*MultipartFile multi = requset.getFile();
		String pbfile = multi.getOriginalFilename();
		
		System.out.println(pbfile);*/
		
		return "redirect:/page";
	}
}















