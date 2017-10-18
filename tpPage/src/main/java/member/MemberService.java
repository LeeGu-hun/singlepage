package member;

import dao.MemberDao;

public class MemberService {

	MemberDao memberDao;

	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void memberJoin(String mname, String memail, String mpw) {
		
		Member member = new Member(mname, memail, mpw);
		memberDao.memberJoin(member);
	}
}
