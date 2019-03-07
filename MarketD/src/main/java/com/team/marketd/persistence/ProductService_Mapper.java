package com.team.marketd.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ProductVo;

public interface ProductService_Mapper {
	
	public ArrayList<ProductVo> selectNewProductList(int page);
	public ArrayList<ProductVo> selectProductSerchList(HashMap<String,Object> hm);
	public ProductVo selectProductOne(int pidx);
	public int selectProductListTotal(HashMap<String, Object> hm);
	public int selectHistoryTotal(int midx);
	public int insertShoppingCart(int pidx,int pvol,int midx);
	public int checkShoppingCart(int pidx,int midx);
	public String insertOrder();
	public String insertPayment();
	public String insertDelivery();
	public String updatePayment();
	public String deletePayment();
	public ArrayList<PaymentSaleDTO> selectSalesHistoryList(int midx,int page);
	public ArrayList<PaymentSaleDTO> selectPaymentHistoryList(int midx,int page);
	public String selectOrderOne();
	public String selectProductSimilarList();
	public void updateProductconfirmation(int oidx);
	public String updateProductCancle();
	public void deleteSalesHistory(int pidx);
	public int updateDelivery(HashMap<String, Object> hm);
	public String selectPriceSort();
	public int insertSaleProduct(HashMap<String, Object> hm);

}
