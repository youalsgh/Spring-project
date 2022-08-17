package command;

import lombok.Data;

@Data
public class MemberCommand {
	
	/* 회원 아이디 */
	private String id;
	
	/* 회원 비밀번호 */
	private String password;
	
	/* 회원 이름 */
	private String name;
	
	/* 회원 이메일 */
	private String email;
	
	/* 관리자 or 일반회원 */
	private int adminCk;
	
	/* 아이디 기억하기 */
	private boolean rememberId;
	
	/* 회원주소 (결제시 입력) */
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
}
