package command;

import lombok.Data;
 
@Data
public class ProductCommand {
	
	/* 상품 아이디 (자동증가) */
	private int id;
	
	/* 상품 브랜드 */
	private String brand;
	
	/* 상품 이름 */
	private String name;
	
	/* 상품 가격 (#,### 단위 변환 필요)*/
	private int price;
	
	/* 상품 성별(남자 or 여자) */
	private String gender;
	
	/* 상품 설명 */
	private String description;
	
	/* 상품 이미지 */
	private String fileName;
	
	/* 상품 평점 */
	private double ratingAvg;
	
	/* 상품 리뷰 개수*/
	private int replyCount;
}
