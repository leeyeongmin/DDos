package com.ddos.web.read.ctl;

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
	
	@RequestMapping("read")			//메인에서 화면 변경 
	public String read() {
		return "user/ReadChoose";
	}
	
	@RequestMapping("setRoom")		//열람실 선택시 나타나는 화면 (좌석배치)
	public String setRoom(Model model, ReadVO vo) {
		model.addAttribute("setList", readserivce.setRoom(vo));
		return "read/Setting";
	}
	
	@RequestMapping("saveSeat")		//좌석 저장 (관리자)
	public String saveSeat(ReadVO vo) {
		readserivce.saveSeat(vo);
		return "read/ReadChoose";		
	}
	
	@RequestMapping("getRoom")		//열람실 선택 (유저)
	public String getRoom(Model model, ReadVO vo) {
		model.addAttribute("setList", readserivce.setRoom(vo));
		model.addAttribute("roomsize", readserivce.getroomsize(vo));
		return "user/ReadSelect";
	}
	
	/*@RequestMapping(value = "overlap", method = { RequestMethod.POST})
	@ResponseBody
	public ReadVO overlap(ReadVO vo) {
		return readserivce.overlap(vo);
	}*/
	
	@RequestMapping(value = "overlap", method = { RequestMethod.POST})
	@ResponseBody
	public ReadVO overlap(ReadVO vo) {
		return readserivce.overlap(vo);
	}
	
	@RequestMapping("updateSeat")
	public String updateSeat(ReadVO vo) {
		readserivce.updateSeat(vo);
		return "redirect:getRoom?room="+vo.getRoom();
	}

	
/*	@RequestMapping("timecheck")
	public void timecheck() {
		readserivce.timecheck();
	}*/
	
	@RequestMapping("useing_seat")
	@ResponseBody
	public String useing_seat(Model model, ReadVO vo) {			//로그인 후 자리 확인
		System.out.println(vo.getLoginId());
		//model.addAttribute("timer", readserivce.usetimer(vo));
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
		System.out.println(vo.getLoginId());
		return readserivce.remaining(vo);
	}
	
	@RequestMapping("extension")
	@ResponseBody
	public void extension(ReadVO vo) {
		readserivce.extension(vo);
	}
	
	
	@RequestMapping("usetimer")
	@ResponseBody
	public String usetimer(ReadVO vo) {
		System.out.println("sss : " + readserivce.usetimer(vo));
		return readserivce.usetimer(vo);
	}
}
