package com.ddos.web.admin.user.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminUserController {
	
	//-------------------------------------------------------유저관리----------------------------------
	
	//유저 리스트 폼 불러오기
	@RequestMapping("/userListForm")
	public String userListForm() {
		return "admin/admin/UserList";
	}
	
	//유저 정보 폼 불러오기
	@RequestMapping("/userDetail")
	public String userDetail() {
		return "admin/admin/UserProfile";
	}
	
	//관리자 정보 폼 불러오기
	@RequestMapping("/adminDetail")
	public String adminDetail() {
		return "admin/admin/AdminProfile";
	}
	
	//통계 폼 불러오기
	@RequestMapping("/statisticsForm")
	public String statisticsForm() {
		return "admin/admin/AdminHome";
	}
	
}
