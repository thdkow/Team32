package com.team.marketd.persistence;


public interface ProductService_Mapper {
	
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
	public String updateProductconfirmation();
	public String updateProductCancle();
	public String deleteSalesHistory();
	public String updateDelivery();
	public String selectPriceSort();

}
