package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.Criteria;
import command.MemberCommand;
import command.PageMaker;
import command.ProductCommand;
import service.MemberService;
import service.ProductService;
import util.FileUpload;
 
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/* 관리자페이지 뷰 */
	@GetMapping("/admin_view")
	public void requestAdminView() {}
	
	/* 관리자페이지 회원리스트 출력 */
	@RequestMapping("/admin_member")
	public String requestMemberList(Model model) throws Exception{
		List<MemberCommand> memberList = memberService.memberList();
		int listCount = memberService.listCount();
		model.addAttribute("memberList", memberList);
		model.addAttribute("listCount", listCount);
		return "admin/admin_member";	
	}
	
	
	/* 관리자페이지 상품등록 */
	@GetMapping("/admin_productAdd")
	public void requestProductAddGET() {}
	
	@PostMapping("/admin_productAdd")
	public String requestProductAddPOST(HttpServletRequest request) throws Exception{
		ProductCommand productCommand = FileUpload.upload(request);
		productService.requestProductAdd(productCommand);
		return "redirect:/admin/admin_view";
	}
	
	/* 게시판 목록 페이지 접속(페이징 적용) */
	@GetMapping("/admin_product")
	public void requestProductListGET(@RequestParam("pageNum")int pageNum, Criteria cri, Model model) throws Exception{
		cri.setPageNum(pageNum);
		model.addAttribute("productCommand", productService.getProductList(cri));
		int total = productService.getProductListCount();
		PageMaker pageMaker = new PageMaker(cri, total);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	/* 관리자페이지 상품 상세페이지 */
	@GetMapping("/admin_productDetail")
	public void requestProductDetail() {}
	
}
