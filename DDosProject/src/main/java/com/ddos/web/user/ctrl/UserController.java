package com.ddos.web.user.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.Session;
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

	@Autowired
	UserService userService;

	// -------------------------------------------------------------------로그인---------------------------------------------------

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "no/login/Login";
	}

	@RequestMapping("login")
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletResponse response, Model model)
			throws IOException {

		UserVO uservo = userService.getUser(vo);
 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (uservo == null) {

			out.println("<script>alert('회원정보가 존재하지 않습니다. 다시 한번 확인해 주세요.');</script>");
			out.flush();

			return "no/login/Login";
		} else if (!vo.getPassword().equals(uservo.getPassword())) { // password �삤瑜�

			out.println("<script>alert('아이디 비밀번호가 일치하지 않습니다. 다시 한번 확인해 주세요.');</script>");
			out.flush();

			return "no/login/Login";
		}else {
			
			Date date = new Date();
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
System.out.println(uservo);
			int bigo = format1.format(date).compareTo(uservo.getExpDate());
				
			if (bigo >  0) {
				session.setAttribute("temp", uservo);
				model.addAttribute("user", uservo);
				return "no/pay/ShowPay";
			}else{
				session.setAttribute("login", uservo);

				if (uservo.getId().equals("admin@gmail.com")) {
					return "admin/admin/AdminHome";
				} else {
					return "user/UserHome";
				}
			}
		}
	}

	@RequestMapping("logout")
	public String logout(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletResponse response){
		session.removeAttribute("login");
		return "no/login/Login";

	}

	// -------------------------------------------------------------------鍮꾨쾲李얘린-----------------------------------------------------------

	@RequestMapping("/findForm")
	public String findForm() {
		return "no/login/FindInfo";
	}

	@RequestMapping("findPwd")
	public String findPwd(@ModelAttribute("fpwd") UserVO vo, HttpSession session, HttpServletResponse response)
			throws IOException { // UserVO 瑜� jsp�뿉�꽌 user濡� �궗�슜

		UserVO uservo = userService.findPwd(vo);

		System.out.println(vo);
		System.out.println(uservo);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (uservo == null) {

			out.println("<script>alert('회원정보가 존재하지 않습니다. 다시 한번 확인해 주세요.');</script>");
			out.flush();

			return "no/login/Login";
		} else {
			out.println("<script>alert(" + "'" + uservo.getPassword() + "'" + ");</script>");
			out.flush();
			return "no/login/Login";
		}
	}

	// -------------------------------------------------------------------�쉶�썝媛��엯-----------------------------------------------------------

	@RequestMapping("/joinForm")
	public String joinForm() {
		return "no/login/SignUp";
	}

	// id check
	@RequestMapping(value = "checkId", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int idCheck(UserVO vo, Model model) {

		if (vo.getId().equals("")) {
			return 2;
		}

		else {
			return userService.checkId(vo);
		}
	}

	@RequestMapping("join")
	public String insertUser(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException { // 而ㅻ㎤�뱶 媛앹껜
		userService.insertUser(vo); // �벑濡� 泥섎━
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원 가입이 완료되었습니다. 로그인 해주세용.');</script>");
		out.flush();
		return "no/login/Login";
	}

	// ------------------------------------------user my page------------------------------------
	
	@RequestMapping("/userHome")
	public String adminHome() {
		return "user/UserHome";
	}

	@RequestMapping("/myDetail") // http://localhost:8081/app/getBoardList
	public String getUser(Model model, UserVO vo) {

		model.addAttribute("user", userService.getUser(vo));
		return "userPage/UserInfo";
	}
	
	@RequestMapping("updateUserInfo")
	public String updateUserInfo(UserVO vo) {

		System.out.println(vo);

		userService.updateUser(vo);
		return "user/UserHome";
	}
	
	@RequestMapping("/withdrawalForm") // http://localhost:8081/app/getBoardList
	public String withsrawalForm(Model model, UserVO vo) {
		return "userPage/Withdrawal";
	}
	
	@RequestMapping("withdrawal")
	public String withdrawal(UserVO vo) { // 而ㅻ㎤�뱶 媛앹껜
		userService.deleteUser(vo); // �벑濡� 泥섎━
		return "no/login/Login";
	}

	
	@RequestMapping("extensionUser")	//연장 
	public String extensionUser(HttpSession session) {
		System.out.println("sklsdajklsdasdajklsdajkl");
		userService.extensionUser((UserVO)session.getAttribute("temp")); 
		session.setAttribute("login", userService.getUser((UserVO)session.getAttribute("temp")));
		return "user/UserHome"; 
	}
	
	@RequestMapping("loginHomepage")
	public String loginHomepage() {
		return "no/login/Login";   
	}
	
	@RequestMapping("getUser")
	@ResponseBody
	public UserVO getUser(UserVO vo) {
		return userService.getUser(vo);
	}
	
}
