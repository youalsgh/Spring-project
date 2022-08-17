package dao;

import java.util.List;

import command.OrderCommand;
import command.OrderItemCommand;

public interface OrderDAO {
	
	/* 주문리스트에 추가 */
	public int addOrder(OrderCommand orderCommand, String[] productId, String[] productCount) throws Exception;
	
	/* 주문정보 조회 */
	public List<OrderCommand> getOrderInfo(String memberId) throws Exception; 
	
	/* 주문 상품정보 조회 */
	public List<OrderItemCommand> getOrderItemInfo(String orderId) throws Exception;
	
	/* 주문 취소 */
}
