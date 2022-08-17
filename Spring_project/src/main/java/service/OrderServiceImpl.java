package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.OrderCommand;
import command.OrderItemCommand;
import dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderDAO;
	
	/* 주문리스트에 추가 */
	public int addOrder(OrderCommand orderCommand, String[] productId, String[] productCount) throws Exception {
		SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss");
		orderCommand.setOrderId(fo.format(new Date()) + (String.format("%04d",  new Random().nextInt(9999))));
		orderCommand.setOrderState("배송준비");
		int result = orderDAO.addOrder(orderCommand, productId, productCount);
		return result;
	}

	/* 주문정보 조회 */
	@Override
	public List<OrderCommand> getOrderInfo(String memberId) throws Exception {
		List<OrderCommand> orderCommand = orderDAO.getOrderInfo(memberId);
		return orderCommand;
	}

	/* 주문 상품정보 조회 */
	@Override
	public List<OrderItemCommand> getOrderItemInfo(String orderId) throws Exception {
		List<OrderItemCommand> orderItemCommand = orderDAO.getOrderItemInfo(orderId);
		return orderItemCommand;
	}
	
}
