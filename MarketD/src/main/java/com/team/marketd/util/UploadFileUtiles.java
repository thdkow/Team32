package com.team.marketd.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
//import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;


public class UploadFileUtiles {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(UploadFileUtiles.class);

	public static String uploadFile(String uploadPath,
									String originalName,byte[] fileData	)	
	throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() +"_"+originalName;
		
//		String path = UploadFileUtiles.class.getResource("").getPath();
//		System.out.println("현재클래스path:"+path);
		
//  	실행되는시스템 위치	
//		System.out.println(System.getProperty("user.dir"));
       
//        String realpath = request.getSession().getServletContext().getRealPath(uploadPath);
//		System.out.println("realpath:"+realpath);
        
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath+savedPath,savedName);
//  	등록한 파일 상대경로
//		String loc = target.getCanonicalPath();

		FileCopyUtils.copy(fileData,target);//파일 복사 기능 업로드한 것처럼 보이지만 복사한것
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		//확장자 꺼내줌
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null){//exe같은 타입을 막기 위해 util에 만들어놓았음
//	임포트받으면 풀기	//	uploadedFileName = makeThumbnail(uploadPath,savedPath, savedName);
		}else{ //있으면 썸네일로
			uploadedFileName = makeIcon(uploadPath,savedPath,savedName);
		} //없으면 아이콘으로
				
		// 2018/05/03/s-dssddssf-2323423.jpg
		return uploadedFileName;
	}	

	private  static String makeIcon(String uploadPath,
			String path,
			String fileName)throws Exception{

		String iconName = uploadPath+path+File.separator+fileName;				
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String calcPath(String uploadPath){	
		
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath+
				File.separator +
				new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath +
				File.separator +
				new DecimalFormat("00").format(cal.get(Calendar.DATE));
			
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath,String...paths){
			
		if(new File(uploadPath+paths[paths.length -1]).exists())
			return;
		
		for(String path : paths){
			
			File dirPath = new File(uploadPath + path);		
	//		System.out.println("dirPath:"+dirPath);			
			
			if (! dirPath.exists()){			
				dirPath.mkdir();				
			}
		}
	}
	//Scalr 임포트 못 받고 있음
	/*private static String makeThumbnail(String uploadPath,//썸네일 만드는 것
			String path,
			String fileName) throws Exception{
		
		BufferedImage sourceImg = 
				ImageIO.read(new File(uploadPath+path,fileName));
		BufferedImage destImg = 
				Scalr.resize(sourceImg, 
						Scalr.Method.AUTOMATIC, 
						Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = 
				uploadPath + 
				path + 
				File.separator + 
				"s-"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}	*/
}
