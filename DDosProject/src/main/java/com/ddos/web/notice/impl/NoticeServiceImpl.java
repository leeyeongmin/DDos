package com.ddos.web.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.notice.NoticeService;
import com.ddos.web.notice.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return null; //noticeDAO.getNoticeList(vo);
	}

}
