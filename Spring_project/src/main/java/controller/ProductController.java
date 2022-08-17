package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import command.CartCommand;
import command.Criteria;
import command.OrderCommand;
import command.OrderItemCommand;
import command.PageMaker;
import command.ReplyCommand;
import service.CartService;
import service.OrderService;
import service.ProductService;
import service.ReplyService;
 
@Controller
@RequestMapping("/main")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ReplyService replyService;
	
	/* 상품리스트 페이지 */
	@GetMapping("/main_shop")
	public void requestProductListGET(@RequestParam("pageNum")int pageNum, Criteria cri, Model model) throws Exception{
		cri.setPageNum(pageNum);
		model.addAttribute("productList", productService.getProductList(cri));
		int total = productService.getProductListCount();
		PageMaker pageMaker = new PageMaker(cri, total);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	/* 상품 상세페이지 */
	@GetMapping("/main_shopDetail")
	public void requestProductDetail(@RequestParam int productId, @RequestParam(required = false) Integer result, @RequestParam String productBrand, Model model, HttpSession session) throws Exception{
		String memberId = (String) session.getAttribute("memberId");
		model.addAttribute("product", productService.getProduct(productId));
		model.addAttribute("result", result);
		model.addAttribute("relatedProduct", productService.getRelatedProduct(productBrand));
		int cartListCount = cartService.getCartListCount(memberId);
		session.setAttribute("cartListCount", cartListCount);
		model.addAttribute("replyListAll", replyService.getReplyListAll(productId));
	}
	
	/* 상품 상세페이지 장바구니 등록 */
	@PostMapping("/add")
	public String requestAddCart(CartCommand cartCommand, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		int product = cartCommand.getProductId();
		int cartListCount = cartService.getCartListCount(cartCommand.getMemberId());
		/* 로그인 체크 */	
		if(memberId == null) {
			return "redirect:/member/login.do";
		}
		
		Integer result = cartService.addCart(cartCommand);
		
		if(result == 1) {
			rttr.addAttribute("productId", product);
			rttr.addAttribute("result", result);
			session.setAttribute("cartListCount", cartListCount);
			return "redirect:/main/main_shopDetail";	
		} else {
			rttr.addAttribute("productId", product);
			rttr.addAttribute("result", result);
			session.setAttribute("cartListCount", cartListCount);
			return "redirect:/main/main_shopDetail";
		}
	}
	
	/* 장바구니 리스트 출력 */
	@GetMapping("/cart")
	public String requestCartList(@RequestParam String memberId, Model model) throws Exception{
		List<CartCommand> cartList = cartService.getCartList(memberId);
		model.addAttribute("cartList", cartList);
		return "main/cart";
	}
	
	/* 장바구니 카트 상품 삭제 */
	@GetMapping("/cartDelete")
	public String requestCartDelete(@RequestParam String memberId, int cartId, RedirectAttributes rttr) throws Exception{
		cartService.deleteCart(cartId);
		rttr.addAttribute("memberId", memberId);
		return "redirect:/main/cart";
	}
	
	/* 장바구니 카트 상품 전체삭제 */
	@GetMapping("/cartDeleteAll")
	public String requestCartDeleteAll(@RequestParam String memberId, RedirectAttributes rttr) throws Exception{
		cartService.deleteCartAll(memberId);
		rttr.addAttribute("memberId", memberId);
		return "redirect:/main/cart";
		
	}
	
	/* 장바구니 카트상품 수량 수정 */
	@GetMapping("/cartModify")
	public String requestCartModify(@RequestParam int cartId, @RequestParam int productCount, HttpSession session, RedirectAttributes rttr) throws Exception{
		cartService.modifyCount(cartId, productCount);
		String memberId = (String)session.getAttribute("memberId");
		rttr.addAttribute("memberId", memberId);
		return "redirect:/main/cart";
	}
	
	/* 주문페이지 카트리스트 불러오기 */
	@GetMapping("/order")
	public void requestOrderGET(@RequestParam String memberId, Model model) throws Exception{
		List<CartCommand> cartList = cartService.getCartList(memberId);
		model.addAttribute("cartList", cartList);
	}
	
	/* 주문하기 */
	@PostMapping("/orderComplete")
	public String requestOrder(OrderCommand orderCommand, @RequestParam String[] productId, @RequestParam String[] productCount, HttpSession session, RedirectAttributes rttr) throws Exception{
		String memberId = (String)session.getAttribute("memberId");
		orderCommand.setMemberId(memberId);
		int result = orderService.addOrder(orderCommand, productId, productCount);
		rttr.addFlashAttribute("result", result);
		
		cartService.deleteCartAll(memberId);
		int cartListCount = cartService.getCartListCount(memberId);
		session.setAttribute("cartListCount", cartListCount);
		return "redirect:/index";
	}
	
	/* 주문정보 조회 */
	@GetMapping("/orderInfo")
	public String requestOrderInfo(@RequestParam String memberId, Model model) throws Exception{
		List<OrderCommand> orderCommand = orderService.getOrderInfo(memberId);
		model.addAttribute("orderCommand", orderCommand);
		return "main/orderInfo";
	}
	
	/* 주문상품 정보 조회*/
	@GetMapping("/orderItemInfo")
	public String requestOrderItemInfo(@RequestParam String orderId, Model model) throws Exception{
		List<OrderItemCommand> orderItemCommand = orderService.getOrderItemInfo(orderId);
		model.addAttribute("orderItemCommand", orderItemCommand);
		return "main/orderItemInfo";
	}
	
	/* 댓글 등록 */
	@PostMapping("/replyAdd")
	public String requestAddReply(ReplyCommand replyCommand, RedirectAttributes rttr) throws Exception{
		Integer checkReply = replyService.addReply(replyCommand);
		if(checkReply == 1) {
			rttr.addAttribute("productId", replyCommand.getProductId());
			rttr.addFlashAttribute("checkReply", checkReply);
			replyService.updateRatingAvg(replyCommand.getProductId());
			return "redirect:/main/main_shopDetail";
		} else {
			rttr.addAttribute("productId", replyCommand.getProductId());
			rttr.addFlashAttribute("checkReply", checkReply);
			return "redirect:/main/main_shopDetail";
		}
	}
	
	/* 댓글 삭제 */
	@GetMapping("/replyDelete")
	public String requestDeleteReply(@RequestParam String memberId, @RequestParam int productId, RedirectAttributes rttr) throws Exception{
		replyService.deleteReply(memberId, productId);
		replyService.updateRatingAvg(productId);
		rttr.addAttribute("productId", productId);
		return "redirect:/main/main_shopDetail";
	}
}
