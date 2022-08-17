package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import command.ReplyCommand;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private RowMapper<ReplyCommand> replyListRowMapper = new RowMapper<ReplyCommand>() {

		@Override
		public ReplyCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			ReplyCommand reply = new ReplyCommand();
			reply.setReplyId(rs.getInt("r_id"));
			reply.setProductId(rs.getInt("r_productId"));
			reply.setMemberId(rs.getString("r_memberId"));
			reply.setContent(rs.getString("r_content"));
			reply.setRating(rs.getDouble("r_rating"));
			reply.setRegDate(rs.getDate("r_regDate"));
			reply.setMemberName(rs.getString("m_name"));
			return reply;
		}
	};
	
	private RowMapper<ReplyCommand> replyRowMapper = new RowMapper<ReplyCommand>() {

		@Override
		public ReplyCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			ReplyCommand reply = new ReplyCommand();
			reply.setReplyId(rs.getInt("r_id"));
			reply.setProductId(rs.getInt("r_productId"));
			reply.setMemberId(rs.getString("r_memberId"));
			reply.setContent(rs.getString("r_content"));
			reply.setRating(rs.getDouble("r_rating"));
			reply.setRegDate(rs.getDate("r_regDate"));
			return reply;
		}
	};
	
	/* 댓글 등록 */
	@Override
	public void addReply(ReplyCommand replyCommand) throws Exception{
		String sql = "insert into reply(r_productId, r_memberId, r_content, r_rating) values (?, ?, ?, ?)";
		jdbcTemplate.update(sql, replyCommand.getProductId(), replyCommand.getMemberId(), replyCommand.getContent(), replyCommand.getRating());
	}
	
	/* 댓글 작성 유무 */
	@Override
	public ReplyCommand checkReply(String memberId, int productId) throws Exception {
		String sql = "select * from reply where r_memberId = ? and r_productId = ?";
		List<ReplyCommand> results = jdbcTemplate.query(sql, replyRowMapper, memberId, productId);
		return results.isEmpty() ? null : results.get(0);
	}
	
	/* 전체 댓글 리스트 가져오기 */
	@Override
	public List<ReplyCommand> getReplyListAll(int productId) throws Exception {
		String sql = "select a.r_id, a.r_memberId, a.r_productId, a.r_memberId, a.r_content, a.r_rating, a.r_regDate, "
				+ "b.m_name from reply a left outer join member b on a.r_memberId = b.m_id where r_productId = ?";
		List<ReplyCommand> results = jdbcTemplate.query(sql, replyListRowMapper, productId);
		return results.isEmpty() ? null : results;
	}
	
	/* 댓글 삭제 */
	@Override
	public void deleteReply(String memberId, int productId) throws Exception {
		String sql = "delete from reply where r_memberId = ? and r_productId = ?";
		jdbcTemplate.update(sql, memberId, productId);
	}

	/* 댓글 평점 평균 계산 */
	@Override
	public Double ratingAvg(int productId) throws Exception {
		String sql = "select avg(r_rating) from reply where r_productId = ?";
		Double ratingAvg = jdbcTemplate.queryForObject(sql, Double.class, productId);
		return ratingAvg;
	}
}
