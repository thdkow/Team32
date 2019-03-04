package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.marketd.domain.PageMaker;
import com.team.marketd.domain.ProductVo;
import com.team.marketd.domain.SearchCriteria;
import com.team.marketd.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService ps;

	@RequestMapping(value = "/Product/{page}/ProductNewList.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ArrayList<ProductVo> productNewList(SearchCriteria scri, Model model, PageMaker pm,
			@PathVariable("page") int page) { // 최신 상품 리스트
		scri.setPage(page);
System.out.println("페이지"+page);
		ArrayList<ProductVo> alist = ps.selectNewProductList(page);

		return alist;
	}
	

	@RequestMapping(value = "/Product/{Keyword}/ProductListTotal.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public int productListTotal(@PathVariable("Keyword") String Keyword) {
		if(Keyword.equals("empty")) { Keyword="";}
		
		
		System.out.println("토탈"+Keyword);
		int tcount = ps.selectProductListTotal(Keyword);
		System.out.println(tcount);
		return tcount;
	}
	
	@RequestMapping(value = "/Product/ProductList.dobby")
	public String productList() { // 판매글 작성 페이지 이동

		return "product/productList";
	}

	@RequestMapping(value = "/Product/{page}/{caidx}/{minPrice}/{maxPrice}/{Keyword}/ProductSerchList.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public String productSerchList(SearchCriteria scri,
							@PathVariable("page") int page,
							@PathVariable("caidx") int caidx,
							@PathVariable("minPrice") int minPrice,
							@PathVariable("maxPrice") int maxPrice,
							@PathVariable("Keyword") String Keyword) { // 상품 리스트 페이지 이동
		
		if(Keyword.equals("empty"))Keyword="";
		
				scri.setPage(page);
				scri.setKeyword(Keyword);
				ArrayList<ProductVo> alist = ps.selectProductList(page,caidx,minPrice,maxPrice,Keyword);
				
		return "product/productList";
	}

	@RequestMapping(value = "/Product/ProductContent.dobby")
	public String productContent(@RequestParam("pidx") int pidx,
								Model model) { // 상품 페이지

		ProductVo pv = ps.selectProductOne(pidx); // 조회수는 나중에 추가 pidx 임시로 하드코딩

		model.addAttribute("pv", pv);

		return "product/productContent";
	}

	@RequestMapping(value = "/Product/ProductWrite.dobby")
	public String productSaleWrite() { // 판매글 작성 페이지 이동

		return "product/productWrite";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteAction.dobby")
	public String productSaleWriteAction(@RequestParam("psubject") String psubject,
			@RequestParam("pcontent") String pcontent, @RequestParam("caidx") int caidx, @RequestParam("pvol") int pvol,
			@RequestParam("pmoney") int pmoney, @RequestParam("pfee") int pfee, @RequestParam("midx") int midx) { // 판매글
																													// 작성
																													// 저장

		String pip = null;

		try {
			pip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		ps.insertSaleProduct(midx, caidx, psubject, pcontent, pvol, pmoney, pfee, pip);

		return "index";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteComplete.dobby")
	public String productSaleWriteComplete() { // 판매글 작성 완료 페이지 이동

		return "product/productSaleWriteComplete";
	}
	
	public String productImageUpload() { // 이미지 업로드

		return null;
	}

	public String productInsertCart() { // 장바구니 추가

		return null;
	}

	public String productPayment() { // 구매하기, 주문 결제

		return null;
	}

	public String productPaymentAction() { // 구매하기, 주문결제 작동

		return null;
	}

	@RequestMapping(value = "/Product/ProductPaymentComplete.dobby")
	public String productPaymentComplete() { // 구매완료 페이지 이동

		return "product/productPaymentComplete";
	}

	@RequestMapping(value = "/Product/ProductSalesHistory.dobby")
	public String productSalesHistory() { // 판매내역 페이지 이동

		return "product/productSalesHistory";
	}

	public String productDeleteSalesHistory() { // 판매내역 게시글 삭제

		return null;
	}

	public String productPaymentHistory() { // 구매내역 페이지 이동

		return null;
	}

	public String productPaymentCancle() { // 구매 취소

		return null;
	}

	public String productPaymentConfirmation() { // 구매확정

		return null;
	}

	public String productOrderList() { // 주문 리스트 페이지 이동

		return null;
	}

	public String productOrderContent() { // 주문 페이지 이동

		return null;
	}

	public String productStartDelivery() { // 배송시작 페이지 이동

		return null;
	}

	public String productStartDeliveryAction() { // 운송장번호 저장

		return null;
	}

	public String productDateSerchList() { // 날자별로 검색

		return null;
	}

	public String productPriceSort() { // 가격 정렬

		return null;
	}
	
	@RequestMapping(value = "/Product/ProductPlusShoppingCart.dobby")
	public String productPlusShoppingCart(@RequestParam("pvol") int pvol) { // 가격 정렬
		
		int midx = 2;//사용자 midx
		int pidx = 2;//게시글의 pidx
		
		int exec = ps.insertShoppingCart(pidx,pvol,midx);
		if(exec==0) {
		return "redirect:/Product/ProductSaleWrite.dobby";
		}
		return "index";
	}

}
