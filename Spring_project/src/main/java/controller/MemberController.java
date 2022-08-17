package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import command.MemberCommand;
import dao.MemberDAO;
import service.CartService;
import service.MemberService;

@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/member") // 모든 맵핑은 /member 상속
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberDAO memberDAO;
	
	/* 회원가입 처리 */
	@GetMapping("/signup")
	public void requestSignupGET(){}
	
	@PostMapping("/signup")
	public String requestSignupPOST(MemberCommand memberCommand) throws Exception{
		memberService.signupMember(memberCommand);
		
		return "redirect:/index";
	}
	
	/* 아이디 중복 검사 */
	@PostMapping(value = "/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		int result = memberDAO.idCheck(memberId);
		
		if(result != 0) {
			return "fail";
		}
		else {
			return "success";
		}
	}
	
	/* 로그인 (a태그의 요청은 GET방식이다.)*/
	@GetMapping("/login.do")
	public void requestLoginGET() throws Exception{}
	
	@PostMapping("/login.do")
	public String requestLoginPOST(MemberCommand memberCommand, HttpServletRequest request, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberCommand member = memberService.loginMember(memberCommand);
		int cartListCount = cartService.getCartListCount(memberCommand.getId());
		System.out.println(cartListCount);
		if(member == null) {
			int result = 0; // 0은 거짓, 1은 성공
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login.do";
		}
		
		/* 쿠키 생성/삭제 기능 - 김영재 */
		Cookie rememberCookie = new Cookie("rememberId", memberCommand.getId());
		rememberCookie.setPath("/");
		if (memberCommand.isRememberId()) {
			rememberCookie.setMaxAge(60 * 60 * 24 * 30);
		} else {
			rememberCookie.setMaxAge(0);
		}
		response.addCookie(rememberCookie);
		/* /쿠키 생성/삭제 기능 끝 */
		
		session.setAttribute("memberAdminCk", member.getAdminCk());
		session.setAttribute("memberId", member.getId());
		session.setAttribute("memberName", member.getName());
		session.setAttribute("memberEmail", member.getEmail());
		session.setAttribute("cartListCount", cartListCount);
		return "redirect:/index";
	}
	/* 로그아웃 */
	@RequestMapping("/logout.do")
	public String requestLogoutGET(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index";
	}
	
	/* 회원정보 수정 페이지 - 김영재 */
	@GetMapping("/info.do")
	public String member_info(Model model, MemberCommand memberCommand, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		memberCommand.setId((String)session.getAttribute("memberId"));
		memberCommand.setName((String)session.getAttribute("memberName"));
		memberCommand.setEmail((String)session.getAttribute("memberEmail"));
		model.addAttribute("memberCommand", memberCommand);
		return "member/update_member_info";
	}
	
	/* 회원정보 수정 처리 - 김영재 */
	@PostMapping("/update")
	public String updatePOST(MemberCommand memberCommand, HttpSession session) throws Exception {
		MemberCommand member = memberService.check_Info(memberCommand);
		memberService.member_info(memberCommand);
		session.setAttribute("memberAdminCk", member.getAdminCk());
		session.setAttribute("memberId", member.getId());
		session.setAttribute("memberName", member.getName());
		session.setAttribute("memberEmail", member.getEmail());
		return "redirect:/index";
	}

	/* 비밀번호 찾기 페이지 - 김영재 */
	@GetMapping("/find_pw")
	public String forgot_page() {
		return "member/found_pw";
	}

	/* 비밀번호 찾기 - 김영재 */
	@PostMapping("/find_pw")
	public ModelAndView find_pw(Model model, MemberCommand memberCommand) throws Exception {
		MemberCommand check_Info = memberService.check_Info(memberCommand);
		ModelAndView modelAndView = new ModelAndView("member/founded_pw");
		if (check_Info == null) {
			modelAndView.addObject("message", "입력하신 정보를 다시 확인해 주세요.");
		} else {
			modelAndView.addObject("message",
					check_Info.getName() + "님의 비밀번호는 \"" + check_Info.getPassword() + "\" 입니다.");

			model.addAttribute("memberCommand_f", check_Info);
		}
		return modelAndView;
	}
	
	/* 회원 탈퇴 페이지 - 김영재 */
	@RequestMapping(value = "/drop_m", method = RequestMethod.GET)
	public String dropGET(Model model, MemberCommand memberCommand, HttpServletRequest request) {
		HttpSession session = request.getSession();
		memberCommand.setId((String)session.getAttribute("memberId"));
		memberCommand.setName((String)session.getAttribute("memberName"));
		memberCommand.setEmail((String)session.getAttribute("memberEmail"));
		model.addAttribute("memberCommand", memberCommand);
		return "member/drop_member";
	}
	
	/* 회원 탈퇴 처리 - 김영재 */
	@PostMapping("/drop")
	public ModelAndView dropPOST(MemberCommand memberCommand, HttpSession session, Model model) throws Exception {
		MemberCommand member = memberService.loginMember(memberCommand);
		ModelAndView modelAndView = new ModelAndView("member/drop_member");
		if (member != null) {
			memberService.drop_Member(memberCommand);
			session.invalidate();
			modelAndView.addObject("message","이용해주셔서 감사합니다.");
			modelAndView.addObject("drop_result", true);
		} else {
			modelAndView.addObject("message", "비밀번호가 일치하지 않습니다.");
			modelAndView.addObject("drop_result", false);
		}
		System.out.println(modelAndView);
		return modelAndView;
	}
	
	@RequestMapping("/main.do")
	public String redirectMain() {
		return "redirect:/index";
	}
}