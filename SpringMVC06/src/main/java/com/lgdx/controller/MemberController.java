package com.lgdx.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.lgdx.entity.Member;
import com.lgdx.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/login.do")
	public String login() {
		
		return "login";
	}
	
	@GetMapping("/join.do")
	public String join() {
		
		return "join";
	}
	
	@PostMapping("/join.do") // 회원가입
	public String join(Member vo) {
		
		service.join(vo);
		
		return "redirect:/login.do";
	}
	
	@PostMapping("/login.do") // 로그인
	public String login(Member vo, HttpSession session) {
		
		Member info = service.login(vo);
		System.out.println("로그인 정보 : " + info);
		
		// 로그인 성공할 경우 세션에 데이터를 저장해 사용
		if(info != null) {
			session.setAttribute("info", info);
			System.out.println("로그인 성공!");
		}
		
		return "redirect:/boardList.do";
	}
	
	@GetMapping("/logout.do") // 로그아웃
	public String logout(HttpSession session) {
		// 세션의 데이터를 삭제(만료)해 null로 처리
		// session.removeAttribute("info"); // 특정 데이터만 삭제
		session.invalidate(); // 세션의 모든 데이터를 삭제
		System.out.println("로그아웃 성공!");
		
		return "redirect:/boardList.do";
	}
	
}
