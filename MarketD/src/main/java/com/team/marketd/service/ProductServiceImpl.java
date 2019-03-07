package com.team.marketd.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int selectProductListTotal(int page,int caidx,int minPrice,int maxPrice,String keyword) { // ��ǰ ����Ʈ ���հ�(����¡)
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
	public ArrayList<ProductVo> selectNewProductList(int page) { // �ֽ� ��ǰ ����Ʈ ����Ʈ
		
		ArrayList<ProductVo> alist = psm.selectNewProductList(page);
		
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> selectProductList(int page, int caidx, int minPrice, int maxPrice,
			String keyword) { //��ǰ ����Ʈ ����Ʈ
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
	public ArrayList<PaymentSaleDTO> selectSalesHistoryList(int midx,int page) {
		
		ArrayList<PaymentSaleDTO> alist=psm.selectSalesHistoryList(midx,page);
		System.out.println("���ø���Ʈ ������ :"+alist);
		
		return alist; // �Ǹų��� ����Ʈ
		
	}

	@Override
	public ArrayList<PaymentSaleDTO> selectPaymentHistoryList(int midx,int page) { // 占쏙옙占신놂옙占쏙옙 占쏙옙占쏙옙트
		
		ArrayList<PaymentSaleDTO> exec = psm.selectPaymentHistoryList(midx,page);
		
		return exec;
	}

	@Override
	public String selectOrderOne() { // �ֹ� ������
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updatePaymentConfirmation(int oidx) { // ����Ȯ�� ������Ʈ
		
		psm.updateProductconfirmation(oidx);

	}

	@Override
	public String updatePaymentCancle() { // �������
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSalesHistory(int pidx) { // �Ǹ� �Խñ� ����
		System.out.println("임플리 삭제입장");
		psm.deleteSalesHistory(pidx);
		System.out.println("임플리 삭제퇴장");
		
	}

	@Override
	public int updateDelivery(int caidx,int dwaybill,int oidx) { // ����� ��ȣ ����
		
		System.out.println("��۹�ȣ ���� ���ø���Ʈ �Դϴ�.");
		HashMap<String, Object> hm =new HashMap<String, Object>();
				hm.put("caidx", caidx);
				hm.put("dwaybill", dwaybill);
				hm.put("oidx", oidx);
				System.out.println("��۹�ȣ ���� ���ø���Ʈ �ؽ��� �����Դϴ�.");
				int exec = psm.updateDelivery(hm);
				System.out.println("��۹�ȣ ���� ���ø���Ʈ exec �۵��մϴ�.");
		
		return exec;
	}

	@Override
	public String selectPriceSort() { // ���� ����
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int selectHistoryTotal(int midx) {
		int tcount = psm.selectHistoryTotal(midx);
		return tcount;
	}



	@Transactional
	@Override
	public String insertPay() {
		
			/*psm.insertOrder();
			psm.insertPayment();
			psm.insertDelivery();*/
		
		
			return null;
		}
	
	
	}
	
	
	

