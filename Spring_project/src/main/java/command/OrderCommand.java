package command;

import lombok.Data;

@Data
/* 하나의 주문에 여러개의 상품이 들어갈 수 있는데 하나의 테이블로 처리하려고하면 상품 여러개가 들어있는 하나의 주문은 여러개의 데이터가 
 * 들어가게 되므로 비효율적이다. 따라서 두 개의 테이블로 분류한다. */
public class OrderCommand {
	
	/* 주문번호 */
	private String orderId;
	
	/* 수령인 */
	private String addressee;
	
	/* 회원 아이디 */
	private String memberId;
	
	/* 우편번호 */
	private String memberAddr1;
	
	/* 주소 */
	private String memberAddr2;
	
	/* 상세주소 */
	private String memberAddr3;
	
	/* 주문상태 */
	private String orderState;
	
	/* 주문일자 */
	private String orderDate;
	
}
