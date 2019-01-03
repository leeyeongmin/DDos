package com.ddos.web.assets.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddos.web.assets.AssetsService;
import com.ddos.web.assets.AssetsVO;

@Service
public class AssetsServiceImpl implements AssetsService {
	@Autowired
	AssetsDAOMybatis ada;
	// 전체 조회
	
	@Override
	public List<AssetsVO> getAssetsList(AssetsVO vo) {
		
		return ada.getAssetsList(vo);
	}

	@Override
	public AssetsVO getAssets(AssetsVO vo) {
		
		return ada.getAssets(vo);
	}

	@Override
	public void assetsInsert(AssetsVO vo) {
		ada.assetsInsert(vo);
		
	}

	@Override
	public void assetsUpdate(AssetsVO vo) {
	ada.assetsUpdate(vo);
		
	}


	 
}
