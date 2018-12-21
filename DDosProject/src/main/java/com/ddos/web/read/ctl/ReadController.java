package com.ddos.web.read.ctl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddos.web.read.ReadService;
import com.ddos.web.read.ReadVO;

@Controller
public class ReadController {

	@Autowired
	ReadService readserivce;
	
	@RequestMapping("adminread")		// 관리자
	public String adminread() {
		return "admin/read/Setting";
	}
	
	@RequestMapping("read")			//메인에서 화면 변경 
	public String read() {
		return "read/ReadSelect";
	}
	
/*	@RequestMapping("setRoom")		//열람실 선택시 나타나는 화면 (좌석배치)
	public String setRoom(Model model, ReadVO vo) {
		model.addAttribute("setList", readserivce.setRoom(vo));
		model.addAttribute("roomsize", readserivce.getroomsize(vo));
		return "read/Setting";
	}
	*/
	@RequestMapping("saveSeat")		//좌석 저장 (관리자)
	public String saveSeat(ReadVO vo) {
		readserivce.saveSeat(vo);
		
		return "read/ReadChoose";		
	}
	
/*	@RequestMapping("getRoom")		//열람실 선택 (유저)
	public String getRoom(Model model, ReadVO vo) {
		model.addAttribute("setList", readserivce.setRoom(vo));					//자리
		model.addAttribute("roomsize", readserivce.getroomsize(vo));			//룸크기
		return "user/ReadSelect";
	}*/
	
	@RequestMapping(value = "overlap", method = { RequestMethod.POST})
	@ResponseBody
	public ReadVO overlap(ReadVO vo) {
		return readserivce.overlap(vo);
	}
	
	@RequestMapping("updateSeat")
	@ResponseBody
	public void updateSeat(ReadVO vo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		vo.setStarttime(format.format(date));
		readserivce.updateSeat(vo);
	}

	@RequestMapping("useing_seat")
	@ResponseBody
	public String useing_seat(Model model, ReadVO vo) {			//로그인 후 자리 확인
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		vo.setStarttime(format.format(date));
		return readserivce.seat_useing(vo);
	}
	
	@RequestMapping("return_seat")
	@ResponseBody
	public void return_seat(ReadVO vo) {		//좌석 반환
		readserivce.return_seat(vo);
	}
	
	@RequestMapping("remaining")
	@ResponseBody
	public String remaining(ReadVO vo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		vo.setStarttime(format.format(date));
		return readserivce.remaining(vo);
	}
	
	@RequestMapping("extension")
	@ResponseBody
	public void extension(ReadVO vo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		vo.setStarttime(format.format(date));
		readserivce.extension(vo);
	}
	
	
	@RequestMapping("usetimer")
	@ResponseBody
	public String usetimer(ReadVO vo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		vo.setStarttime(format.format(date));
		return readserivce.usetimer(vo);
	}
	
	@RequestMapping("Roomshow")		//열람실 선택시 나타나는 화면 (좌석배치)
	@ResponseBody
	public List<ReadVO> Roomshow(ReadVO vo) {
		return readserivce.Roomshow(vo);
	}

	@RequestMapping("settingroom")
	@ResponseBody
	public String settingroom(ReadVO vo) {
		readserivce.settingroom(vo);
		return vo.getRoom();
	}
	
	@RequestMapping("timecheck")
	@ResponseBody
	public void timecheck() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		readserivce.timecheck(format.format(date));
	}
	
	@RequestMapping("servertime")
	@ResponseBody
	public String servertime() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return format.format(date); 
	}
	
	
	@RequestMapping("setting_change_ck")
	@ResponseBody
	public String setting_change_ck(ReadVO vo) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		vo.setStarttime(format.format(date));
		readserivce.setting_change_ck(vo);
		return vo.getCk();
	}

}
