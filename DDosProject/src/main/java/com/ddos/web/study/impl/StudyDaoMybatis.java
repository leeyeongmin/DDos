package com.ddos.web.study.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.study.StudyVO;

@Repository
public class StudyDaoMybatis {
		
		@Autowired
		private SqlSessionTemplate mybatis;
		
		public void insertStudy(StudyVO vo) {
			System.out.println("mybatis insertStudy() 기능처리");
			mybatis.update("study.insertStudy",vo);
		}
		
}
