package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String login(@ModelAttribute("logincmd") MemberCommand membercmd, Model model, HttpServletRequest request) {
		if (request.getParameter("pid") != null) {
			int nowpid = Integer.parseInt(request.getParameter("pid"));
			model.addAttribute("nowpid", nowpid);
			return "member/login";
//				return "redirect:/page?host="+nowpid;
		}
		return "member/login";
	}

	@RequestMapping("/memberLogin")
	public String MemberLogin(@ModelAttribute("logincmd") MemberCommand membercmd, HttpSession session, HttpServletRequest request) {
		Member member = memberSvc.memberLogin(membercmd.getMemail());  
		if (member == null) {
			return "redirect:/login";
		} else {
			if (membercmd.getMpw().equals(member.getMpw())) {
				Page pid = memberDao.getMemberPid(member.getMid());
				int npid = membercmd.getNowpid();
				if(npid == 0) {
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
					if(pid == null) {
						AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
								member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
						session.setAttribute("authInfo", authInfo);
						return "redirect:/page?host=" + npid;
					} else {
						AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
								member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), pid.getPid());
						session.setAttribute("authInfo", authInfo);
						return "redirect:/page?host=" + npid;
					}
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
