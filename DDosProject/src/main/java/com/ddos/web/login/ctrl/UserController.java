package com.ddos.web.login.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.login.UserService;
import com.ddos.web.login.UserVO;



@Controller
public class UserController {

	@Autowired UserService userService;
	
	
	//-------------------------------------------------------------------로그인---------------------------------------------------
	// 로그인 폼 불러오기
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "no/login/Login";
	}


	// 단건 조회
	@RequestMapping("/getUser") // http://localhost:8081/app/getBoardList
	public String getBoard(Model model, UserVO vo) {
		model.addAttribute("user", userService.getUser(vo));
		return "user/getUser";
	}

	//로그인 처리
	@RequestMapping("login")
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {		//UserVO 를 jsp에서 user로 사용
		//id 단건 조회
		
		UserVO uservo = userService.getUser(vo);
        
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		//해당 아이디가 존재 할 경우 password 비교
		if(uservo == null) {		//id가 없는 경우
			
            out.println("<script>alert('회원 정보가 존재하지 않습니다. 회원 가입을 해주세요.');</script>");
            out.flush();
			
			return "no/login/Login";
		}else if(! vo.getPassword().equals(uservo.getPassword())) {		//password 오류
			
			out.println("<script>alert('비밀번호가 틀렸습니다. 비밀번호를 확인해주세요.');</script>");
            out.flush();
            
			return "no/login/Login";
		}else {
			session.setAttribute("login", uservo);
			return "no/login/Home";
		}
	}

	//-------------------------------------------------------------------비번찾기-----------------------------------------------------------
	
	// 아이디,비번찾기 폼 불러오기
	@RequestMapping("/findForm")
	public String findForm() {
		return "no/login/FindInfo";
	}
	
	
	//아이디 찾기 처리
	@RequestMapping("findId")
	public String findId(@ModelAttribute("fid") UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {		//UserVO 를 jsp에서 user로 사용
		//id 단건 조회
		
		UserVO uservo = userService.findId(vo);
		
		System.out.println(vo);
		System.out.println(uservo);
	       
		response.setContentType("text/html; charset=UTF-8");
	       PrintWriter out = response.getWriter();
		
		//해당 아이디가 존재 할 경우 password 비교
		if(uservo == null) {		//id가 없는 경우
			
	           out.println("<script>alert('회원 정보가 존재하지 않습니다. 회원 가입을 해주세요.');</script>");
	           out.flush();
			
			return "no/login/Login";
		}else {
			out.println("<script>alert("+"'"+ uservo.getId() + "'" +");</script>");
			out.flush();
			return "no/login/Login";
		}
	}
	
	//비밀번호찾기 처리
		@RequestMapping("findPwd")
		public String findPwd(@ModelAttribute("fpwd") UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {		//UserVO 를 jsp에서 user로 사용
			//id 단건 조회
			
			UserVO uservo = userService.findPwd(vo);
			
			System.out.println(vo);
			System.out.println(uservo);
		       
			response.setContentType("text/html; charset=UTF-8");
		       PrintWriter out = response.getWriter();
			
			//해당 아이디가 존재 할 경우 password 비교
			if(uservo == null) {		//id가 없는 경우
				
		           out.println("<script>alert('회원 정보가 존재하지 않습니다. 회원 가입을 해주세요.');</script>");
		           out.flush();
				
				return "no/login/Login";
			}else {
				out.println("<script>alert("+"'"+ uservo.getPassword() + "'" +");</script>");
				out.flush();
				return "no/login/Login";
			}
		}
	
	//-------------------------------------------------------------------회원가입-----------------------------------------------------------
	
	//id check
	@RequestMapping(value = "checkId", method = { RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody String idCheck(UserVO vo) {
		
		if(vo.getId().equals("")) {
			return "2";
		}
		
		else {
			return new String(new Integer(userService.checkId(vo)).toString());
		}
    }

	
	// 등록 처리
		@RequestMapping("join")
		public String insertBoard(UserVO vo){				//커맨드 객체
			userService.insertUser(vo);					//등록 처리
			return "no/login/Login";					
		}
		
		//-------------------------------------------------------------------메인페이지 넘어가기-----------------------------------------------------------
			
		
		// 로그인 폼 불러오기
		@RequestMapping("mainForm")
		public String mainForm() {
			
			return "admin/adminHome";
		}
	
}
