package com.team.marketd.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.ProductVo;

public interface ProductService_Mapper {
	
	public ArrayList<ProductVo> selectNewProductList(int page);
	public ArrayList<ProductVo> selectProductSerchList(HashMap<String,Object> hm);
	public ProductVo selectProductOne(int pidx);
	public String insertSaleProduct(int midx,int caidx,String psubject,String pcontent,int pvol,int pmoney,int pfee);
	public int selectProductListTotal(String Keyword);
	public int insertShoppingCart(int pidx,int pvol,int midx);
	public int checkShoppingCart(int pidx,int midx);
	public String insertOrder();
	public String insertPayment();
	public String updatePayment();
	public String deletePayment();
	public String selectSalesHistoryList();
	public String selectPaymentHistoryList();
	public String selectOrderOne();
	public String selectProductSimilarList();
	public String updateProductconfirmation();
	public String updateProductCancle();
	public String deleteSalesHistory();
	public String updateDelivery();
	public String selectPriceSort();
	public int insertSaleProduct(HashMap<String, Object> hm);

}
