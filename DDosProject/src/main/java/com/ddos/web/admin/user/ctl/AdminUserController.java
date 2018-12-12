package com.ddos.web.admin.user.ctl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.user.UserService;
import com.ddos.web.user.UserVO;


@Controller
public class AdminUserController {
	
	@Autowired UserService userService;
	
	//-------------------------------------------------------유저관리----------------------------------
	
	//유저 리스트 정보 조회 & 폼 불러오기
	@RequestMapping("getUserList")
	public String getUserList(Model model, UserVO vo){
		model.addAttribute("userList", userService.getUserList(vo));
		return "admin/admin/UserList";
	}
	
	/*@RequestMapping("/userListForm")
	public String userListForm() {
		return "admin/admin/UserList";
	}*/
	
	
	// 관리자 정보 조회 & 폼 불러오기
	@RequestMapping("/userDetail") // http://localhost:8081/app/getBoardList
	public String getUser(Model model, UserVO vo) {
		
		
		model.addAttribute("user", userService.getUser(vo));
		
		UserVO uservo = userService.getUser(vo);
		
		if(uservo.getId().equals("admin@gmail.com")) {
			return "admin/admin/AdminProfile";
		}
		else {
			return "admin/admin/UserProfile";
		}
	}
	
	
	//통계 폼 불러오기
	@RequestMapping("/statisticsForm")
	public String statisticsForm() {
		return "admin/admin/AdminHome";
	}
	
}
