package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDao;

@Controller
public class temp {
	MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@RequestMapping("/join")
	public String join() {
		return "join/join";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "join/login";
	}

}
