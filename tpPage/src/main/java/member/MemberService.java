package member;

import org.springframework.validation.Errors;

import dao.MemberDao;
import vali_exception.AlreadyExistngMemberException;
import vali_exception.IdPasswordNotMatchingException;

public class MemberService {
	MemberDao memberDao;

	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void memberJoin(MemberCommand memberCmd, Errors errors) {
		Member regmem = memberDao.selectByEmail(memberCmd.getMemail());
		if (regmem != null) {
			throw new AlreadyExistngMemberException("이메일이 이미 존재합니다." + memberCmd.getMemail());
		}
		Member member = new Member(memberCmd.getMname(), memberCmd.getMemail(), memberCmd.getMpw());
		memberDao.memberJoin(member);
	}

	public Member memberLogin(String memail) {
		Member chkmember = new Member(memail);
		Member member = memberDao.memberLogin(chkmember);
		return member;
	}

	public void memModify(MemberCommand modifycmd, AuthInfo authInfo) {
		
		memberDao.memModify(authInfo.getMid(), modifycmd.getMemail(), modifycmd.getMname(), modifycmd.getMphone());
		
	}

//	public void changeMpw(MemberCommand memberCmd, Errors errors) {
//		Member chmem = memberDao.changeMpw(oldmpw, newmpw);
//		Member memeber = new Member();
//		if(!Member.mpw.equals(oldmpw))
//			throw new IdPasswordNotMatchingException();
//		this.mpw = newmpw;	
//	}
}
