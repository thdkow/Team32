package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
			@PathVariable("page") int page) { // �ֽ� ��ǰ ����Ʈ
		scri.setPage(page);
System.out.println("������"+page);
		ArrayList<ProductVo> alist = ps.selectNewProductList(page);

		return alist;
	}
	

	@RequestMapping(value = "/Product/{Keyword}/ProductListTotal.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public int productListTotal(@PathVariable("Keyword") String Keyword) {
		if(Keyword.equals("empty")) { Keyword="";}
		
		
		System.out.println("��Ż"+Keyword);
		int tcount = ps.selectProductListTotal(Keyword);
		System.out.println(tcount);
		return tcount;
	}
	
	@RequestMapping(value = "/Product/ProductList.dobby")
	public String productList() { // �Ǹű� �ۼ� ������ �̵�

		return "product/productList";
	}

	@RequestMapping(value = "/Product/{page}/{caidx}/{minPrice}/{maxPrice}/{Keyword}/ProductSerchList.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public String productSerchList(SearchCriteria scri,
							@PathVariable("page") int page,
							@PathVariable("caidx") int caidx,
							@PathVariable("minPrice") int minPrice,
							@PathVariable("maxPrice") int maxPrice,
							@PathVariable("Keyword") String Keyword) { // ��ǰ ����Ʈ ������ �̵�
		
		if(Keyword.equals("empty"))Keyword="";
		
				scri.setPage(page);
				scri.setKeyword(Keyword);
				ArrayList<ProductVo> alist = ps.selectProductList(page,caidx,minPrice,maxPrice,Keyword);
				
		return "product/productList";
	}

	@RequestMapping(value = "/Product/ProductContent.dobby")
	public String productContent(@RequestParam("pidx") int pidx,
								Model model) { // ��ǰ ������

		ProductVo pv = ps.selectProductOne(pidx); // ��ȸ���� ���߿� �߰� pidx �ӽ÷� �ϵ��ڵ�

		model.addAttribute("pv", pv);

		return "product/productContent";
	}

	@RequestMapping(value = "/Product/ProductWrite.dobby")
	public String productSaleWrite() { // �Ǹű� �ۼ� ������ �̵�

		return "product/productWrite";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteAction.dobby")
	public String productSaleWriteAction(@RequestParam("psubject") String psubject,
			@RequestParam("pcontent") String pcontent, @RequestParam("caidx") int caidx, @RequestParam("pvol") int pvol,
			@RequestParam("pmoney") int pmoney, @RequestParam("pfee") int pfee, @RequestParam("midx") int midx) { // �Ǹű�
																													// �ۼ�
																													// ����

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
	public String productSaleWriteComplete() { // �Ǹű� �ۼ� �Ϸ� ������ �̵�

		return "product/productSaleWriteComplete";
	}
	
	public String productImageUpload() { // �̹��� ���ε�

		return null;
	}

	public String productInsertCart() { // ��ٱ��� �߰�

		return null;
	}

	public String productPayment() { // �����ϱ�, �ֹ� ����

		return null;
	}

	public String productPaymentAction() { // �����ϱ�, �ֹ����� �۵�

		return null;
	}

	@RequestMapping(value = "/Product/ProductPaymentComplete.dobby")
	public String productPaymentComplete() { // ���ſϷ� ������ �̵�

		return "product/productPaymentComplete";
	}

	@RequestMapping(value = "/Product/ProductSalesHistory.dobby")
	public String productSalesHistory() { // �Ǹų��� ������ �̵�

		return "product/productSalesHistory";
	}

	@RequestMapping(value = "/Product/productDeleteSalesHistory.dobby")
	public String productDeleteSalesHistory(@RequestParam("pidx")int pidx) { // �Ǹų��� �Խñ� ���� 

			ps.deleteSalesHistory(pidx);
		return "/Product/ProductList.dobby";
	}//판매글 삭제
	
	@RequestMapping(value = "/Product/productPaymentHistory.dobby")
	public String productPaymentHistory(Model model) {
	ArrayList<PaymentSaleDTO> alist = ps.selectPaymentHistoryList(2);//midx
					
				model.addAttribute("alist",alist);
	
		return "/product/productPaymentHistory";
	}

	public String productPaymentCancle() { // ���� ���

		return null;
	}

	public String productPaymentConfirmation() { // ����Ȯ��

		return null;
	}

	public String productOrderList() { // �ֹ� ����Ʈ ������ �̵�

		return null;
	} 

	public String productOrderContent() { // �ֹ� ������ �̵� 

		return null; 
	}
	@RequestMapping(value = "/Product/productStartDelivery.dobby")
	public String productStartDelivery() { // ��۽��� ������ �̵�
					
		return "nomapping";
	}//배송시작페이지 이동
	@RequestMapping(value = "/Product/productStartDeliveryAction.dobby")
	public String productStartDeliveryAction(@RequestParam("ddeliver")String ddeliver,
			@RequestParam("dwaybill")int dwaybill, @RequestParam("oidx")int oidx) { // ������ȣ ����
		System.out.println("운송번호 저장 페이지 시작 합니다.");
		ps.updateDelivery(ddeliver,dwaybill,oidx);
		System.out.println("운송번호 저장 페이지 끝났습니다 리턴값으로 이동합니다.");
		return "nomapping";
	}//운송번호 저장

	public String productDateSerchList() { // ���ں��� �˻�

		return null; 
	}

	public String productPriceSort() { // ���� ����

		return null;
	}
	
	@RequestMapping(value = "/Product/ProductPlusShoppingCart.dobby")
	public String productPlusShoppingCart(@RequestParam("pvol") int pvol) { // ���� ����
		
		int midx = 2;//����� midx
		int pidx = 2;//�Խñ��� pidx
		
		int exec = ps.insertShoppingCart(pidx,pvol,midx);
		if(exec==0) {
		return "redirect:/Product/ProductSaleWrite.dobby";
		}
		return "index";
	}

}
