package com.ddos.web.notice.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddos.web.notice.NoticeVO;

public class NoticeMybatisDAO {
	private SqlSession mybatis;
	
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return mybatis.selectList("NoticeDAO.getBoardList", vo);
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                             