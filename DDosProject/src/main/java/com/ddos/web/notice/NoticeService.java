package com.ddos.web.notice;

import java.util.List;

public interface NoticeService {
	public NoticeVO getNotice(NoticeVO vo);
	public List<NoticeVO> getNoticeList(NoticeVO vo);
}