package member;

import dao.MemberDao;
import page.Page;
import vali_exception.IdPasswordNotMatchingException;

public class AuthService {
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	public AuthInfo authenticate(String memail, String mpw) {
		Member member = memberDao.selectByEmail(memail);
		Page pid = memberDao.getMemberPid(member.getMid());
//		if (member == null) 
//			throw new IdPasswordNotMatchingException();
		
		if (!member.matchPassword(mpw)) 
			throw new IdPasswordNotMatchingException();
		
		return new AuthInfo(member.getMid(), member.getMname(), member.getMemail(), member.getMphone(), member.getMcheck(),
				member.getMpoint(), member.getMdate(), pid.getPid());
	}
	// Email기억 쿠키
}