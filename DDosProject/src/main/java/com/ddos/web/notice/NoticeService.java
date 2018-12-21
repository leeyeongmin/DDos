package com.ddos.web.notice;

import java.util.List;

public interface NoticeService {
	public void insertNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public void increaseCnt(NoticeVO vo);
	public NoticeVO getNotice(NoticeVO vo);
	public List<NoticeVO> getNoticeList(NoticeVO vo);
	public NoticeVO UsergetNotice(NoticeVO vo);
	public List<NoticeVO> UsergetNoticeList(NoticeVO vo);
}