package member;

import dao.MemberDao;
import page.Page;

public class MemberService {
	MemberDao memberDao;

	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void memberJoin(MemberCommand memberCmd) {
		Member regmem = memberDao.selectByEmail(memberCmd.getMemail());
		if (regmem != null) {
			throw new AlreadyExistngMemberException("아이디가 존재" + memberCmd.getMemail());
		}
		Member member = new Member(memberCmd.getMname(), memberCmd.getMemail(), memberCmd.getMpw());
		memberDao.memberJoin(member);
	}

	public Member memberLogin(String memail) {
		Member chkmember = new Member(memail);
		Member member = memberDao.memberLogin(chkmember);
		return member;
	}
}
