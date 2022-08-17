package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import command.Criteria;
import command.ProductCommand;
 
@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductCommand> productRowMapper = new RowMapper<ProductCommand>() {

		@Override
		public ProductCommand mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductCommand product = new ProductCommand();
			product.setId(rs.getInt("p_id"));
			product.setBrand(rs.getString("p_brand"));
			product.setName(rs.getString("p_name"));
			product.setPrice(rs.getInt("p_price"));
			product.setGender(rs.getString("p_gender"));
			product.setDescription(rs.getString("p_description"));
			product.setFileName(rs.getString("p_fileName"));
			product.setRatingAvg(rs.getDouble("p_ratingAvg"));
			return product;
		}
		
	};
	
	/* 관리자페이지 상품등록 */
	@Override
	public void insertProduct(ProductCommand productCommand) throws Exception {
		String sql = "insert into product(p_brand, p_name, p_price, p_gender, p_description, p_fileName) values(?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, productCommand.getBrand(), productCommand.getName(), productCommand.getPrice(), productCommand.getGender(), productCommand.getDescription(), productCommand.getFileName());
	}
	
	/* 상품리스트 가져오기 */
	@Override
	public List<ProductCommand> getProductList(Criteria cri) throws Exception {
		String sql = "select * from product order by p_id desc limit ?, ?";
		List<ProductCommand> results = jdbcTemplate.query(sql, productRowMapper, cri.getSkip(), cri.getAmount());
		return results.isEmpty() ? null : results;
		
	}

	/* 상품리스트 개수 */
	@Override
	public int getProductListCount() throws Exception {
		String sql = "select count(*) from product";
		Integer listCount = jdbcTemplate.queryForObject(sql, Integer.class);
		return listCount;
	}
	
	/* 상품 상세정보 가져오기 */
	@Override
	public ProductCommand getProduct(int productId) throws Exception {
		String sql = "select * from product where p_id = ?";
		List<ProductCommand> results = jdbcTemplate.query(sql, productRowMapper, productId);
		return results.isEmpty() ? null : results.get(0);
	}

	/* 상품 평점 평균 반영 */
	@Override
	public void updateRatingAvg(double ratingAvg, int productId) throws Exception {
		String sql = "update product set p_ratingAvg = ? where p_Id = ?";
		jdbcTemplate.update(sql, ratingAvg, productId);
	}
	
	/* 관련 브랜드 상품 노출 */
	@Override
	public List<ProductCommand> getRelatedProduct(String productBrand) throws Exception {
		String sql = "select * from product where p_brand = ? order by rand() limit 12";
		List<ProductCommand> results = jdbcTemplate.query(sql, productRowMapper, productBrand);
		return results.isEmpty() ? null : results;
	}
	
}
