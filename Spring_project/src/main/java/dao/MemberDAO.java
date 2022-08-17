package dao;

import java.util.List;

import command.MemberCommand;

/* 단순 등록, 조회기능은 서비스 클래스가 없다.*/
public interface MemberDAO {
	
	/* 회원가입 */
	public void signupMember(MemberCommand memberCommand) throws Exception;
	
	/* 아이디 중복검사 (서비스 x) */
	public int idCheck(String id) throws Exception;
	
	/* 로그인 */
	public MemberCommand loginMember(MemberCommand memberCommand) throws Exception;
	
	/* 관리자페이지 회원리스트 출력 */
	public List<MemberCommand> memberList() throws Exception;
	
	/* 관리자페이지 회원리스트 개수 */
	public int listCount() throws Exception;
	
	// 마이페이지 - 김영재
	public void member_info(MemberCommand memberCommand) throws Exception;
	
	// 비밀번호 찾기 - 김영재
	public MemberCommand check_Info(MemberCommand memberCommand) throws Exception;
	
	// 회원 탈퇴 - 김영재
	public void drop_Member(MemberCommand memberCommand) throws Exception;
}
