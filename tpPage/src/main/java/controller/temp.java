package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDao;

@Controller
public class temp {
	MemberDao memberDao;
	
	
	
	@RequestMapping("/main")
	public String onLoad() {
		System.out.println("adsfasdf");
		int a = memberDao.count();
		System.out.println(a);
		return "main";
	}



	public MemberDao getMemberDao() {
		return memberDao;
	}



	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
}
