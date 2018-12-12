package com.ddos.web.user.ctrl;

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

import com.ddos.web.user.UserService;
import com.ddos.web.user.UserVO;



@Controller
public class UserController {

	@Autowired UserService userService;
	
	
	//-------------------------------------------------------------------濡쒓렇�씤---------------------------------------------------
	// 濡쒓렇�씤 �뤌 遺덈윭�삤湲�
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "no/login/Login";
	}

	//濡쒓렇�씤 泥섎━
	@RequestMapping("login")
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {		//UserVO 瑜� jsp�뿉�꽌 user濡� �궗�슜
		//id �떒嫄� 議고쉶
		
		UserVO uservo = userService.getUser(vo);
        
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		//�빐�떦 �븘�씠�뵒媛� 議댁옱 �븷 寃쎌슦 password 鍮꾧탳
		if(uservo == null) {		//id媛� �뾾�뒗 寃쎌슦
			
            out.println("<script>alert('�쉶�썝 �젙蹂닿� 議댁옱�븯吏� �븡�뒿�땲�떎. �쉶�썝 媛��엯�쓣 �빐二쇱꽭�슂.');</script>");
            out.flush();
			
			return "no/login/Login";
		}else if(! vo.getPassword().equals(uservo.getPassword())) {		//password �삤瑜�
			
			out.println("<script>alert('鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎. 鍮꾨�踰덊샇瑜� �솗�씤�빐二쇱꽭�슂.');</script>");
            out.flush();
            
			return "no/login/Login";
		}else {
			
			session.setAttribute("login", uservo);
			
			if(uservo.getId().equals("admin@gmail.com")) {
				return "admin/admin/AdminHome";
			}
			else {
				return "user/UserHome";
			}
		}
	}

	//-------------------------------------------------------------------鍮꾨쾲李얘린-----------------------------------------------------------
	
	// 鍮꾨쾲李얘린 �뤌 遺덈윭�삤湲�
	@RequestMapping("/findForm")
	public String findForm() {
		return "no/login/FindInfo";
	}
	
	//鍮꾨�踰덊샇李얘린 泥섎━
		@RequestMapping("findPwd")
		public String findPwd(@ModelAttribute("fpwd") UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {		//UserVO 瑜� jsp�뿉�꽌 user濡� �궗�슜
			//id �떒嫄� 議고쉶
			
			UserVO uservo = userService.findPwd(vo);
			
			System.out.println(vo);
			System.out.println(uservo);
		       
			response.setContentType("text/html; charset=UTF-8");
		       PrintWriter out = response.getWriter();
			
			//�빐�떦 �븘�씠�뵒媛� 議댁옱 �븷 寃쎌슦 password 鍮꾧탳
			if(uservo == null) {		//id媛� �뾾�뒗 寃쎌슦
				
		           out.println("<script>alert('�쉶�썝 �젙蹂닿� 議댁옱�븯吏� �븡�뒿�땲�떎. �쉶�썝 媛��엯�쓣 �빐二쇱꽭�슂.');</script>");
		           out.flush();
				
				return "no/login/Login";
			}else {
				out.println("<script>alert("+"'"+ uservo.getPassword() + "'" +");</script>");
				out.flush();
				return "no/login/Login";
			}
		}
	
	//-------------------------------------------------------------------�쉶�썝媛��엯-----------------------------------------------------------
	
		
	//�쉶�썝媛��엯 �뤌 遺덈윭�삤湲�
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "no/login/SignUp";
	}
	
	//id check
	@RequestMapping(value = "checkId", method = { RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody int idCheck(UserVO vo, Model model) {
		
		if(vo.getId().equals("")) {
			return 2;
		}
		
		else {
			return userService.checkId(vo);
		}
    }

	
	// �벑濡� 泥섎━
		@RequestMapping("join")
		public String insertBoard(UserVO vo){				//而ㅻ㎤�뱶 媛앹껜
			userService.insertUser(vo);					//�벑濡� 泥섎━
			return "no/login/Login";					
		}

	
}
