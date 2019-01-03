package com.ddos.web.assets;

import java.util.List;
import com.ddos.web.assets.AssetsVO;


public interface AssetsService {

	// 전체 조회
	public List<AssetsVO> getAssetsList(AssetsVO vo);
	
	//상세 보기
	public AssetsVO getAssets(AssetsVO vo);
	
	//입력
	public void assetsInsert(AssetsVO vo);

	//수정
	public void assetsUpdate(AssetsVO vo);
	
	// 전체 건수
	public int getCount(AssetsVO vo);
}
