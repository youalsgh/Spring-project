package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import command.OrderCommand;
import command.OrderItemCommand;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private RowMapper<OrderCommand> orderRowMapper = new RowMapper<OrderCommand>() {

		@Override
		public OrderCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrderCommand order = new OrderCommand();
			order.setOrderId(rs.getString("o_id"));
			order.setAddressee(rs.getString("o_addressee"));
			order.setMemberAddr1(rs.getString("o_memberAddr1"));
			order.setMemberAddr2(rs.getString("o_memberAddr2"));
			order.setMemberAddr3(rs.getString("o_memberAddr3"));
			order.setOrderState(rs.getString("o_orderState"));
			order.setOrderDate(rs.getString("o_orderDate"));
			return order;
		}
	
	};
	
	private RowMapper<OrderItemCommand> orderItemRowMapper = new RowMapper<OrderItemCommand>() {

		@Override
		public OrderItemCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrderItemCommand orderItem = new OrderItemCommand();
			orderItem.setProductCount(rs.getInt("productCount"));
			orderItem.setProductBrand(rs.getString("p_brand"));
			orderItem.setProductName(rs.getString("p_name"));
			orderItem.setProductPrice(rs.getInt("p_price"));
			orderItem.setFileName(rs.getString("p_fileName"));
			return orderItem;
		}
	
	};
	
	/* 주문리스트에 추가 */
	@Transactional
	@Override
	public int addOrder(OrderCommand orderCommand, String[] productId, String[] productCount) throws Exception {
		String sql1 = "insert into orders(o_id, o_addressee, o_memberId, o_memberAddr1, o_memberAddr2, o_memberAddr3, o_orderState) values(?, ?, ?, ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sql1, orderCommand.getOrderId(), orderCommand.getAddressee(), orderCommand.getMemberId(), orderCommand.getMemberAddr1(), orderCommand.getMemberAddr2(), orderCommand.getMemberAddr3(), orderCommand.getOrderState());
		
		
		String sql2 = "insert into orderItem(orderId, productId, productCount) values(?, ?, ?)";
		for(int i = 0 ; i < productId.length ; i++) {
			if (result == 0) {
				break;
			}
			result = jdbcTemplate.update(sql2, orderCommand.getOrderId(),productId[i], productCount[i]);
		}
	
		return result;
	}

	/* 주문정보 조회 */
	@Override
	public List<OrderCommand> getOrderInfo(String memberId) throws Exception {
		String sql = "select * from orders where o_memberId = ?";
		List<OrderCommand> results = jdbcTemplate.query(sql, orderRowMapper, memberId);
		return results.isEmpty() ? null : results;
	}

	/* 주문 상품정보 조회 */
	@Override
	public List<OrderItemCommand> getOrderItemInfo(String orderId) throws Exception {
		String sql = "select a.productCount, b.p_brand, b.p_name, b.p_price, b.p_fileName from orderItem a left outer join product b on a.productId = b.p_id where orderId = ?";
		List<OrderItemCommand> results = jdbcTemplate.query(sql, orderItemRowMapper, orderId);
		return results.isEmpty() ? null : results;
	}
	
	
}
