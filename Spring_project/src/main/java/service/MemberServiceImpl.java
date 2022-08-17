package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.MemberCommand;
import dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDAO;

	/* 회원가입 */
	@Override
	public void signupMember(MemberCommand memberCommand) throws Exception {
		memberDAO.signupMember(memberCommand);
	}

	/* 로그인 */
	@Override
	public MemberCommand loginMember(MemberCommand memberCommand) throws Exception {
		return memberDAO.loginMember(memberCommand);
	}

	/* 관리자페이지 회원리스트 */
	@Override
	public List<MemberCommand> memberList() throws Exception {
		List<MemberCommand> memberList = memberDAO.memberList();
		return memberList;
	}

	/* 관리자페이지 회원리스트 개수 */
	@Override
	public int listCount() throws Exception {
		int listCount = memberDAO.listCount();
		return listCount;
	}
	
	// 마이페이지 - 김영재
	@Override
	public void member_info(MemberCommand memberCommand) throws Exception {
		memberDAO.member_info(memberCommand);
	}

	// 비밀번호 찾기 - 김영재
	@Override
	public MemberCommand check_Info(MemberCommand memberCommand) throws Exception {
		return memberDAO.check_Info(memberCommand);
	}

	// 회원 탈퇴 - 김영재
	@Override
	public void drop_Member(MemberCommand memberCommand) throws Exception {
		memberDAO.drop_Member(memberCommand);
	}
		
}
