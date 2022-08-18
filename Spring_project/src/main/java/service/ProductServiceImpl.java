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
	public List<ProductCommand> getProductList(Criteria cri, String filter) throws Exception {
		String sql;
		
		if(filter.equals("highPrice")) {
			sql = "select * from product order by p_price desc limit ?, ?";
			return productDAO.getProductList(cri, sql);
		} else if(filter.equals("rowPrice")){
			sql = "select * from product order by p_price asc limit ?, ?";
			return productDAO.getProductList(cri, sql);
		} else if(filter.equals("highRating")){
			sql = "select * from product order by p_ratingAvg desc limit ?, ?";
			return productDAO.getProductList(cri, sql);
		} else if(filter.equals("all")) {
			sql = "select * from product order by p_id desc limit ?, ?";
			return productDAO.getProductList(cri, sql);
		} else if(filter.equals("man")){
			sql = "select * from product where p_gender = 'man' limit ?, ?";
			return productDAO.getProductList(cri, sql);
		} else if(filter.equals("woman")){
			sql = "select * from product where p_gender = 'woman' limit ?, ?";
			return productDAO.getProductList(cri, sql);
		} else {
			sql = "select * from product order by p_id desc limit ?, ?";
			return productDAO.getProductList(cri, sql);
		}
	}
	
	/* 상품리스트 개수 */
	@Override
	public int getProductListCount(String filter) throws Exception {
		String sql;
		
		if(filter.equals("man")) {
			sql = "select count(*) from product where p_gender = 'man'";
			return productDAO.getProductListCount(sql);
		} else if(filter.equals("woman")) {
			sql = "select count(*) from product where p_gender = 'woman'";
			return productDAO.getProductListCount(sql);
		} else {
			sql = "select count(*) from product";
			return productDAO.getProductListCount(sql);
		}
		
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

	/* 평점 높은 상품 3개 가져오기 */
	@Override
	public List<ProductCommand> getHighRatingProduct() throws Exception {
		return productDAO.getHighRatingProduct();
	}
	
	/* 상품 리뷰개수 */
	@Override
	public int getProductReviewCount(int productId) throws Exception {
		Integer count =  productDAO.getProductReviewCount(productId);
		if(count == null) {
			count = 0;
			return count;
		} else {
			return count;
		}
	}

}
