package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProductService;

@Controller
public class IndexController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/")
	public String requestIndexPage(Model model) throws Exception {
		int productId1 = productService.getHighRatingProduct().get(0).getId();
		int productId2 = productService.getHighRatingProduct().get(1).getId();
		int productId3 = productService.getHighRatingProduct().get(2).getId();
		
		model.addAttribute("productList", productService.getHighRatingProduct());
		model.addAttribute("count1",productService.getProductReviewCount(productId1));
		model.addAttribute("count2",productService.getProductReviewCount(productId2));
		model.addAttribute("count3",productService.getProductReviewCount(productId3));
		return "index";
	}
}
