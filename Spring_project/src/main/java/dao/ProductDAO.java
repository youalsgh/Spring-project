package dao;

import java.util.List;

import command.Criteria;
import command.ProductCommand;

public interface ProductDAO {
	
	/* 관리자페이지 상품등록 */
	public void insertProduct(ProductCommand productCommand) throws Exception;
	
	/* 상품리스트 출력 */
	public List<ProductCommand> getProductList(Criteria cri) throws Exception;
	
	/* 상품리스트 개수 */
	public int getProductListCount() throws Exception;
	
	/* 상품 상세정보 가져오기 */
	public ProductCommand getProduct(int productId) throws Exception;
	
	/* 상품 평점 평균 반영 */
	public void updateRatingAvg(double ratingAvg, int productId) throws Exception;
	
	/* 관련 브랜드 상품 노출 */
	public List<ProductCommand> getRelatedProduct(String productBrand) throws Exception;
}
