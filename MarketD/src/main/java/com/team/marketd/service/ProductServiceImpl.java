package com.team.marketd.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ProductVo;
import com.team.marketd.persistence.ProductService_Mapper;

@Service("ProductServiceImpl")
public class ProductServiceImpl implements ProductService {

	private ProductService_Mapper psm;
	
	@Autowired
	private ProductServiceImpl(SqlSession session){
		
		this.psm = session.getMapper(ProductService_Mapper.class);
		
	}
	
	


	@Override
	public int selectProductListTotal(int page,int caidx,int minPrice,int maxPrice,String keyword) { // 상품 리스트 총합계(페이징)
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("page", page);
		hm.put("caidx", caidx);
		hm.put("minPrice", minPrice);
		hm.put("maxPrice", maxPrice);
		hm.put("keyword", keyword);
		
		int tcount = psm.selectProductListTotal(hm);
		
		
		return tcount;
	}
	
	@Override
	public ArrayList<ProductVo> selectNewProductList(int page) { // 최신 상품 리스트 셀렉트
		
		ArrayList<ProductVo> alist = psm.selectNewProductList(page);
		
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> selectProductList(int page, int caidx, int minPrice, int maxPrice,
			String keyword) { //상품 리스트 셀렉트
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("page", page);
		hm.put("caidx", caidx);
		hm.put("minPrice", minPrice);
		hm.put("maxPrice", maxPrice);
		hm.put("keyword", keyword);
		
		
		ArrayList<ProductVo> alist = psm.selectProductSerchList(hm);
		return alist;
	}

	@Override
	public ProductVo selectProductOne(int pidx) { // 상품 콘텐츠 셀렉트
		
		ProductVo pv = psm.selectProductOne(pidx);
		
		return pv;
	}

	@Override
	public int insertSaleProduct(int midx,int caidx,String psubject,String pcontent,int pvol,int pmoney,int pfee,String pip) { // 상품 판매글 작성
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("midx", midx);
		hm.put("caidx", caidx);
		hm.put("psubject", psubject);
		hm.put("pcontent", pcontent);
		hm.put("pvol", pvol);
		hm.put("pmoney", pmoney);
		hm.put("pfee", pfee);
		hm.put("pip", pip);
		
		int exec = psm.insertSaleProduct(hm);
		
		return exec;
	}

	@Override
	public int insertShoppingCart(int pidx,int pvol,int midx) { // 장바구니에 추가
		
		int exe = psm.checkShoppingCart(pidx, midx);
		
		if(exe==0) {
		int exec = psm.insertShoppingCart(pidx,pvol,midx);
		
		return exec;
		}
		return 0;
	}

	@Override
	public String insertOrder() { // 주문내역 생성
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertPayment() { // 지불 정보 생성
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatePayment() { // 결제완료 업데이트
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deletePayment() { // 기간 2일 이후 동안 미결제시 지불정보 삭제
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<PaymentSaleDTO> selectSalesHistoryList(int midx,int page) {
		
		ArrayList<PaymentSaleDTO> alist=psm.selectSalesHistoryList(midx,page);
		System.out.println("임플리먼트 세일즈 :"+alist);
		
		return alist; // 판매내역 리스트
		
	}

	@Override
	public String selectPaymentHistoryList() { // 구매내역 리스트
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectOrderOne() { // 주문 콘텐츠
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectProductSimilarList() { // 비슷한 상품 리스트
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatePaymentConfirmation() { // 구매확정 업데이트
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatePaymentCancle() { // 구매취소
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSalesHistory(int pidx) { // 판매 게시글 삭제

		psm.deleteSalesHistory(pidx);
		
		
	}

	@Override
	public int updateDelivery(int caidx,int dwaybill,int oidx) { // 운송장 번호 저장
		
		System.out.println("운송번호 저장 임플리먼트 입니다.");
		HashMap<String, Object> hm =new HashMap<String, Object>();
				hm.put("caidx", caidx);
				hm.put("dwaybill", dwaybill);
				hm.put("oidx", oidx);
				System.out.println("운송번호 저장 임플리먼트 해쉬맵 저장입니다.");
				int exec = psm.updateDelivery(hm);
				System.out.println("운송번호 저장 임플리먼트 exec 작동합니다.");
		
		return exec;
	}

	@Override
	public String selectPriceSort() { // 가격 정렬
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int selectHistoryTotal(int midx) {
		int tcount = psm.selectHistoryTotal(midx);
		return tcount;
	}
	
	
	
}
