package command;

import lombok.Data;

@Data
public class CartCommand {
	
	private int cartId;
	private String memberId;
	private int productId;
	private int productCount;
	
	/* product 속성 (cart와 조인하기위해 추가)*/
	private String productName;
	private int productPrice;
	private double productDiscount;
	private String fileName;
	
	/* 판매가격에 수량은 곱한 총 가격 */
	private int totalPrice;
	
	/* 장바구니 총 가격 */
	private int totalPriceAll;
}
