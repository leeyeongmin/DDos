package com.ddos.web.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Scheduled(fixedDelay = 600000)		//좌석 시간 체크 후 시간이 완료되었으면 사용가능으로 변경 (1분(60000)) 
	public void seat_timeck() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		mybatis.update("read.timecheck", format.format(date));
	}
	
	@Scheduled(cron = "0 0 0 * * ?" )		//정시 연체일, 연체금액 추가  
	public void overdue_add() {
		mybatis.update("pay.overdue_add");
	}

}
