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
	
	// 등록
	public void insertNotice(NoticeVO vo) {
		System.out.println("my batis insertNotice() 기능 처리");
		mybatis.insert("notice.insertNotice", vo);
	}
	
	// 수정
	public void updateNotice(NoticeVO vo) {
		System.out.println("my batis updateNotice() 기능 처리");
		mybatis.update("notice.updateNotice", vo);
	}
	
	// 삭제
	public void deleteNotice(NoticeVO vo) {
		System.out.println("my batis deleteNotice() 기능 처리");
		mybatis.delete("notice.deleteNotice", vo);
	}
	
	// 조회수 증가
	public void increaseCnt(NoticeVO vo) {
		System.out.println("my batis increaseCnt() 기능 처리");
		mybatis.update("notice.increaseCnt", vo);
	}
	
	// 단건 조회
	public NoticeVO getNotice(NoticeVO vo) {
		System.out.println("my batis spring jdbc 단건 조회");
		return mybatis.selectOne("notice.getNotice", vo);
	}
	
	// 사용자 단건 조회
	public NoticeVO UsergetNotice(NoticeVO vo) {
		System.out.println("my batis spring jdbc 단건 조회");
		return mybatis.selectOne("notice.getNotice", vo);
	}
	
	// 전체 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("my batis spring jdbc 다중 조회");
		return mybatis.selectList("notice.getNoticeList", vo);
	}
	
	// 사용자 전체 조회
	public List<NoticeVO> UsergetNoticeList(NoticeVO vo) {
		System.out.println("my batis spring jdbc 다중 조회");
		return mybatis.selectList("notice.getNoticeList", vo);
	} 
}
                                                                                                                                                                                                                                                                                                                                                                                                                             