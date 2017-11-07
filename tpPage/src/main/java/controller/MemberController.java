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

	/*@RequestMapping("/membermanager")
	public String memberManager(@ModelAttribute("logincmd") MemberCommand mlcmd,
			@ModelAttribute("joincmd") MemberCommand mjcmd, HttpServletRequest request, Model model) {
		if(request.getParameter("pid") != null) {
			int nowpid = Integer.parseInt(request.getParameter("pid"));
			model.addAttribute("nowpid", nowpid);
			return "member/memberManager"; 
		}
		return "member/memberManager";
	}*/
	
	@RequestMapping("/join")
	public String memberManager(@ModelAttribute("logincmd") MemberCommand mlcmd,
			@ModelAttribute("joincmd") MemberCommand mjcmd, HttpServletRequest request, Model model) {
		if(request.getParameter("pid") != null) {
			int nowpid = Integer.parseInt(request.getParameter("pid"));
			model.addAttribute("nowpid", nowpid);
			return "member/memberManager"; 
		}
		return "member/memberManager";
	}
	
	@RequestMapping("/memberJoin")
	public String MemberJoin(@ModelAttribute("joincmd") MemberCommand mjcmd, HttpSession session,
			HttpServletResponse response, Errors errors) {
		/* new JoinValidator().validate(membercmd, errors); */
		// if (errors.hasErrors())
		// return "member/join";
		// try {
		memberSvc.memberJoin(mjcmd, errors);
		Member member = memberSvc.memberLogin(mjcmd.getMemail());

		AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(), member.getMphone(),
				member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
		session.setAttribute("authInfo", authInfo);

		/*Cookie cookie = new Cookie("remember", mjcmd.getMemail());
		cookie.setPath("/");*/
		/*
		 * Cookie cookie2 = new Cookie("remember2", mjcmd.getMemail());
		 * cookie2.setPath("./");
		 */

		/*if (mjcmd.isRememberMemail()) {
			cookie.setMaxAge(60 * 60 * 24 * 1);
		} else {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);*/
		return "redirect:/home";
		// } catch (AlreadyExistngMemberException e) {
		// errors.rejectValue("memail", "이미 있다");
		// return "member/join";
		// } catch (IdPasswordNotMatchingException e) {
		// errors.rejectValue("memail", "아이디나 비번 틀림");
		// return "redirect:/login";
		// }
	}
	
	@RequestMapping("/login")
	public String MemberLogin(@ModelAttribute("logincmd") MemberCommand mlcmd, @ModelAttribute("mpwfindcmd") MemberCommand mpwfcmd,
			@ModelAttribute("mpwresetcmd") MemberCommand mpwresetcmd, HttpSession session, HttpServletRequest request) {
		
		Member member = memberSvc.memberLogin(mlcmd.getMemail());

		if (member == null) {
			return "member/login";
		} else {
			if (mlcmd.getMpw().equals(member.getMpw())) {
				Page pid = memberDao.getMemberPid(member.getMid());
				int npid = mlcmd.getNowpid();
				if (npid == 0) {
					if (pid == null) {
						AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
								member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
						session.setAttribute("authInfo", authInfo);
						return "redirect:/home";
					} else {
						AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
								member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(),
								pid.getPid());
						session.setAttribute("authInfo", authInfo);
						return "redirect:/home";
					}
				} else {
					if (pid == null) {
						AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
								member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
						session.setAttribute("authInfo", authInfo);
						return "redirect:/page?host=" + npid;
					} else {
						AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
								member.getMphone(), member.getMcheck(), member.getMpoint(), member.getMdate(),
								pid.getPid());
						session.setAttribute("authInfo", authInfo);
						return "redirect:/page?host=" + npid;
					}
				}
			} else {
				return "member/login";
			}
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	@RequestMapping("/meminfo")
	public String meminfo(@ModelAttribute("logincmd") MemberCommand mlcmd, @ModelAttribute("joincmd") MemberCommand mjcmd) {
		return "member/memberManager";
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
//			if (mpwcmd.ismpwEqualTonewmpw()) {
				if (!member.getMpw().equals(mpwcmd.getNewmpw())) {
					if (mpwcmd.isnewmpwEqualTonewmpwconf()) {
						if (memberDao.changeMpw(authInfo.getMemail(), mpwcmd.getNewmpw())) {
							return "redirect:/meminfo";
						} else {
							System.out.println("오류");
							return "member/mpwChange";
						}
					} else {
						System.out.println("새비번 새비번확인이 맞지않음");
						return "member/mpwChange";
					}
				} else {
					System.out.println("현재비번과 새로운비번이 같음");
					return "member/mpwChange";
				}
//			} else {
//				System.out.println("새비번 입력");
//				return "redirect:/changeMpw";
//			}
		} else {
			System.out.println("현재 비번이 틀렷네");
			return "member/mpwChange";
		}
	}

	@RequestMapping("/membermanager")
	public String memberManager(@ModelAttribute("logincmd") MemberCommand mlcmd,
			@ModelAttribute("joincmd") MemberCommand mjcmd,
			@CookieValue(value = "remember", required = false) Cookie cookie, HttpServletRequest request, Model model) {
		if (request.getParameter("pid") != null) {
			int nowpid = Integer.parseInt(request.getParameter("pid"));
			model.addAttribute("nowpid", nowpid);
			return "member/memberManager";
		}
		return "member/memberManager";
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
		int mid = Integer.parseInt(request.getParameter("mid"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		memberDao.ckUpdate(email, phone);
		Member member = memberSvc.getAuthInfo(mid);
		AuthInfo authInfo = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(), member.getMphone(),
				member.getMcheck(), member.getMpoint(), member.getMdate());
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
	
	
	
	/*
	 * @RequestMapping("/join") public String join(@ModelAttribute("joincmd")
	 * MemberCommand membercmd) { return "member/join"; }
	 * 
	 * @RequestMapping("/memberJoin") public String
	 * MemberJoin(@ModelAttribute("joincmd") MemberCommand membercmd, Errors errors)
	 * { new JoinValidator().validate(membercmd, errors); if (errors.hasErrors())
	 * return "member/join"; try { memberSvc.memberJoin(membercmd, errors); return
	 * "redirect:/login"; } catch (AlreadyExistngMemberException e) {
	 * errors.rejectValue("memail", "이미 있다"); return "member/join"; } catch
	 * (IdPasswordNotMatchingException e) { errors.rejectValue("memail",
	 * "아이디나 비번 틀림"); return "member/join"; } }
	 * 
	 * @RequestMapping("/login") public String login(@ModelAttribute("logincmd")
	 * MemberCommand membercmd, Model model, HttpServletRequest request) { if
	 * (request.getParameter("pid") != null) { int nowpid =
	 * Integer.parseInt(request.getParameter("pid")); model.addAttribute("nowpid",
	 * nowpid); return "member/login"; // return "redirect:/page?host="+nowpid; }
	 * return "member/login"; }
	 * 
	 * @RequestMapping("/memberLogin") public String
	 * MemberLogin(@ModelAttribute("logincmd") MemberCommand membercmd, HttpSession
	 * session, HttpServletRequest request) { Member member =
	 * memberSvc.memberLogin(membercmd.getMemail()); if (member == null) { return
	 * "redirect:/login"; } else { if (membercmd.getMpw().equals(member.getMpw())) {
	 * Page pid = memberDao.getMemberPid(member.getMid()); int npid =
	 * membercmd.getNowpid(); if (npid == 0) { if (pid == null) { AuthInfo authInfo
	 * = new AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
	 * member.getMphone(), member.getMcheck(), member.getMpoint(),
	 * member.getMdate(), 0); session.setAttribute("authInfo", authInfo); return
	 * "redirect:/home"; } else { AuthInfo authInfo = new AuthInfo(member.getMid(),
	 * member.getMname(), member.getMemail(), member.getMphone(),
	 * member.getMcheck(), member.getMpoint(), member.getMdate(), pid.getPid());
	 * session.setAttribute("authInfo", authInfo); return "redirect:/home"; } } else
	 * { if (pid == null) { AuthInfo authInfo = new AuthInfo(member.getMid(),
	 * member.getMname(), member.getMemail(), member.getMphone(),
	 * member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
	 * session.setAttribute("authInfo", authInfo); return "redirect:/page?host=" +
	 * npid; } else { AuthInfo authInfo = new AuthInfo(member.getMid(),
	 * member.getMname(), member.getMemail(), member.getMphone(),
	 * member.getMcheck(), member.getMpoint(), member.getMdate(), pid.getPid());
	 * session.setAttribute("authInfo", authInfo); return "redirect:/page?host=" +
	 * npid; } } } else { return "redirect:/login"; } } }
	 * 
	 * @RequestMapping("/logout") public String logout(HttpSession session) {
	 * session.invalidate(); return "redirect:/home"; }
	 * 
	 * @RequestMapping("/memInfo") public String memInfo(@ModelAttribute("infocmd")
	 * MemberCommand infocmd, HttpServletRequest request) { // AuthInfo authInfo =
	 * (AuthInfo) request.getSession().getAttribute("authInfo"); // Member member =
	 * memberSvc.memberLogin(authInfo.getMemail()); // request.setAttribute("mpw",
	 * member.getMpw()); return "member/memInfo"; }
	 * 
	 * @RequestMapping("/memManager") public String
	 * modify(@ModelAttribute("modifycmd") MemberCommand modifycmd,
	 * HttpServletRequest request) { return "member/memModify"; }
	 * 
	 * @RequestMapping("/memModify") public String
	 * memberModify(@ModelAttribute("modifycmd") MemberCommand modifycmd,
	 * HttpServletRequest request) { AuthInfo authInfo = (AuthInfo)
	 * request.getSession().getAttribute("authInfo"); // email 중복체크 (ex:admin이 들어가면
	 * 안됨) memberSvc.memModify(modifycmd, authInfo); authInfo = new
	 * AuthInfo(authInfo.getMid(), modifycmd.getMname(), modifycmd.getMemail(),
	 * modifycmd.getMphone(), authInfo.getMcheck(), authInfo.getMpoint(),
	 * authInfo.getMdate(), authInfo.getPid());
	 * request.getSession().setAttribute("authInfo", authInfo); return
	 * "redirect:/memManager"; }
	 * 
	 * @RequestMapping("/changeMpw") public String change(@ModelAttribute("mpwcmd")
	 * MemberCommand mpwcmd, HttpServletRequest request) { return
	 * "member/changeMpw"; }
	 * 
	 * @RequestMapping("/memberChange") public String
	 * memberChange(@ModelAttribute("mpwcmd") MemberCommand mpwcmd,
	 * HttpServletRequest request) { AuthInfo authInfo = (AuthInfo)
	 * request.getSession().getAttribute("authInfo"); Member member =
	 * memberSvc.memberLogin(authInfo.getMemail());
	 * System.out.println(member.getMpw()); if
	 * (member.getMpw().equals(mpwcmd.getMpw())) { if
	 * (!member.getMpw().equals(mpwcmd.getNewmpw())) { if
	 * (mpwcmd.isnewmpwEqualTonewmpwconf()) { if
	 * (memberDao.changeMpw(authInfo.getMemail(), mpwcmd.getNewmpw())) { return
	 * "redirect:/home"; } else { System.out.println("오류"); return "member/memInfo";
	 * } } else { System.out.println("새비번 새비번확인이 맞지않음"); return "member/memInfo"; }
	 * } else { System.out.println("현재비번과 새로운비번이 같음"); return "member/changeMpw"; }
	 * } else { System.out.println("현재 비번이 틀렷네"); return "redirect:/memInfo"; } }
	 */

	/*
	 * @RequestMapping("/joinpluslogin") public String
	 * joinpluslogin(@ModelAttribute("joinpluscmd") MemberCommand joinpluscmd,
	 * 
	 * @ModelAttribute("loginpluscmd") MemberCommand loginpluscmd, Model model,
	 * HttpServletRequest request) { if (request.getParameter("pid") != null) { int
	 * nowpid = Integer.parseInt(request.getParameter("pid"));
	 * model.addAttribute("nowpid", nowpid); return "member/login"; // return
	 * "redirect:/page?host="+nowpid; } return "member/login"; }
	 * 
	 * @RequestMapping("/memberjoinpluslogin") public String
	 * memberjoinpluslogin(@ModelAttribute("joinpluscmd") MemberCommand joinpluscmd,
	 * 
	 * @ModelAttribute("loginpluscmd") MemberCommand loginpluscmd, Errors errors,
	 * HttpSession session, HttpServletRequest request) { Member member =
	 * memberSvc.memberLogin(loginpluscmd.getMemail()); if (member == null) { return
	 * "redirect:/joinpluslogin"; } else { if
	 * (loginpluscmd.getMpw().equals(member.getMpw())) { Page pid =
	 * memberDao.getMemberPid(member.getMid()); int npid = loginpluscmd.getNowpid();
	 * if (npid == 0) { if (pid == null) { AuthInfo authInfo = new
	 * AuthInfo(member.getMid(), member.getMname(), member.getMemail(),
	 * member.getMphone(), member.getMcheck(), member.getMpoint(),
	 * member.getMdate(), 0); session.setAttribute("authInfo", authInfo); return
	 * "redirect:/home"; } else { AuthInfo authInfo = new AuthInfo(member.getMid(),
	 * member.getMname(), member.getMemail(), member.getMphone(),
	 * member.getMcheck(), member.getMpoint(), member.getMdate(), pid.getPid());
	 * session.setAttribute("authInfo", authInfo); return "redirect:/home"; } } else
	 * { if (pid == null) { AuthInfo authInfo = new AuthInfo(member.getMid(),
	 * member.getMname(), member.getMemail(), member.getMphone(),
	 * member.getMcheck(), member.getMpoint(), member.getMdate(), 0);
	 * session.setAttribute("authInfo", authInfo); return "redirect:/page?host=" +
	 * npid; } else { AuthInfo authInfo = new AuthInfo(member.getMid(),
	 * member.getMname(), member.getMemail(), member.getMphone(),
	 * member.getMcheck(), member.getMpoint(), member.getMdate(), pid.getPid());
	 * session.setAttribute("authInfo", authInfo); return "redirect:/page?host=" +
	 * npid; } } } else { return "redirect:/joinpluslogin"; } }
	 * 
	 * new JoinValidator().validate(joinpluscmd, errors); if (errors.hasErrors())
	 * return "member/joinpluslogin"; try { memberSvc.memberJoin(joinpluscmd,
	 * errors); return "redirect:/home"; } catch (AlreadyExistngMemberException e) {
	 * errors.rejectValue("memail", "이미 있다"); return "member/joinpluslogin"; } catch
	 * (IdPasswordNotMatchingException e) { errors.rejectValue("memail",
	 * "아이디나 비번 틀림"); return "member/joinpluslogin"; }
	 * 
	 * }
	 */
}
