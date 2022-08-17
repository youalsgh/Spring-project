package dao;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import command.CartCommand;

public interface CartDAO {
	
	/* 카트 추가 추가 성공 시 1, 실패시 0 반환*/
	public void addCart(CartCommand cartCommand) throws Exception;
	
	/* 카트 삭제 */
	public void deleteCart(int cartId) throws Exception;
	
	/* 카트 삭제(전체 row 삭제) */
	public void deleteCartAll(String memberId) throws Exception;
	
	/* 카트 수량 수정 */
	public void modifyCount(int cartId, int productCount) throws Exception;
	
	/* 카트 목록 */
	public List<CartCommand> getCartList(String memberId) throws Exception;
	
	/* 카트 확인 */
	public CartCommand checkCart(String memberId, int productId) throws Exception;
	
	/* 카트에 담긴 상품리스트 개수 */
	public int getCartListCount(String memberId) throws Exception;

}
