package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import command.CartCommand;
import dao.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO cartDAO;

	/* 카트 추가 추가 성공 시 1, 실패시 0 반환*/
	@Override
	public int addCart(CartCommand cartCommand) throws Exception {
		CartCommand checkCart = cartDAO.checkCart(cartCommand.getMemberId(), cartCommand.getProductId());
		if(checkCart == null) {
			cartDAO.addCart(cartCommand);
			return 1;
		} else {
			return 0;
		}
		
	}

	/* 카트 삭제 */
	@Override
	public void deleteCart(int cartId) throws Exception {
		cartDAO.deleteCart(cartId);
		
	}
	
	/* 카트 삭제(전체 row 삭제) */
	@Override
	public void deleteCartAll(String memberId) throws Exception {
		cartDAO.deleteCartAll(memberId);
	}
	
	/* 카트 수량 수정 */
	@Override
	public void modifyCount(int cartId, int productCount) throws Exception {
		cartDAO.modifyCount(cartId, productCount);
		
	}

	/* 카트 목록 */
	@Override
	public List<CartCommand> getCartList(String memberId) throws Exception {
		List<CartCommand> cartCommand = cartDAO.getCartList(memberId);
		return cartCommand;
	}

	/* 카트 확인 */
	@Override
	public CartCommand checkCart(String memberId, int productId) throws Exception {
		CartCommand checkCart = cartDAO.checkCart(memberId, productId);
		return checkCart;
	}

	/* 카트에 담긴 상품리스트 개수 */
	@Override
	public int getCartListCount(String memberId) throws Exception {
		int cartListCount = cartDAO.getCartListCount(memberId);
		return cartListCount;
	}
	
}
