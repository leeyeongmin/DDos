package com.ddos.web.study.impl;

import javax.servlet.http.HttpServletRequest;


import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ddos.web.study.StudyMemberVO;
import com.ddos.web.study.StudyVO;

@Repository
public class StudyDaoMybatis {
		
		@Autowired
		private SqlSessionTemplate mybatis;
		
		public void insertStudy(StudyVO vo,HttpServletRequest request) {
			System.out.println("mybatis insertStudy() 기능처리");		
			mybatis.update("study.insertStudy",vo);
		}
		
		public void insertStudyMember(StudyMemberVO vo) {
			System.out.println("mybatis insertStudyMember() 기능 처리");
			mybatis.update("study.insertStudyMember",vo);
		}
		
		//단건조회
		public StudyVO getStudy(StudyVO vo) {
			System.out.println("mybatis getStudy() 기능처리");
			return mybatis.selectOne("study.getStudy",vo);
		}
		
		
		//삭제
		public void deleteStudy(StudyVO vo) {
			System.out.println("mybatis deleteStudy() 기능처리");
			mybatis.update("study.deleteStudy",vo);		
		}
}
