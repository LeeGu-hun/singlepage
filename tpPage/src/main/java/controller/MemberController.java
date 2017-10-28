package controller;

import java.util.List;

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
import vali_exception.AlreadyExistngMemberException;
import vali_exception.IdPasswordNotMatchingException;
import vali_exception.JoinValidator;

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
		new JoinValidator().validate(membercmd, errors);
		if(errors.hasErrors())
			return "member/join";
		try {
			memberSvc.memberJoin(membercmd, errors);
			return "redirect:/login";
		}catch (AlreadyExistngMemberException e) {
			errors.rejectValue("memail", "이미 있다");
			return "member/join";
		}catch (IdPasswordNotMatchingException e) {
			errors.rejectValue("memail", "아이디나 비번 틀림");
			return "member/join";
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
	
	@RequestMapping("/memInfo")
	public String memInfo(@ModelAttribute("infocmd") MemberCommand infocmd, HttpServletRequest request) {
//		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
//		Member member = memberSvc.memberLogin(authInfo.getMemail());
//		request.setAttribute("mpw", member.getMpw());
		return "member/memInfo";
	}

	@RequestMapping("/modify")
	public String modify(@ModelAttribute("modifycmd") MemberCommand modifycmd, HttpServletRequest request) {

		return "member/memModify";
	}
	
	@RequestMapping("/memModify")
	public String memberModify(@ModelAttribute("modifycmd") MemberCommand modifycmd, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
//		Member member = memberSvc.memberLogin(authInfo.getMemail());
		
		
		
		
		memberSvc.memModify(modifycmd, authInfo);
		
		
		return "redirect:/modify";
	}

	@RequestMapping("/changeMpw")
	public String change(@ModelAttribute("mpwcmd") MemberCommand mpwcmd, HttpServletRequest request) {
		
		return "member/changeMpw";
	}
	
	
	
	@RequestMapping("/memberChange")
	public String memberChange(@ModelAttribute("mpwcmd") MemberCommand mpwcmd, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		Member member = memberSvc.memberLogin(authInfo.getMemail());
		System.out.println(member.getMpw());
		if(member.getMpw().equals(mpwcmd.getMpw())) {
			if(!member.getMpw().equals(mpwcmd.getNewmpw())) {
				if(mpwcmd.isnewmpwEqualTonewmpwconf()) {
					if(memberDao.changeMpw(authInfo.getMemail(), mpwcmd.getNewmpw())) {
						return "redirect:/memInfo";
					}else {
						
					}
//						throw new Exception();
				}
			}
		}
		return "redirect:/memInfo";
	}
}
