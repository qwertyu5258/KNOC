package com.neoboard.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;


/**
 * @author Jang JeongYeon (jyjang@mcat.co.kr)
 * @version 1.0
 */
public class ImageFileRenamePolicy implements FileRenamePolicy {
	/**
	 * Image File일 경우 영문으로 Rename
	 */
	public File rename(File upFile) {
	    String fileName = upFile.getName();	//원래 파일명
		String fileExe = "";				//원래 확장자

		String newFileNameBody = ""; 		//확장자를 제외한 새 파일명
		String newFileName = "";			//새 파일명(확장자 포함)
		
		int index = 0;						//파일명 중복시 증가할 인덱스
		int dotIndex;
		String tmpStr = "";
		
		boolean imageFlag = false;			//이미지일 경우		
		
		java.io.File tmpFile;				//파일명이 정해진 새 파일 객체 

		dotIndex = fileName.lastIndexOf(".");
		
		if(dotIndex != -1){
			fileExe = fileName.substring(dotIndex);					// '.'이 포함됨
			newFileNameBody = fileName.substring(0, dotIndex);		// '.'을 제외한 파일명
		}else{
			newFileNameBody = fileName;
		}
		
		//확장자가 이미지일 경우만
		tmpStr = fileExe.toLowerCase();
		
		//이미지인지 검사 
		if(tmpStr.indexOf("jpg") != -1 || tmpStr.indexOf("jpeg") != -1 || tmpStr.indexOf("gif") != -1 || tmpStr.indexOf("bmp") != -1 || tmpStr.indexOf("ico") != -1){
			imageFlag = true;
		}
		
		if(imageFlag){	//이미지인 경우		
			tmpStr = "";
			
			//파일명 설정(파일명을 날짜기준으로 바꿈)
			while(true){
				Date date = new Date();
		        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHHmmss");
				String today=simpleDate.format(date);
				
				newFileName = today + tmpStr + fileExe;	//원래 확장자를 붙임				
					
				tmpFile = new File(upFile.getParent()+"/viewImages", newFileName);												
				//중복파일 검사
				try{
					if(tmpFile.createNewFile()){						
						//중복 파일이 없으면 성공이므로 나간다. 
						break;
					}//if
				}catch(Exception e){}
				
				index = index + 1;
				tmpStr = "" + index;	//뒤에 숫자를 붙임.
				
				if(index > 10000) break;	//1초에 파일이 1만개 이상 올라올 수 없다고 가정.
				
				tmpFile = null;
			}		
		}else{
		//이미지가 아닐 경우 - 기존 메커니즘대로 함. 뒤에 숫자를 붙임.
			
			//파일명 설정(파일명을 날짜기준으로 바꿈)
			tmpStr = "";
			
			while(true){
				Date date = new Date();
		        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHHmmss");
				String today=simpleDate.format(date);				
				
				newFileName = newFileNameBody + today + fileExe;	//원래 확장자를 붙임
					
				tmpFile = new File(upFile.getParent()+"/attachFiles", newFileName);
				
				//중복파일 검사
				try{
					if(tmpFile.createNewFile()){
						//중복 파일이 없으면 성공이므로 나간다. 
						break;
					}//if
				}catch(Exception e){}		
				
				index = index + 1;
				tmpStr = "" + index;	//뒤에 숫자를 붙임.
				
				if(index > 10000) break;
				
				tmpFile = null;
			}
		}
		
		return tmpFile;
	}
	
	//숫자를 2자리 문자로 리턴 
	private String toString(int tmp){
		if(tmp < 10){
			return "0" + tmp;
		}else{
			return tmp + "";
		}
	}
	
}
