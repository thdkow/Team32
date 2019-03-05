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
			@PathVariable("page") int page) { // �ֽ� ��ǰ ����Ʈ
		
		scri.setPage(page);

		ArrayList<ProductVo> alist = ps.selectNewProductList(page);

		return alist;
	}
	

	@RequestMapping(value = "/Product/{page}/{category}/{minPrice}/{maxPrice}/{keyword}/ProductListTotal.dobby", 
			produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public int productListTotal(@PathVariable("page") int page,
								@PathVariable("category") int caidx,
								@PathVariable("minPrice") int minPrice,
								@PathVariable("maxPrice") int maxPrice,
								@PathVariable("keyword") String keyword) {
		if(keyword.equals("empty")) keyword="";
		
		int tcount = ps.selectProductListTotal(page,caidx,minPrice,maxPrice,keyword);
		return tcount;
	}
	
	@RequestMapping(value = "/Product/ProductList.dobby")
	public String productList(@ModelAttribute("category")int category,
							@ModelAttribute("minPrice")int minPrice,
							@ModelAttribute("maxPrice")int maxPrice,
							@ModelAttribute("keyword")String keyword)
							{ // �Ǹű� �ۼ� ������ �̵�
		
		

		return "product/productList";
	}

	@RequestMapping(value = "/Product/{page}/{category}/{minPrice}/{maxPrice}/{keyword}/ProductSerchList.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ArrayList<ProductVo> productSerchList(SearchCriteria scri,
							@PathVariable("page") int page,
							@PathVariable("category") int caidx,
							@PathVariable("minPrice") int minPrice,
							@PathVariable("maxPrice") int maxPrice,
							@PathVariable("keyword") String keyword) { // ��ǰ ����Ʈ ������ �̵�
		
		if(keyword.equals("empty"))keyword="";
		System.out.println("Ű����"+keyword+"����");
				scri.setPage(page);
				scri.setKeyword(keyword);
				ArrayList<ProductVo> alist = ps.selectProductList(page,caidx,minPrice,maxPrice,keyword);
				
		return alist;
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
	public String productSalesHistory(@RequestParam(value="midx")int midx,Model model, SearchCriteria scri,PageMaker pm,
									@RequestParam(value="page")int page) { // �Ǹų��� ������ �̵�
		
		
		scri.setPage(page);
		
		ArrayList<PaymentSaleDTO> alist = ps.selectSalesHistoryList( midx, page);
		int tcount = ps.selectHistoryTotal(midx);
		
		pm.setScri(scri);
		pm.setTotalCount(tcount);
		
		
		model.addAttribute("alist", alist);
		model.addAttribute("pm", pm);
		
		
		
		return "product/productSaleHistory";
	}
	
	@RequestMapping(value = "/Product/{pidx}/productDeleteSalesHistory.dobby")
	public String productDeleteSalesHistory(@PathVariable("pidx") int pidx) { // �Ǹų��� �Խñ� ����
		
		ps.deleteSalesHistory(pidx);
		
		return "redirect:/Product/ProductList.dobby";
	}

	public String productPaymentHistory() { // ���ų��� ������ �̵�

		return null;
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

	@RequestMapping(value = "/Product/ProductStartDelivery.dobby")
	public String productStartDelivery() { // ��۽��� ������ �̵�

		return "product/startDelivery";
	}

	@RequestMapping(value = "/Product/ProductStartDeliveryAction.dobby")
	public String productStartDeliveryAction(@RequestParam("caidx")int caidx,
			@RequestParam("dwaybill")int dwaybill, @RequestParam("oidx")int oidx) { // ������ȣ ����
		
		System.out.println("��۹�ȣ ���� ������ ���� �մϴ�.");
		ps.updateDelivery(caidx,dwaybill,oidx);
		System.out.println("��۹�ȣ ���� ������ �������ϴ� ���ϰ����� �̵��մϴ�.");
		
		return "redirect:/Product/ProductContent.dobby?pidx=28";//�Ǹų������� �̵�
	}

	public String productDateSerchList() { // ���ں��� �˻�

		return null;
	}

	public String productPriceSort() { // ���� ����

		return null;
	}
	
	@RequestMapping(value = "/Product/ProductPlusShoppingCart.dobby")
	public String productPlusShoppingCart(@RequestParam("pvol") int pvol) { // ��ٱ��� �߰�
		
		int midx = 2;//����� midx
		int pidx = 2;//�Խñ��� pidx
		
		int exec = ps.insertShoppingCart(pidx,pvol,midx);
		if(exec==0) {
		return "redirect:/Product/ProductSaleWrite.dobby";
		}
		return "index";
	}

}
