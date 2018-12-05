package com.ddos.web.notice;

import java.util.List;

public interface NoticeService {
	List<NoticeVO> getNoticeList(NoticeVO vo);
}