package service;

import java.util.List;

import command.MemberCommand;

public interface MemberService {
	
	/* 회원가입 */
	public void signupMember(MemberCommand memberCommand) throws Exception;
	
	/* 로그인 */
	public MemberCommand loginMember(MemberCommand memberCommand) throws Exception;
	
	/* 관리자페이지 회원리스트 */
	public List<MemberCommand> memberList() throws Exception;
	
	/* 관리자페이지 회원리스트 개수 */
	public int listCount() throws Exception;
	
	// 마이페이지 - 김영재
	public void member_info(MemberCommand memberCommand) throws Exception;
	
	// 비밀번호 찾기 - 김영재
	public MemberCommand check_Info(MemberCommand memberCommand) throws Exception;
	
	// 회원탈퇴 - 김영재
	public void drop_Member(MemberCommand memberCommand) throws Exception;
}
