package controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.BoardService;
import board.PboardCommand;
import dao.MemberDao;
import member.AuthInfo;
import member.AuthService;
import member.Member;
import member.MemberCommand;
import member.MemberService;
import page.Page;
import vali_exception.AlreadyExistngMemberException;
import vali_exception.IdPasswordNotMatchingException;
import vali_exception.JoinValidator;
import vali_exception.LoginValidator;

@Controller
public class MemberController {
	MemberDao memberDao;
	MemberService memberSvc;
	AuthService authService;

	public void setMemberSvc(MemberService memberSvc) {
		this.memberSvc = memberSvc;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@RequestMapping("/join")
	public String memberManager(@ModelAttribute("logincmd") MemberCommand mlcmd,
			@ModelAttribute("joincmd") MemberCommand mjcmd, HttpServletRequest request, Model model,
			@CookieValue(value= "remember", required = false) Cookie cookie) {
		
		if(cookie != null) {
			mlcmd.setMemail(cookie.getValue());
			mlcmd.setRememberMemail(true);
		}
		
		if(request.getParameter("pid") != null) {
			int nowpid = Integer.parseInt(request.getParameter("pid"));
			model.addAttribute("nowpid", nowpid);
			return "member/memberManager"; 
		}
		return "member/memberManager";
	}
	
	@RequestMapping("/memberJoin")
	public String MemberJoin(@ModelAttribute("joincmd") MemberCommand mjcmd, HttpSession session,
			HttpServletResponse response, Errors errors, @ModelAttribute("logincmd") MemberCommand mlcmd,
			@CookieValue(value= "remember", required = false) Cookie cookie) {
		
		if(cookie != null) {
			mlcmd.setRememberMemail(true);
		}
		
		new JoinValidator().validate(mjcmd, errors);
		 if (errors.hasErrors())
		 return "member/memberManager";
		 try {
		memberSvc.memberJoin(mjcmd, errors);
		Member member = memberSvc.memberLogin(mjcmd.getMemail());

		AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(), member.getMphone(),
				member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
		session.setAttribute("authInfo", authInfo);

		
		cookie = new Cookie("remember", mjcmd.getMemail());
		cookie.setPath("/");
		
		if (mjcmd.isRememberMemail()) {
			cookie.setMaxAge(60 * 60 * 24 * 1);
		} else {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
		
		
		return "redirect:/home";
		 } catch (AlreadyExistngMemberException e) {
		 errors.rejectValue("memail", "duplicate");
		 return "member/memberManager";
		 } catch (IdPasswordNotMatchingException e) {
		 errors.rejectValue("memail", "아이디나 비번 틀림");
		 return "redirect:/login";
		 }
	}
	
	@RequestMapping("/login")
	public String MemberLogin(@ModelAttribute("logincmd") MemberCommand mlcmd, Errors errors, @ModelAttribute("mpwfindcmd") MemberCommand mpwfcmd,
			@ModelAttribute("mpwresetcmd") MemberCommand mpwresetcmd, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Cookie cookie = new Cookie("remember", mlcmd.getMemail());
		cookie.setPath("/");
		
		if (mlcmd.isRememberMemail()) {
			cookie.setMaxAge(60 * 60 * 24 * 1);
		} else {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
		new LoginValidator().validate(mlcmd, errors);
		if(errors.hasErrors()) return "member/login"; 
		if (request.getParameter("pid") != null) {
			int nowpid = Integer.parseInt(request.getParameter("pid"));
			model.addAttribute("nowpid", nowpid);
			return "member/login";
		}
		
		Member member = memberSvc.memberLogin(mlcmd.getMemail());

		if (member == null) {
			return "member/login";
		} else {
			if (mlcmd.getMpw().equals(member.getMpw())) {
				Page pid = memberDao.getMemberPid(member.getMid());
				int npid = mlcmd.getNowpid();
				int newPid;
				if (npid == 0) {
					if (pid == null) newPid = 0;
					else newPid = pid.getPid();
					AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
							member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), newPid);
					session.setAttribute("authInfo", authInfo);
					return "redirect:/home";
				} else {
					if (pid == null) newPid = 0;
					else newPid = pid.getPid();
					AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
							member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), newPid);
					session.setAttribute("authInfo", authInfo);
					return "redirect:/page/" + npid;
				}
			} else {
				return "member/login";
			}
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, @ModelAttribute("logincmd") MemberCommand mlcmd) {
		session.invalidate();
		if(mlcmd.getNowpid() != 0) {
			return "redirect:/page/" + mlcmd.getNowpid();
		}
		return "redirect:/home";
	}
	
	@RequestMapping("/meminfo")
	public String meminfo(@ModelAttribute("logincmd") MemberCommand mlcmd, @ModelAttribute("joincmd") MemberCommand mjcmd,
			@ModelAttribute("memberdropcmd") MemberCommand dropcmd, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		if(authInfo == null) {
			return "redirect:/login";
		} else {
			return "member/memInfo";
		}
	}
	
	@RequestMapping("/memmodifier")
	public String memmodifier(@ModelAttribute("modifycmd") MemberCommand modifycmd) {
		return "member/memModify";
	}
	
	@RequestMapping("/memModify")
	public String memberModify(@ModelAttribute("modifycmd") MemberCommand modifycmd, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		// email 중복체크 (ex:admin이 들어가면 안됨)
		memberSvc.memModify(modifycmd, authInfo);
		authInfo = new AuthInfo(authInfo.getMid(), modifycmd.getMname(), modifycmd.getMemail(), modifycmd.getMphone(),
				authInfo.getMcheck(), authInfo.getMpoint(), authInfo.getMdate(), authInfo.getPid());
		request.getSession().setAttribute("authInfo", authInfo);
		return "redirect:meminfo";
	}
	
	@RequestMapping("/mpwchanger")
	public String change(@ModelAttribute("mpwcmd") MemberCommand mpwcmd) {
		return "member/mpwChange";
	}
	
	@RequestMapping("/mpwchange")
	public String mpwchange(@ModelAttribute("mpwcmd") MemberCommand mpwcmd, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		Member member = memberSvc.memberLogin(authInfo.getMemail());
		if (member.getMpw().equals(mpwcmd.getMpw())) {
			if (!member.getMpw().equals(mpwcmd.getNewmpw())) {
				if (mpwcmd.isnewmpwEqualTonewmpwconf()) {
					if (memberDao.changeMpw(authInfo.getMemail(), mpwcmd.getNewmpw())) {
						return "redirect:/meminfo";
					}
				}
			}	
		}
		return "redirect:/mpwchanger";
	}

	@RequestMapping("/memberCheck")
	public String memberCheck(HttpServletRequest request) {
		String email = request.getParameter("email");
		String pw = memberDao.memPass(email);
		request.setAttribute("ck", pw);
		return "page/ck";
	}
	
	@RequestMapping("/mchkUpdate")
	public String mchkUpdate(HttpServletRequest request, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		int mid = Integer.parseInt(request.getParameter("mid"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		memberDao.ckUpdate(email, phone);
		Member member = memberSvc.getAuthInfo(mid);
		authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(), member.getMphone(),
				member.getMcheck(), member.getMpoint(), member.getMdate(), authInfo.getPid());
		session.setAttribute("authInfo", authInfo);
		return "page/ck";
	}
	
	@RequestMapping("/mpwfinder")
	public String mpwfinder(@ModelAttribute("mpwfindcmd") MemberCommand mpwfcmd) {
		return "member/mpwFinderR";
	}
	
	@RequestMapping("/mpwfmodal")
	public String mpwfmodal(@ModelAttribute("mpwfindcmd") MemberCommand mpwfcmd, HttpServletRequest request) {
		Member member = memberDao.selectByEmail(mpwfcmd.getMpwfmemail());
		if(member != null) {
			return "member/mpwFinderR";
		}else {
			return "member/login";
		}
	}
	
	@RequestMapping("/memberdrop")
	public String memberdrop(@ModelAttribute("memberdropcmd") MemberCommand dropcmd, HttpServletRequest request, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		Member member = memberSvc.memberLogin(dropcmd.getMemail());
		if(authInfo == null) {
			return "redirect:/login";
		} else if(member.getMpw().equals(dropcmd.getMpw())){
			memberDao.memDrop(member.getMid(), member.getMemail());
			session.invalidate();
			return "redirect:/home";
		}else {
			return "redirect:/meminfo";
		}
	}

//	@RequestMapping("/dropfinish")
//	public String dropfinish(@ModelAttribute("memberdropcmd") MemberCommand dropcmd, HttpServletResponse response, HttpSession session) {
//		memberDao.memDrop(dropcmd.getMemail(), dropcmd.getMpw());
//		if() {
//			session.invalidate();
//		}else {
//		
//		return "redirect:/home";
//		}
//	}
	
//	@RequestMapping("/checkmodal")
//	public String checkmodal(@ModelAttribute("infocmd") MemberCommand checkcmd, HttpServletRequest request) {
//		Member member = memberDao.selectByEmail(checkcmd.getMphone());
//		if(member != null) {
//			return "member/mpwFinderR";
//		}else {
//			return "member/login";
//		}
//	}

	@RequestMapping("/mpwreset")
	public String mpwreset(@ModelAttribute("mpwresetcmd") MemberCommand mpwresetcmd, HttpServletRequest request) {
		System.out.println(mpwresetcmd.getMpwrmemail());
		System.out.println(mpwresetcmd.getNewmpw());
		System.out.println(mpwresetcmd.getNewmpwconf());
		
		if(mpwresetcmd.getMpwrmemail() != null) {
			if(mpwresetcmd.isnewmpwEqualTonewmpwconf())
				if(memberDao.mpwFind(mpwresetcmd.getNewmpw(), mpwresetcmd.getMpwrmemail()))
			return "redirect:login";
		} else {
			System.out.println("새비번 새비번확인이 맞지않음");
			return "member/mpwFinderR";
		}
		System.out.println("제대로치라");
		return "member/mpwFinderR";
	}
	
//	@RequestMapping("/memberCheck")
//	public String memberCheck(HttpServletRequest request) {
//		String email = request.getParameter("email");
//		String pw = memberDao.memPass(email);
//		request.setAttribute("ck", pw);
//		return "page/ck";
//	}

	/*@RequestMapping("/mpwFind")
	public String mpwFind(@ModelAttribute("mpwfindcmd") MemberCommand mpwfindcmd, HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) request.getSession().getAttribute("authInfo");
		Member find = memberSvc.mpwfind(mpwfindcmd.getMemail());
		if(find.getMemail().equals(mpwfindcmd.getMemail())){
			if(memberDao.changeMpw(authInfo.getMemail(), mpwfindcmd.getNewmpw())) {
				return "redirect:/home";
			} else {
				System.out.println("오류");
				return "member/mpwFinderR";
			}
		}else {
			System.out.println("현재 아이디가 틀림");
			return "redirect:/mpwfinder";
		}
	}*/
	
	
	/*@RequestMapping("/memInfo")
	public String memInfo(@ModelAttribute("infocmd") MemberCommand infocmd, HttpServletRequest request) {
		// AuthInfo authInfo = (AuthInfo)
		request.getSession().getAttribute("authInfo");
		// Member member = memberSvc.memberLogin(authInfo.getMemail());
		// request.setAttribute("mpw", member.getMpw());
		return "member/memInfo";
	}*/
}