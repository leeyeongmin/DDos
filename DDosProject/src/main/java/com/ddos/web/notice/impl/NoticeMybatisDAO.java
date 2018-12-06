package com.ddos.web.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.notice.NoticeVO;

@Repository
public class NoticeMybatisDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 단건 조회
	public NoticeVO getNotice(NoticeVO vo) {
		System.out.println("my batis spring jdbc 단건 조회");
		return mybatis.selectOne("notice.getNotice", vo);
	}
	
	// 전체 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("my batis spring jdbc 다중 조회");
		return mybatis.selectList("notice.getNoticeList", vo);
		
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                             