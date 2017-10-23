package member;

import dao.MemberDao;

public class AuthService {
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
//	public AuthInfo authenticate(String memail, String mpw) {
//		Member member = memberDao.memberJoin(member);(memail);
//		if (member == null) 
//			throw new MemberNotFoundException();
//		
//		if (!member.matchPassword(mpw)) 
//			throw new IdPasswordNotMatchingException();
//		
//		return new AuthInfo(member.getMname(), member.getMemail(), member.getMid());
//	}
	
}