package com.team.marketd.service;

import java.util.ArrayList;

import com.team.marketd.domain.ProductVo;

public interface ProductService {
	
	public ArrayList<ProductVo> selectNewProductList(int page);
	public ArrayList<ProductVo> selectProductList(int page,int caidx,int minPrice,int maxPrice,String Keyword);
	public ProductVo selectProductOne(int pidx);
	public int insertSaleProduct(int midx,int caidx,String psubject,String pcontent,int pvol,int pmoney,int pfee,String pip);
	public int selectProductListTotal(String Keyword);
	public int insertShoppingCart(int pidx,int pvol,int midx);
	public String insertOrder();
	public String insertPayment();
	public String updatePayment();
	public String deletePayment();
	public String selectSalesHistoryList();
	public String selectPaymentHistoryList();
	public String selectOrderOne();
	public String selectProductSimilarList();
	public String updatePaymentConfirmation();
	public String updatePaymentCancle();
	public String deleteSalesHistory();
	public String updateDelivery();
	public String selectPriceSort();
	
	
}
