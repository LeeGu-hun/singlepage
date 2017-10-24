package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.BoardService;
import board.PboardCommand;
import dao.MemberDao;
import member.AuthInfo;
import member.Member;
import member.MemberCommand;
import member.MemberService;
import page.Page;

@Controller
public class MemberController {
	MemberDao memberDao;
	MemberService memberSvc;
	
	public void setMemberSvc(MemberService memberSvc) {
		this.memberSvc = memberSvc;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}


	@RequestMapping("/join")
	public String join(@ModelAttribute("joincmd") MemberCommand membercmd) {
		return "member/join";
	}

	@RequestMapping("/memberJoin")
	public String MemberJoin(@ModelAttribute("joincmd") MemberCommand membercmd, Errors errors) {
		if (!membercmd.isPasswordEqualToConfirmPassword()) {
			System.out.println("에러");
			return "redirect:/join";
		} else {
			memberSvc.memberJoin(membercmd);
			return "redirect:/login";
		}
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute("logincmd") MemberCommand membercmd) {
		return "member/login";
	}

	@RequestMapping("/memberLogin")
	public String MemberLogin(@ModelAttribute("logincmd") MemberCommand membercmd, HttpSession session) {
		Member member = memberSvc.memberLogin(membercmd.getMemail());  
		if (member == null) {
			return "redirect:/login";
		} else {
			if (membercmd.getMpw().equals(member.getMpw())) {
				Page pid = memberDao.getMemberPid(member.getMid());
				if(pid == null) {
					AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
							member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
					session.setAttribute("authInfo", authInfo);
					return "redirect:/home";
				} else {
					AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
							member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), pid.getPid());
					session.setAttribute("authInfo", authInfo);
					return "redirect:/home";
				}
			} else {
				return "redirect:/login";
			}
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
}
