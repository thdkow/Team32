package com.team.marketd.service;


public interface ProductService {
	
	public String selectNewProductList();
	public String selectProductList();
	public String selectProductOne();
	public String insertSaleProduct();
	public String selectProductListTotal();
	public String insertShoppingCart();
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
