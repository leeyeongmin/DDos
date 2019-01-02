package com.ddos.web.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.notice.NoticeService;
import com.ddos.web.notice.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMybatisDAO noticeDAO;

	// 전체 조회
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	// 상세 조회
	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	// 사용자 상세 조회
	@Override
	public NoticeVO UsergetNotice(NoticeVO vo) {
		return noticeDAO.UsergetNotice(vo);
	}

	// 수정
	@Override
	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}

	// 등록
	@Override
	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
		System.out.println("=== noticeNum = " + vo.getNoticeNum());
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
	}

	@Override
	public void increaseCnt(NoticeVO vo) {
		noticeDAO.increaseCnt(vo);
	}

	@Override
	public List<NoticeVO> UsergetNoticeList(NoticeVO vo) {
		return noticeDAO.UsergetNoticeList(vo);
	}

	// 건수
	@Override
	public int getCount(NoticeVO vo) {
		return noticeDAO.getCount(vo);
	}
}
