package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDao;
import member.MemberCommand;
import member.MemberService;

@Controller
public class MemberController {
	
	MemberService MemberSvc;
	
	public void setMemberSvc(MemberService memberSvc) {
		MemberSvc = memberSvc;
	}

	@RequestMapping("/join")
	public String join(@ModelAttribute("joincmd") MemberCommand membercmd) {
		return "member/join";
	}
	
	@RequestMapping("/memberJoin")
	public String MemberJoin(@ModelAttribute("joincmd") MemberCommand membercmd) {
		
		MemberSvc.memberJoin(membercmd.getMname(), membercmd.getMemail(), membercmd.getMpw());
		
		return "redirect:/join";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "join/login";
	}
}
