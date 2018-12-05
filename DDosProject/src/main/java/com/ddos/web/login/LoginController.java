package com.ddos.web.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	// 로그인 폼 불러오기
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "no/login/Login";
	}

	// 로그인 처리
	
	@RequestMapping("login")
	public String login() {
		
		return "no/login/Home";
		
	}
	
	@RequestMapping("/main")
	public String main() {
		
		return "tiles/contents";
		
	}
	
	@RequestMapping("/read")
	public String read() {
		return "read/ReadChoose";
	}
	
	@RequestMapping("/booksss")
	public String book() {
		
		return "user/getBook";
		
	}
	

	/*@RequestMapping("login")
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session) { // UserVO 를 jsp에서 user로 사용
		// id 단건 조회

		UserVO uservo = userService.getUser(vo);

		// 해당 아이디가 존재 할 경우 password 비교

		if (uservo == null) { // id가 없는 경우
			return "user/login";
		} else if (!vo.getPassword().equals(uservo.getPassword())) { // password 오류
			return "user/login";
		} else {
			session.setAttribute("login", uservo);
			return "redirect:getBoardList";
		}
	}*/

	// 로그 아웃

	@RequestMapping("logout")
	public String loginout(HttpSession session) {
		session.invalidate(); // session 무효화
		return "login/Login";
	}
}
