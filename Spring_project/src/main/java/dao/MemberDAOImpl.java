package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import command.MemberCommand;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private RowMapper<MemberCommand> memRowMapper = new RowMapper<MemberCommand>() {
		
		@Override
		public MemberCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberCommand member = new MemberCommand();
			member.setId(rs.getString("m_id"));
			member.setPassword(rs.getString("m_password"));
			member.setName(rs.getString("m_name"));
			member.setEmail(rs.getString("m_email"));
			member.setAdminCk(rs.getInt("adminCk"));
			return member;
		}	
	};
	
	/* 회원가입 */
	@Override
	public void signupMember(MemberCommand memberCommand) throws Exception {
		String sql = "insert into member(m_id, m_password, m_name, m_email) values(?, ?, ?, ?)";
		jdbcTemplate.update(sql, memberCommand.getId(), memberCommand.getPassword(), memberCommand.getName(), memberCommand.getEmail());
	}
	
	/* 회원가입 아이디 중복검사 */
	@Override
	public int idCheck(String id) throws Exception {
		Integer count = jdbcTemplate.queryForObject(
				"select count(*) from member where m_id = ?", Integer.class, id);
		return count;
	}
	
	/* 로그인 */
	@Override
	public MemberCommand loginMember(MemberCommand memberCommand) throws Exception {
		List<MemberCommand> results = jdbcTemplate.query(
				"select * from member where m_id = ? and m_password = ?", memRowMapper, memberCommand.getId(), memberCommand.getPassword());
		return results.isEmpty() ? null : results.get(0);
	}
	
	/* 관리자페이지 회원리스트 출력 (관리자 제외)*/
	@Override
	public List<MemberCommand> memberList() throws Exception {
		List<MemberCommand> results = jdbcTemplate.query(
				"select * from member where m_id not in('admin')", memRowMapper);
		return results.isEmpty() ? null : results;
		
	}
	
	/* 관리자페이지 회원리스트 개수 (관리자 제외)*/
	@Override
	public int listCount() throws Exception {
		Integer listCount = jdbcTemplate.queryForObject(
				"select count(*) from member where m_id not in('admin')", Integer.class);
		return listCount;
	}
	
	// 회원정보 수정 - 김영재
	@Override
	public void member_info(MemberCommand memberCommand) throws Exception {
		String sql = "update member set m_password=?, m_name=?, m_email=? where m_id=?";
		jdbcTemplate.update(sql, memberCommand.getPassword(), memberCommand.getName(), memberCommand.getEmail(),
				memberCommand.getId());
	}
	
	// 비밀번호 찾기 - 김영재
	@Override
	public MemberCommand check_Info(MemberCommand memberCommand) throws Exception {
		List<MemberCommand> results = jdbcTemplate.query(
				"select m_password from MEMBER where m_id=? and m_name=? and m_email=?",
				new RowMapper<MemberCommand>() {
					
					public MemberCommand mapRow(ResultSet rs, int rowNum) throws SQLException{
						MemberCommand member = new MemberCommand();
						member.setId(memberCommand.getId());
						member.setName(memberCommand.getName());
						member.setEmail(memberCommand.getEmail());
						member.setPassword(rs.getString("m_password"));
						return member;
					}
				}, memberCommand.getId(), memberCommand.getName(), memberCommand.getEmail());
		return results.isEmpty() ? null : results.get(0);
	}
	
	// 회원 탈퇴 - 김영재
	@Override
	public void drop_Member(MemberCommand memberCommand) throws Exception {
		String sql = "delete from member where m_id=?";
		jdbcTemplate.update(sql, memberCommand.getId());
	}
}
