package com.nts.cozy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nts.cozy.service.MailService;
import com.nts.cozy.service.MemberService;
import com.nts.cozy.vo.Member;

/**
 * @author 박정재_신창환
 * 
 */
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MailService mailService;

	@Autowired
	MemberService memberService;

	@GetMapping("/login")
	public String loadLoginView() {
		return "member/login";
	}

	@GetMapping("/profile")
	public String loadMemberProfileView() {
		return "member/profile";
	}

	@GetMapping("/admin")
	public String loadMemberAdminView() {
		return "member/admin";
	}

	@GetMapping("/register")
	public String loadMemberRegisterView(Model model) {
		return "member/register";
	}

	@GetMapping("/modify")
	public String loadMyInfoView(Model model, @RequestParam("email") String email) {
		Member member = memberService.getMember(email);
		model.addAttribute("member", member);

		return "member/modify";
	}

	@GetMapping("/modify/password")
	public String loadPasswordView(Model model, @RequestParam("email") String email) {
		Member member = memberService.getMember(email);
		model.addAttribute("member", member);

		return "member/modifyPassword";
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/register")
	@ResponseBody
	public String registerMember(HttpServletRequest request, Member member) {
		member.setIpv6(request.getRemoteAddr());

		memberService.registerMember(member);
		return "success";
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/mail")
	@ResponseBody
	public String sendMail(@RequestParam("email") String email) {
		String authCode = mailService.getAuthCode();

		mailService.sendMail(email, "Cozy 가입 인증 메일", "인증코드 : " + authCode);
		return authCode;
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/find")
	@ResponseBody
	public String modifyPassword(@RequestParam("email") String email) {
		String tempPassword = mailService.getRandomPassword();
		memberService.modifyPassword(email, tempPassword);

		mailService.sendMail(email, "Cozy 임시 비밀번호", "임시 비밀번호 : " + tempPassword);
		return tempPassword;
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/modify")
	@ResponseBody
	public String modify(Member member) {
		boolean result = memberService.modifyMember(member);

		if (result == true) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/modify/password")
	@ResponseBody
	public String modifyPassword(Member member) {
		boolean result = memberService.modifyPassword(member.getEmail(), member.getPassword());

		if (result == true) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/profile")
	@ResponseBody
	public Member getMember(@RequestParam("email") String email) {
		return memberService.getMember(email);
	}

	/**
	 * @author 신창환
	 */
	@PostMapping("/addAuth")
	@ResponseBody
	public boolean addAuthority(@RequestParam("email") String email, @RequestParam("authorityToAdd") String authority) {
		return memberService.addAuthorityByEmail(email, authority);
	}

	/**
	 * @author 박정재
	 */
	@PostMapping("/unregister")
	@ResponseBody
	public boolean unregisterMember(@RequestParam("nickname") String nickname) {
		return memberService.unregisterMember(nickname);
	}

}
