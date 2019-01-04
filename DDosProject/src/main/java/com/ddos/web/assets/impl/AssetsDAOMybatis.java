package com.ddos.web.assets.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ddos.web.assets.AssetsVO;

@Repository
public class AssetsDAOMybatis {
	
	
	@Autowired
	private SqlSessionTemplate mybatis;

	//전체 조회
	public List<AssetsVO> getAssetsList(AssetsVO vo) {
		System.out.println("자산리스트  mybatis ");
		return mybatis.selectList("assets.getAssetsList", vo);
	}

	//단건 조회
	public AssetsVO getAssets(AssetsVO vo) {
		System.out.println("자산상세보기  mybatis ");
		return mybatis.selectOne("asssets.getAssets", vo);
	}

	//등록
	public void assetsInsert(AssetsVO vo) {
		System.out.println("자산 입력  mybatis ");
		mybatis.insert("assets.assetsInsert", vo);
	}

	//수정
	public void assetsUpdate(AssetsVO vo) {
		System.out.println("자산 수정  mybatis ");
		mybatis.update("assets.assetsUpdate", vo);
	}

	//건수 조회
	public int getCount(AssetsVO vo) {
		return mybatis.selectOne("assets.getCount", vo);
	}

}
