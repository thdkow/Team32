package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.marketd.domain.PageMaker;
import com.team.marketd.domain.PaymentSaleDTO;
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
			@PathVariable("page") int page) { // 최신상품리스트
		
		scri.setPage(page);

		ArrayList<ProductVo> alist = ps.selectNewProductList(page);

		return alist;
	}
	

	@RequestMapping(value = "/Product/{page}/{category}/{minPrice}/{maxPrice}/{keyword}/ProductListTotal.dobby", 
			produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public int productListTotal(@PathVariable("page") int page,			//상품리스트 총갯수
								@PathVariable("category") int caidx,
								@PathVariable("minPrice") int minPrice,
								@PathVariable("maxPrice") int maxPrice,
								@PathVariable("keyword") String keyword) {
		if(keyword.equals("empty")) keyword="";
		
		int tcount = ps.selectProductListTotal(page,caidx,minPrice,maxPrice,keyword);
		return tcount;
	}
	
	@RequestMapping(value = "/Product/ProductList.dobby")
	public String productList(@ModelAttribute("category")int category,		//상품 검색 리스트 이동
							@ModelAttribute("minPrice")int minPrice,
							@ModelAttribute("maxPrice")int maxPrice,
							@ModelAttribute("keyword")String keyword)
							{ 
		
		

		return "product/productList";
	}

	@RequestMapping(value = "/Product/{page}/{category}/{minPrice}/{maxPrice}/{keyword}/ProductSerchList.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ArrayList<ProductVo> productSerchList(SearchCriteria scri,		//상품 검색 리스트
							@PathVariable("page") int page,
							@PathVariable("category") int caidx,
							@PathVariable("minPrice") int minPrice,
							@PathVariable("maxPrice") int maxPrice,
							@PathVariable(value = "keyword", required=false) String keyword) { 
		
		
		if(keyword==null)keyword="";
		if(keyword.equals("empty"))keyword="";
		System.out.println("검색"+keyword+"성공");
				scri.setPage(page);
				scri.setKeyword(keyword);
				ArrayList<ProductVo> alist = ps.selectProductList(page,caidx,minPrice,maxPrice,keyword);
				
		return alist;
	}

	@RequestMapping(value = "/Product/ProductContent.dobby")
	public String productContent(@RequestParam("pidx") int pidx,
								Model model) { //상품 콘텐츠

		
		ProductVo pv = ps.selectProductOne(pidx);

		model.addAttribute("pv", pv);

		return "product/productContent";
	}

	@RequestMapping(value = "/Product/ProductWrite.dobby")
	public String productSaleWrite() { // 판매글쓰기 이동

		return "product/productWrite";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteAction.dobby")
	public String productSaleWriteAction(@RequestParam("psubject") String psubject,		//판매글 저장
			@RequestParam("pcontent") String pcontent, @RequestParam("caidx") int caidx, @RequestParam("pvol") int pvol,
			@RequestParam("pmoney") int pmoney, @RequestParam("pfee") int pfee, @RequestParam("midx") int midx) { 

		String pip = null;

		try {
			pip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		
		ps.insertSaleProduct(midx, caidx, psubject, pcontent, pvol, pmoney, pfee, pip);

		return "productSaleWriteComplete";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteComplete.dobby")
	public String productSaleWriteComplete() { // 판매글 작성 완료 페이지 이동

		return "product/productSaleWriteComplete";
	}
	
	public String productImageUpload() { // 이미지 업로드

		return null;
	}

	@RequestMapping("product/productPayment.dobby")
	public String productPayment(Model model) { // 결제페이지 이동
		int a = 2;
		ProductVo pv = ps.selectProductOne(a);
		model.addAttribute("pv",pv);
		return "product/orderContent";
	}
	@RequestMapping("product/productPaymentAction.dobby")
	public String productPaymentAction(@RequestParam("Recipient")String Recipient,@RequestParam("mkakao")String mkakao
			,@RequestParam("phone")String phone,@RequestParam("address")String address,@RequestParam("address2")String address2,
			@RequestParam("delivery")String delivery,@RequestParam("deposit")String deposit) { // 결제정보 저장
		
		
		return "product/orderComplete";
	}

	@RequestMapping(value = "/Product/ProductPaymentComplete.dobby")
	public String productPaymentComplete() { // 결제완료 페이지로 이동

		return "product/productPaymentComplete";
	}

	@RequestMapping(value = "/Product/ProductSalesHistory.dobby")
	public String productSalesHistory(@RequestParam(value="midx")int midx,Model model, SearchCriteria scri,PageMaker pm,
									@RequestParam(value="page",defaultValue="1")int page) { // 판매리스트 페이지 이동
		
		
		scri.setPage(page);
		
		ArrayList<PaymentSaleDTO> alist = ps.selectSalesHistoryList( midx, page);
		int tcount = ps.selectHistoryTotal(midx);
		
		pm.setScri(scri);
		pm.setTotalCount(tcount);
		
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);
		
		
		
		return "product/productSalesHistory";
	}
	
	@RequestMapping(value = "/Product/productDeleteSalesHistory.dobby")
	public String productDeleteSalesHistory(@RequestParam("pidx") int pidx) { // 판매내역 삭제
		
		ps.deleteSalesHistory(pidx);
		
		return "redirect:/Product/ProductList.dobby";
	}

	@RequestMapping(value = "/Product/productPaymentHistory.dobby")
	public String productPaymentHistory(Model model,@RequestParam(value="midx",defaultValue="2")int midx,
			SearchCriteria scri,PageMaker pm,@RequestParam(value="page",defaultValue="1")int page) {
	ArrayList<PaymentSaleDTO> alist = ps.selectPaymentHistoryList(midx,page);//midx
	
				model.addAttribute("alist",alist);

		return "product/productPayment";
	}

	public String productPaymentCancle() { // 구매취소

		return null;
	}
	@RequestMapping(value = "/Product/ProductPaymentConfirmation.dobby")
	public String productPaymentConfirmation(int oidx) { // 구매확정
		
		ps.updatePaymentConfirmation(oidx);
		
		return "product/productPaymentHistory";
	}

	public String productOrderList() { // 주문요청 리스트 페이지 이동

		return null;
	}

	public String productOrderContent() { // 주문정보 콘텐츠

		return null;
	}

	@RequestMapping(value = "/Product/ProductStartDelivery.dobby")
	public String productStartDelivery() { // 배송시작 페이지 이동

		return "product/startDelivery";
	}

	@RequestMapping(value = "/Product/ProductStartDeliveryAction.dobby")
	public String productStartDeliveryAction(@RequestParam("caidx")int caidx,
			@RequestParam("dwaybill")int dwaybill, @RequestParam("oidx")int oidx) { // 배송정보 저장
		
		ps.updateDelivery(caidx,dwaybill,oidx);
		
		return "redirect:/Product/ProductContent.dobby?pidx=28";//pidx하드코딩 바꿀것
	}

	public String productDateSerchList() { // 날자검색

		return null;
	}

	public String productPriceSort() { // 가격정렬(?)

		return null;
	}
	
	@RequestMapping(value = "/Product/ProductPlusShoppingCart.dobby")
	public String productPlusShoppingCart(@RequestParam("pvol") int pvol) { // 쇼핑카트에 상품 추가
		
		int midx = 2;// midx바꿀것
		int pidx = 2;// pidx바꿀것
		
		int exec = ps.insertShoppingCart(pidx,pvol,midx);
		if(exec==0) {
		return "redirect:/Product/ProductSaleWrite.dobby";
		}
		return "index";
	}

}
