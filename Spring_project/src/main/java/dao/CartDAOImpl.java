package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import command.CartCommand;

@Repository
public class CartDAOImpl implements CartDAO{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private RowMapper<CartCommand> cartRowMapper = new RowMapper<CartCommand>() {
	
		@Override
		public CartCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			CartCommand cart = new CartCommand();
			cart.setCartId(rs.getInt("c_id"));
			cart.setMemberId(rs.getString("c_memberId"));
			cart.setProductId(rs.getInt("c_productId"));
			cart.setProductCount(rs.getInt("c_productCount"));
			return cart;
		}
	};
	
	private RowMapper<CartCommand> cartListRowMapper = new RowMapper<CartCommand>() {
		
		@Override
		public CartCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			CartCommand cart = new CartCommand();
			
			cart.setCartId(rs.getInt("c_id"));
			cart.setMemberId(rs.getString("c_memberId"));
			cart.setProductId(rs.getInt("c_productId"));
			cart.setProductCount(rs.getInt("c_productCount"));
			cart.setProductName(rs.getString("p_name"));
			cart.setProductPrice(rs.getInt("p_price"));
			cart.setFileName(rs.getString("p_fileName"));
			return cart;
		}
	};
	
	/* 카트 추가 */
	@Override
	public void addCart(CartCommand cartCommand) throws Exception {
		String sql = "insert into cart(c_memberId, c_productId, c_productCount) values(?, ?, ?)";
		jdbcTemplate.update(sql, cartCommand.getMemberId(), cartCommand.getProductId(), cartCommand.getProductCount());
	}

	/* 카트 삭제 (1 row 삭제)*/
	@Override
	public void deleteCart(int cartId) throws Exception {
		String sql = "delete from cart where c_id = ?";
		jdbcTemplate.update(sql, cartId);
	}
	
	/* 카트 삭제(전체 row 삭제) */
	@Override
	public void deleteCartAll(String memberId) throws Exception {
		String sql = "delete from cart where c_memberId = ?";
		jdbcTemplate.update(sql, memberId);		
	}

	/* 카트 수량 수정 */
	@Override
	public void modifyCount(int cartId, int productCount) throws Exception {
		String sql = "update cart set c_productCount = ? where c_id = ?";
		jdbcTemplate.update(sql,productCount, cartId);
	}

	/* 카트 목록 */
	@Override
	public List<CartCommand> getCartList(String memberId) throws Exception {
		String sql = "select a.c_id, a.c_memberId, a.c_productId, a.c_productCount, b.p_name, "
				+ "b.p_price, b.p_fileName from cart a left outer join product b on a.c_productId = b.p_id where c_memberId = ?";
		List<CartCommand> results = jdbcTemplate.query(sql, cartListRowMapper, memberId);
		return results.isEmpty() ? null : results;
	}

	/* 카트 확인 */
	@Override
	public CartCommand checkCart(String memberId, int productId) throws Exception {
		String sql = "select * from cart where c_memberId = ? and c_productId = ?";
		List<CartCommand> results = jdbcTemplate.query(sql, cartRowMapper, memberId, productId);
		return results.isEmpty() ? null : results.get(0);
	}
	
	/* 카트에 담긴 상품리스트 개수 */
	@Override
	public int getCartListCount(String memberId) throws Exception {
		String sql = "select count(*) from cart where c_memberId = ?";
		Integer cartListCount = jdbcTemplate.queryForObject(sql, Integer.class, memberId);
		return cartListCount;
	}
}
