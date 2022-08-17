package command;

import lombok.Data;

@Data
public class OrderItemCommand {
	
	private int orderitemId;
	
	private String orderId;
	
	private int productId;
	
	private int productCount;
	
	/* product 속성 조인하기위해 추가*/
	private String productBrand;
	private String productName;
	private int productPrice;
	private String fileName;
}
