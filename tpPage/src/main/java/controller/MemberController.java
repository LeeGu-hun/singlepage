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

@Controller
public class MemberController {
	MemberService memberSvc;
	public void setMemberSvc(MemberService memberSvc) {
		this.memberSvc = memberSvc;
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
				AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
						member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate());
				session.setAttribute("authInfo", authInfo);
				return "redirect:/home";
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
	
	@RequestMapping("/pagechk")
	public Member pageChk(PboardCommand pboardCommand) {
		Member member = BoardService.pboardWrite()
		return member;
	}
}
