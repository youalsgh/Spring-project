package pjt;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import command.CartCommand;
import service.CartService;

public class addCartTest {

	@Autowired
	private CartService service;
	
	@Test
	public void test() throws Exception {

		String memberId = "admin";
		int bookId = 22;
		int count = 5;
		CartCommand dto = new CartCommand();
		dto.setMemberId(memberId);
		dto.setProductId(bookId);
		dto.setProductCount(count);
		
		int result = service.addCart(dto);
		
		System.out.println("** result : " + result );
	}

}
