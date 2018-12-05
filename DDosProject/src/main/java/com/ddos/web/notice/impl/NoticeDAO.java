package com.ddos.web.notice.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ddos.web.notice.NoticeVO;

@Repository
public class NoticeDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// SQL 명령어
	private final String noticeList = "select * from notice order by notice_num desc";
	
/*	// 글 목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(noticeList);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNoticeNum(rs.getInt("notice_num"));
				notice.setNoticeTitle(rs.getString("notice_title"));
				notice.setNoticeDate(rs.getString("notice_date"));
				notice.setNoticeCont(rs.getString("notice_cont"));
				notice.setMemberId(rs.getString("member_id"));
				notice.setNoticeCnt(rs.getInt("notice_cnt"));
				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
	}*/
}
