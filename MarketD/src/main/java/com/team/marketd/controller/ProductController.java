package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.marketd.domain.DeliveryVo;
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
	

	@RequestMapping(value = "/Product/{page}/{caidx}/{minPrice}/{maxPrice}/{keyword}/ProductListTotal.dobby", 
			produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public int productListTotal(@PathVariable("page") int page,			//상품리스트 총갯수
								@PathVariable("caidx") int caidx,
								@PathVariable("minPrice") int minPrice,
								@PathVariable("maxPrice") int maxPrice,
								@PathVariable("keyword") String keyword) {
		if(keyword.equals("empty")) keyword="";
		
		int tcount = ps.selectProductListTotal(page,caidx,minPrice,maxPrice,keyword);
		return tcount;
	}
	
	@RequestMapping(value = "/Product/ProductList.dobby")
	public String productList(@ModelAttribute("caidx")int caidx,		//상품 검색 리스트 이동
							@ModelAttribute("minPrice")int minPrice,
							@ModelAttribute("maxPrice")int maxPrice,
							@ModelAttribute("keyword")String keyword)
							{ 
		
		

		return "product/productList";
	}

	@RequestMapping(value = "/Product/{page}/{caidx}/{minPrice}/{maxPrice}/{keyword}/ProductSerchList.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ArrayList<ProductVo> productSerchList(SearchCriteria scri,		//상품 검색 리스트
							@PathVariable("page") int page,
							@PathVariable("caidx") int caidx,
							@PathVariable("minPrice") int minPrice,
							@PathVariable("maxPrice") int maxPrice,
							@PathVariable(value = "keyword", required=false) String keyword) { 
		
		
		if(keyword==null)keyword="";
		if(keyword.equals("empty"))keyword="";
		
				scri.setPage(page);
				scri.setKeyword(keyword);
				scri.setCategory(caidx);
				scri.setMinPrice(minPrice);
				scri.setMaxPrice(maxPrice);
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
			@RequestParam("pmoney") int pmoney, @RequestParam("pfee") int pfee,HttpSession session) { 
		
		int midx = (int) session.getAttribute("midx");
		String pip = null;

		try {
			pip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		
		ps.insertSaleProduct(midx, caidx, psubject, pcontent, pvol, pmoney, pfee, pip);

		return "product/productSaleWriteComplete";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteComplete.dobby")
	public String productSaleWriteComplete() { // 판매글 작성 완료 페이지 이동

		return "product/productSaleWriteComplete";
	}
	
	public String productImageUpload() { // 이미지 업로드

		return null;
	}

	@RequestMapping("product/productPayment.dobby")
	public String productPayment(Model model,@RequestParam("pidx")int pidx,
								@RequestParam("ovol")int ovol) { // 결제페이지 이동
		
		ProductVo pv = ps.selectProductOne(pidx);
		
		pv.setOvol(ovol);
		
		model.addAttribute("pv",pv);
		return "product/productPayment";
	}
	@RequestMapping("product/productPaymentAction.dobby")
	public String productPaymentAction(@RequestParam("drecipt")String drecipt,@RequestParam("dtell")String dtell,
								    	@RequestParam("daddr")String daddr,@RequestParam("ddetails")String ddetails,
										@RequestParam("dmemo")String dmemo,@RequestParam("paname")String paname,
										@RequestParam("pidx")int pidx,@RequestParam("ovol")int ovol,
										@RequestParam("omoney")int omoney,
										HttpSession session) { // 결제정보 저장
		
		
		
		HashMap<String, Object> hm =new HashMap<String, Object>();
		
		int midx = (int) session.getAttribute("midx");
		String oid = UUID.randomUUID().toString().replace("-", "");
		String oip = null;

		try {
			oip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		hm.put("drecipt", drecipt);
		hm.put("dtell", dtell);
		hm.put("daddr", daddr);
		hm.put("ddetails", ddetails);
		hm.put("dmemo", dmemo);
		hm.put("paname", paname);
		hm.put("oid", oid);
		hm.put("pidx", pidx);
		hm.put("midx", midx);
		hm.put("ovol", ovol);
		hm.put("oip", oip);
		hm.put("omoney", omoney);
		
		ps.insertPay(hm);
		
		
		return "product/productPaymentComplete";
	}

	@RequestMapping(value = "/Product/ProductPaymentComplete.dobby")
	public String productPaymentComplete() { // 결제완료 페이지로 이동

		return "product/productPaymentComplete";
	}

	@RequestMapping(value = "/Product/ProductSalesHistory.dobby")
	public String productSalesHistory(HttpSession session,Model model, SearchCriteria scri,PageMaker pm,
									@RequestParam(value="page",defaultValue="1")int page) { // 판매리스트 페이지 이동
		
		int midx = (int) session.getAttribute("midx");
		String division = "판매";
		
		scri.setPage(page);
		
		ArrayList<PaymentSaleDTO> alist = ps.selectSalesHistoryList( midx, page);
		int tcount = ps.selectHistoryTotal(midx,division);
		
		pm.setScri(scri);
		pm.setTotalCount(tcount);
		
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);
		
		return "product/productSalesHistory";
	}
	
	@RequestMapping(value = "/Product/ProductDeleteSalesHistory.dobby")
	public String productDeleteSalesHistory(@RequestParam("pidx") int pidx) { // 판매내역 삭제
		
		ps.deleteSalesHistory(pidx);
		
		return "redirect:/Product/ProductSalesHistory.dobby";
	}

	@RequestMapping(value = "/Product/ProductPaymentHistory.dobby")
	public String productPaymentHistory(Model model,HttpSession session,
			SearchCriteria scri,PageMaker pm,@RequestParam(value="page",defaultValue="1")int page) {
		
		int midx = (int) session.getAttribute("midx");
		
		scri.setPage(page);
		
	ArrayList<PaymentSaleDTO> alist = ps.selectPaymentHistoryList(midx,page);//midx
	
	String division = "구매";
	
	int tcount = ps.selectHistoryTotal(midx,division);
				
				pm.setScri(scri);
				pm.setTotalCount(tcount);
				
				
				model.addAttribute("alist", alist);
				model.addAttribute("pm", pm);

		return "product/productPaymentHistory";
	}
	
	@RequestMapping(value = "/Product/ProductPaymentCancle.dobby")
	public String productPaymentCancle(@RequestParam(value="pidx")int pidx,
										@RequestParam(value="oidx")int oidx,
										@RequestParam(value="oid")String oid) { // 구매취소
		
		ps.updatePaymentCancle( pidx, oidx, oid);

		return "redirect:/Product/ProductPaymentHistory.dobby";
	}
	
	@RequestMapping(value = "/Product/ProductPaymentConfirmation.dobby")
	public String productPaymentConfirmation(@RequestParam(value="oidx")int oidx) { // 구매확정
		
		ps.updatePaymentConfirmation(oidx);
		
		return "redirect:/Product/ProductPaymentHistory.dobby";
	}

	public String productOrderList() { // 주문요청 리스트 페이지 이동

		return null;
	}

	public String productOrderContent() { // 주문정보 콘텐츠

		return null;
	}

	@RequestMapping(value = "/Product/ProductStartDelivery.dobby")
	public String productStartDelivery(@ModelAttribute("oidx")int oidx,Model model) { // 배송시작 페이지 이동
		
		DeliveryVo dv = ps.selectDelivery(oidx);
		
		model.addAttribute("dv", dv);
		
		return "product/startDelivery";
	}

	@RequestMapping(value = "/Product/ProductStartDeliveryAction.dobby")
	public String productStartDeliveryAction(@RequestParam("caidx")int caidx,
			@RequestParam("dwaybill")int dwaybill, @RequestParam("oidx")int oidx) { // 배송정보 저장
		
		ps.updateDelivery(caidx,dwaybill,oidx);
		
		return "redirect:/Product/ProductSalesHistory.dobby";//pidx하드코딩 바꿀것
	}

	public String productDateSerchList() { // 날자검색

		return null;
	}

	public String productPriceSort() { // 가격정렬(?)

		return null;
	}
	
	@RequestMapping(value = "/Product/ProductPlusShoppingCart.dobby")
	public String productPlusShoppingCart(@RequestParam("pidx") int pidx,HttpSession session
										 ,@RequestParam("pvol") int pvol) { // 쇼핑카트에 상품 추가
		
		int midx = (int) session.getAttribute("midx");
		
		int exec = ps.insertShoppingCart(pidx,pvol,midx);
		if(exec==0) {
		return "redirect:/Product/ProductContent.dobby?pidx="+pidx;
		}
		return "redirect:/Product/ProductContent.dobby?pidx="+pidx;
	}

}
