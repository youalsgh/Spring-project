package pjt;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import command.Criteria;
import command.ProductCommand;
import dao.ProductDAO;

public class testGetListPaging {

	private static final Logger logger = LoggerFactory.getLogger(testGetListPaging.class);
	
	@Autowired
	ProductDAO productDAO;

	private Logger log;
	
	@Test
	public void test() throws Exception {
		Criteria cri = new Criteria();
		
		List<ProductCommand> list = productDAO.getProductList(cri);
		list.forEach(results -> log.info("" + results));
	}

}
