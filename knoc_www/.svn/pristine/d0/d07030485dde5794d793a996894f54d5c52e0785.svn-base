package com.neoboard.tags;

import java.util.regex.Pattern;

import com.neoboard.tags.FileIO;
import com.neoboard.tags.FileProperties;
import com.neoboard.tags.JUtil;


public class XSSProtect {
	private static String replaceComment;			// Tag를 대체 할 문자열
	private static String propertyFile;
	private static String[] tagList = null;

	/**
	 *  위험 요소 Tag 가져오기
	 */
	private static String[] getTagList(){
		replaceComment = "xx";
		propertyFile = "xsstag.properties";

		FileProperties property= new FileProperties();
		try{
			property.readFromFile(com.neoboard.data.Property.PROPERTY_FILE_ROOT + "/classes" + java.io.File.separator + propertyFile);
			/**
			 * 2016. 03. 21 / MYM
			 * 보안약점 조치
			 */
			String strValue = property.getValue("tag1");
			if(strValue == null) { strValue = ""; }
			tagList = strValue.split(",");
		}catch(Exception e){
			System.out.println("Class: XSSProtect, 프로퍼티 파일을 읽어오지 못했습니다. " + e.getMessage());
		}

		return tagList;
	}

	/**
	 * HTML 모드
	 * 위험 Tag를 대체 문자로 Replace 처리
	 * @param value		내용
	 * @return
	 */
	public static String ReplaceValue(String value){
		getTagList();

		if (value == null) return "";
		if (tagList == null) return value;

		for (int i = 0 ; i < tagList.length ; i++){
			Pattern p = Pattern.compile("("+tagList[i]+")", Pattern.CASE_INSENSITIVE);
			value = p.matcher(value).replaceAll(tagList[i]+replaceComment);
		}

		return value;
	}

	/**
	 * TEXT 모드
	 * @param value
	 * @return
	 */
	public static String ReplaceTag(String value){
		if (value == null) return "";

		value = value.replaceAll("<", "&lt;");
		value = value.replaceAll(">", "&gt;");

		return value;
	}
}
