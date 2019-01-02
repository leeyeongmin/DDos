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

	public List<AssetsVO> getAssetsList(AssetsVO vo) {
		System.out.println("자산리스트  mybatis ");
		return mybatis.selectList("assets.getAssetsList", vo);
	}

	public AssetsVO getAssets(AssetsVO vo) {
		System.out.println("자산상세보기  mybatis ");
		return mybatis.selectOne("asssets.getAssets", vo);
	}

	public void assetsInsert(AssetsVO vo) {
		System.out.println("자산 입력  mybatis ");
		mybatis.insert("assets.assetsInsert", vo);
	}

	public void assetsUpdate(AssetsVO vo) {
		System.out.println("자산 수정  mybatis ");
		mybatis.update("assets.assetsUpdate", vo);
	}

	public int getCount(AssetsVO vo) {
		return mybatis.selectOne("assets.getCount", vo);
	}

}
