package com.team.marketd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.marketd.util.MediaUtils;
import com.team.marketd.util.UploadFileUtiles;
import com.team.marketd.domain.AttachFileDTO;
import com.team.marketd.domain.BoardAttachVo;
import com.team.marketd.domain.PageMaker;
import com.team.marketd.domain.PaymentSaleDTO;
import com.team.marketd.domain.ProductVo;
import com.team.marketd.domain.SearchCriteria;
import com.team.marketd.service.BoardAttachService;
import com.team.marketd.service.ProductService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Controller
public class ProductController {

	@Autowired
	ProductService ps;
	
	@Autowired
	BoardAttachService bas;
	
	@RequestMapping(value = "/Product/{page}/ProductNewList.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ArrayList<ProductVo> productNewList(SearchCriteria scri, Model model, PageMaker pm,
			@PathVariable("page") int page) {// 최신 상품 리스트
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
		pv.setAttachList(bas.findBybno(pidx));
		
		model.addAttribute("pv", pv);

		return "product/productContent";
	}

	@RequestMapping(value = "/Product/ProductWrite.dobby")
	public String productSaleWrite() { // 판매글 작성 페이지 이동

		return "product/productWrite";
	}

	@RequestMapping(value = "/Product/ProductSaleWriteAction.dobby")
	@ResponseBody
	public void productSaleWriteAction(@RequestParam("psubject") String psubject,
			@RequestParam("pcontent") String pcontent, @RequestParam("caidx") int caidx, @RequestParam("pvol") int pvol,
			@RequestParam("pmoney") int pmoney, @RequestParam("pfee") int pfee, @RequestParam("midx") int midx,
			@ModelAttribute BoardAttachVo bav,HttpServletResponse response) { 
				// 판매글																			
System.out.println(bav.getUuid()+"uuid \n"); System.out.println(bav.getFileName()+"fn \n");																		
System.out.println(bav.getUploadPath()+"up \n"); System.out.println(bav.getPidx()+"pidx \n");
		String pip = null;

		try {
			pip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		int result = ps.insertSaleProduct(midx, caidx, psubject, pcontent, pvol, pmoney, pfee, pip);
		
		if(result >0) {
			int pidx = bas.checkproduct(midx, caidx, psubject, pcontent, pvol, pmoney, pfee, pip);
			 System.out.println(pidx+"pidx값");
						 bav.setPidx(pidx);
						 System.out.println(bav+"bav값");
						bas.insert(bav);
				 //index페이지를 가는게 아니라 writeAction.dobby에서 머물면서 리턴 값을 출력함 나머지는 다 날아감
		}
		 try {
			response.sendRedirect("/index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
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

	@RequestMapping(value = "/Product/productDeleteSalesHistory.dobby")
	public String productDeleteSalesHistory(@RequestParam("pidx")int pidx) { // 판매내역 게시글 삭제

			ps.deleteSalesHistory(pidx);
		return "/Product/ProductList.dobby";
	}//판매글 삭제
	
	@RequestMapping(value = "/Product/productPaymentHistory.dobby")
	public String productPaymentHistory(Model model,@RequestParam(value="midx",defaultValue="2")int midx,
			SearchCriteria scri,PageMaker pm,@RequestParam(value="page",defaultValue="1")int page) {
	ArrayList<PaymentSaleDTO> alist = ps.selectPaymentHistoryList(midx,page);//midx
	// 구매내역 페이지 이동
				model.addAttribute("alist",alist);
//	System.out.println(alist+"프덕컨트롤ㄹ러");
		return "product/buyList";
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
	@RequestMapping(value = "/Product/productStartDelivery.dobby")
	public String productStartDelivery() { // 배송시작 페이지 이동
					
		return "nomapping";
	}//배송시작페이지 이동
	@RequestMapping(value = "/Product/productStartDeliveryAction.dobby")
	public String productStartDeliveryAction(@RequestParam("ddeliver")String ddeliver,
			@RequestParam("dwaybill")int dwaybill, @RequestParam("oidx")int oidx) { // ������ȣ ����
		// 운송장번호 저장
		System.out.println("운송번호 저장 페이지 시작 합니다.");
		ps.updateDelivery(ddeliver,dwaybill,oidx);
		System.out.println("운송번호 저장 페이지 끝났습니다 리턴값으로 이동합니다.");
		return "nomapping";
	}//운송번호 저장

	public String productDateSerchList() { // 날자별로 검색

		return null; 
	}

	public String productPriceSort() { // 가격 정렬

		return null;
	}
	
	@RequestMapping(value = "/Product/ProductPlusShoppingCart.dobby")
	public String productPlusShoppingCart(@RequestParam("pvol") int pvol) { // ���� ����
		
		int midx = 2;//사용자 midx
		int pidx = 2;//게시글의 pidx
		
		int exec = ps.insertShoppingCart(pidx,pvol,midx);
		if(exec==0) {
		return "redirect:/Product/ProductSaleWrite.dobby";
		}
		return "index";
	}
	
	/////////////파일업로드관련
		
		private String getFolder() {//년/월/일 폴더 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", File.separator);
			
		}
		
		private boolean checkImageType(File file) {
			try {
				String contentType = Files.probeContentType(file.toPath());
				return contentType.startsWith("image");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
			
		
		//Aajx 파일 업로드
		@PostMapping(value="/uploadAjaxAction.dobby",
					produces=MediaType.APPLICATION_JSON_UTF8_VALUE)//Ajax방식
		@ResponseBody
		public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
	System.out.println("upload ajax post...........");

				List<AttachFileDTO> list = new ArrayList<>();
				String uploadFolder = "C:\\upload";
			
				String uploadFolderPath = getFolder();
					//Make folder ------
				File uploadPath = new File(uploadFolder, getFolder());
	System.out.println("upload path: "+ uploadPath);
						if(uploadPath.exists() == false) {
							uploadPath.mkdirs();
						}//make yyyy/MM/dd folder
			
			for (MultipartFile multipartFile : uploadFile) {
				
				log.info("--------------------");
				log.info("Upload File Name: "+multipartFile.getOriginalFilename());
				log.info("Upload File Size: "+multipartFile.getSize());
				
					AttachFileDTO attachDTO = new AttachFileDTO();
				
				String uploadFileName = multipartFile.getOriginalFilename();
				
				//IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				log.info("only file name: "+uploadFileName);
				
				attachDTO.setFileName(uploadFileName);
				
				//중복 방지를 위한 UUID 생성
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
		try {//썸네일 생성시 전체적으로 감싸놓고
				//File saveFile = new File(uploadFolder, uploadFileName); 지정된 위치에 파일 업로드
				File saveFile = new File(uploadPath,uploadFileName);//위치 파일 생성 및 업로드
					multipartFile.transferTo(saveFile);
					
					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(uploadFolderPath);
					
			// check image type file
			if(checkImageType(saveFile)) {
				
				attachDTO.setImage(true);
				
				FileOutputStream thumbnail = new FileOutputStream(new 
													File(uploadPath,"s_"+uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
										}//if끝	
						//add to List
						list.add(attachDTO);
			
			}catch(Exception e){
					log.error(e.getMessage());
					e.printStackTrace();
				}//end catch
			}//end for
			log.info("컨트롤빠져나갑니다");
			return new ResponseEntity<> (list, HttpStatus.OK);
		}//uploadAjaxPost끝
		
		
		@GetMapping(value="/Board/wrtie25.dobby")
		public String wrtie25() {//25기 파일업로드할려고 쓸려고 만든 주소
			return "/board/boardWrite2"; 
		}
		@ResponseBody
		@RequestMapping(value="/uploadAjax25.dobby",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
		public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
			System.out.println("도착");
			System.out.println("파일명:"+file.getOriginalFilename());		
			String uploadPath = "C:\\upload";	
			
			String uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, 
					file.getOriginalFilename(), 
					file.getBytes());
			
			System.out.println();
			
			ResponseEntity<String> entity = null;
			entity = new ResponseEntity<String>(uploadedFileName,HttpStatus.CREATED);
			
			//  /2018/05/30/s-dfsdfsdf-dsfsff.jsp
			return entity;
		}
		
		@ResponseBody
		@RequestMapping(value="/displayFile.dobby", method=RequestMethod.GET)
		public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
			
		//	System.out.println("fileName:"+fileName);
			String uploadPath = "C:\\upload";
			
			InputStream in = null;		
			ResponseEntity<byte[]> entity = null;
			
		//	logger.info("FILE NAME :"+fileName);
			
			try{
				String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
				MediaType mType = MediaUtils.getMediaType(formatName);
				
				HttpHeaders headers = new HttpHeaders();		
				 
				in = new FileInputStream(uploadPath+fileName);//직접 경로에서 입력 받은 것처러 연결된 느낌
				//FileInputStream,byteStream에 대해서 검색
				
				if(mType != null){
					headers.setContentType(mType);
				}else{
					
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
				}
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
						headers,
						HttpStatus.CREATED);
				
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			}finally{
				in.close();
			}
			return entity;
		}
		
		@GetMapping("/display.dobby")//이미지 업로드
		 @ResponseBody
		 public ResponseEntity<byte[]> getFile(String fileName){
			 
			 log.info("fileName: " + fileName);
			 
			 File file = new File("c:\\upload\\"+fileName);
			 
			 log.info("file:"+file);
			 
			 ResponseEntity<byte[]> result = null;
			 
			 try {
				HttpHeaders header = new HttpHeaders();
				
			 	header.add("Content-Type", Files.probeContentType(file.toPath()));
			 	result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
			 	} catch (IOException e) {
				e.printStackTrace();
			}
			return result;
			 
		 }
		 @GetMapping(value="/download.dobby",produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
		 @ResponseBody//첨부파일 다운로드 및 원본 보여주기, IE,Edge 브라우저 문제 처리 추가
		 public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent")String UserAgent,
				 String fileName){
	log.info("download file"+fileName);
			 
			 Resource resource = new FileSystemResource("C:\\upload\\"+fileName);log.info("resource:" + resource);
			 
	if(resource.exists() == false) {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
			 String resourceName = resource.getFilename();
			 
			 //remove UUID
			 String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
			
			 HttpHeaders headers = new HttpHeaders();
			 
		try {	String downloadName = null;
				if(UserAgent.contains("Trident")) {
	log.info("IE browser");
			downloadName = 
				URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+"," ");
				} else if(UserAgent.contains("Edge")){
	log.info("Edge browser");
			downloadName = //resourceOriginalName 에러
				URLEncoder.encode(resourceOriginalName, "UTF-8");
				}else if(UserAgent.contains("Chrome browser")){
	log.info("Chrome browser");
			downloadName =
				new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
				}
	log.info("downloadName"+downloadName);
	
	headers.add("Content-Disposition", "attachment; filename="+downloadName);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		 }
////////////////////////////////////////컨트롤러 처리
@PostMapping("/register.dobby")
public String register(ProductVo pv, RedirectAttributes rttr) {
	log.info("===========");
	log.info("register:" + pv);
	if(pv.getAttachList() != null) {
		pv.getAttachList().forEach(attach -> log.info(attach));
	}
	
	log.info("===========");
	// service.register(pv);
	// rttr.addFlashAttribute("result", pv.getPidx());
	return "redirect:/Product/1/1000/0/0/empty/ProductSerchList.dobby";
}		 
		 
}


