package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.Criteria;
import command.ProductCommand;
import dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO productDAO;
	
	static final int LISTCOUNT = 12;
	
	/* 관리자페이지 상품등록 */
	@Override
	public void requestProductAdd(ProductCommand productCommand) throws Exception {
		productDAO.insertProduct(productCommand);
	}

	/* 상품리스트 출력 */
	@Override
	public List<ProductCommand> getProductList(Criteria cri) throws Exception {
		return productDAO.getProductList(cri);
	}
	
	/* 상품리스트 개수 */
	@Override
	public int getProductListCount() throws Exception {
		return productDAO.getProductListCount();
	}

	/* 상품 상세정보 가져오기 */
	@Override
	public ProductCommand getProduct(int productId) throws Exception {
		return productDAO.getProduct(productId);
	}
	
	/* 관련 브랜드 상품 노출 */
	@Override
	public List<ProductCommand> getRelatedProduct(String productBrand) throws Exception {
		return productDAO.getRelatedProduct(productBrand);
	}

}
