package com.team.marketd.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int selectProductListTotal(String Keyword) { // ��ǰ ����Ʈ ���հ�(����¡)
		
		int tcount = psm.selectProductListTotal(Keyword);
		
		System.out.println("���� ��Ż"+tcount);
		
		return tcount;
	}
	
	@Override
	public ArrayList<ProductVo> selectNewProductList(int page) { // �ֽ� ��ǰ ����Ʈ ����Ʈ
		
		ArrayList<ProductVo> alist = psm.selectNewProductList(page);
		
		System.out.println("���ø� ��Ʈ"+page);
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> selectProductList(int page,int caidx,int minPrice,int maxPrice,String Keyword) { //��ǰ ����Ʈ ����Ʈ
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("page", page);
		hm.put("caidx", caidx);
		hm.put("minPrice", minPrice);
		hm.put("maxPrice", maxPrice);
		hm.put("Keyword", Keyword);
		
		
		ArrayList<ProductVo> alist = psm.selectProductSerchList(hm);
		return alist;
	}

	@Override
	public ProductVo selectProductOne(int pidx) { // ��ǰ ������ ����Ʈ
		
		ProductVo pv = psm.selectProductOne(pidx);
		
		return pv;
	}

	@Override
	public int insertSaleProduct(int midx,int caidx,String psubject,String pcontent,int pvol,int pmoney,int pfee,String pip) { // ��ǰ �Ǹű� �ۼ�
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
	public int insertShoppingCart(int pidx,int pvol,int midx) { // ��ٱ��Ͽ� �߰�
		
		int exe = psm.checkShoppingCart(pidx, midx);
		
		if(exe==0) {
		int exec = psm.insertShoppingCart(pidx,pvol,midx);
		
		return exec;
		}
		return 0;
	}

	@Override
	public String insertOrder() { // �ֹ����� ����
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertPayment() { // ���� ���� ����
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatePayment() { // �����Ϸ� ������Ʈ
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deletePayment() { // �Ⱓ 2�� ���� ���� �̰����� �������� ����
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectSalesHistoryList() { // �Ǹų��� ����Ʈ
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectPaymentHistoryList() { // ���ų��� ����Ʈ
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectOrderOne() { // �ֹ� ������
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectProductSimilarList() { // ����� ��ǰ ����Ʈ
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatePaymentConfirmation() { // ����Ȯ�� ������Ʈ
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatePaymentCancle() { // �������
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteSalesHistory() { // �Ǹ� �Խñ� ����
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateDelivery() { // ����� ��ȣ ����
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectPriceSort() { // ���� ����
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
