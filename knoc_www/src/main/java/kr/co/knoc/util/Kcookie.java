package kr.co.knoc.util;

import java.io.*;
import java.util.*;
import java.net.*;
import javax.servlet.http.*;



public class Kcookie {
	
	// 쿠키 읽기 (request, 쿠기이름)
	public static String getCookie(HttpServletRequest req, String name){
		String value = "";
		boolean flag = false;
		try{
			Cookie[] cookies = req.getCookies();
			if (cookies != null){
				for (int i = 0; i < cookies.length; i++){
					if (cookies[i].getName().equals (name)){
						if (!cookies[i].getValue().equals ("")){ 
							value = cookies[i].getValue();
						}else{
							cookies[i].setMaxAge(0);
						}
					}
				}
			}
		}catch(Exception e){
		   System.out.println(e.toString());
		}  


		return value;
	}
	
	// 쿠키 삭제 (request, 쿠키이름)
	public static void delCookie(HttpServletRequest req, String name){
		try{
			Cookie[] cookies = req.getCookies();
			if (cookies != null){
				for (int i = 0; i < cookies.length; i++){
					if (cookies[i].getName().equals (name)){
						cookies[i].setMaxAge(0);
					}
				}
			}
		}catch(Exception e){
		   System.out.println(e.toString());
		}  

	}	
	
	// 쿠키 저장 (response, 쿠키이름, 쿠키값)
	public static void setCookie(HttpServletResponse res, String name, String value){
		Cookie cookie = new Cookie (name, value);
		cookie.setPath("/");                                        
		cookie.setMaxAge(-1);
		res.addCookie(cookie);
	}
	
	// 쿠키 저장 (response, 쿠키이름, 쿠키값, 쿠키 유효기간)
	public static void setCookie(HttpServletResponse res, String name, String value,int time){
		Cookie cookie = new Cookie (name, value);
		cookie.setPath("/");                                        
		cookie.setMaxAge(time);
		res.addCookie(cookie);
	}
	
	// 쿠키 저장 (response, 쿠키이름, 쿠키값, 공유도메인)
	public static void setCookie(HttpServletResponse res, String name, String value,String domain){
		Cookie cookie = new Cookie (name, value);
		cookie.setPath("/");                                        
		cookie.setMaxAge(-1);
		cookie.setDomain(domain);
		res.addCookie(cookie);
	}
	
	// 쿠키 저장 (response, 쿠키이름, 쿠키값, 쿠키유효기간, 공유도메인)
	public static void setCookie(HttpServletResponse res, String name, String value,int time, String domain){
		Cookie cookie = new Cookie (name, value);
		cookie.setPath("/");                                        
		cookie.setMaxAge(time);
		cookie.setDomain(domain);
		res.addCookie(cookie);
	}	

}
