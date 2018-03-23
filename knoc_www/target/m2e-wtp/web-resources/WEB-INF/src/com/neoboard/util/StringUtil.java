package com.neoboard.util;

import java.lang.reflect.Field;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
	public static boolean checkNumberFormatPhone(String phoneNumber){
		if(phoneNumber == null) return false;
		return Pattern.matches("^0[2345][1-9]{0,1}-[0-9]{3,4}-[0-9]{4}$",phoneNumber);
	}
	public static boolean checkNumberFormatMobile(String mobileNumber){
		if(mobileNumber == null) return false;
		return Pattern.matches("^01[167890]-[0-9]{3,4}-[0-9]{4}$",mobileNumber);
	}
	public static boolean checkStringFormatEmail(String email){
		if (email==null) return false;
        return Pattern.matches(
            "[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", 
            email.trim());
	}
	public static boolean checkStringZipcode(String zipcode){
		if(zipcode == null) return false;
		return Pattern.matches("^[0-9]{3}-[0-9]{3}$",zipcode);
	}
	/**
	 * 파일 사이즈 포맷팅
	 * @param fileSize
	 * @return
	 */
	public static String getFileSizeString(long fileSize) {
		String type = "KB";
		if(fileSize >1000*1000) type = "MB";
		java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(1);
		if(type.toUpperCase().equals("MB")) {
			double ds = (double)fileSize/1024.0/1024.0;
			return nf.format(ds) + "MB";
		}
		else if(type.toUpperCase().equals("KB")) {
			double ds = (double)fileSize/1024.0;
			return nf.format(ds) + "KB";
		}
		else  {
			double ds = (double)fileSize/1024.0;
			return nf.format(ds) + "KB";
		}
	}
	/**
	 * Entity Class의 null string field 초기화.
	 * <p>
	 * Entity class 내에 있는 java.lang.String형의 field는 DB의 Column과
	 * 밀접한 연관이 있는 경우가 많다. 이러한 Entity Field가 특히 GUI의 특정
	 * TextFiled에 표현되어야 하는 경우도 많다. 만약 그 String Filed가 null일
	 * 경우 일일이 검사를 한다는 것은 참으로 답답한 일이 아닐 수 없다.
	 * <p>
	 * 이 method는 여하한의 Object 내에 있는 모든 java.lang.String형의 field 변수 중
	 * null 값으로 된 field를 길이가 0 인 blank string("")으로 초기화 시켜준다.
	 * <p>
	 *
	 * <xmp>
	 * Sample Code:
	 * public java.util.Vector selectAll() throws Exception
	 * {
	 *  java.util.Vector list = new Vector();
	 * 	Statement stmt = null;
	 * 	ResultSet rs =null;
	 * 	try{
	 * 		stmt = conn.createStatement();
	 * 		String query = "select " +
	 * 			"id, " + 
	 * 			"name, " + 
	 * 			"desc " + 
	 * 			"from THE10 " +
	 * 			"order by id ";
	 * 
	 * 		rs = stmt.executeQuery(query);
	 * 
	 * 		while ( rs.next() ) {
	 * 			AdminAuth entity = new AdminAuth();
	 * 			entity.id = rs.getString("id");
	 * 			entity.name = rs.getString("name");
	 * 			entity.desc = rs.getString("desc");
	 * 			Utility.fixNull(entity);
	 * 			list.addElement(entity);
	 * 		}
	 * 	}
	 * 	finally {
	 * 		try{rs.close();}catch(Exception e){}
	 * 		try{stmt.close();}catch(Exception e){}
	 * 	}
	 * 	return list;
	 * }
	 *</xmp>
	 *
	 * @param java.lang.Object Object내의 public java.lang.String 형의 
	 *        member variable에만 영향을 준다.
	 *
	 * @see fixNullAll(java.lang.Object)
	 * @see fixNullAndTrim(java.lang.Object)
	 * @see fixNullAndTrimAll(java.lang.Object)
	 * @author WonYoung Lee, wyounglee@lgeds.lg.co.kr
	 */
	public static void fixNull(Object o)
	{
		if ( o == null ) return;
		
		Class c = o.getClass();
		if ( c.isPrimitive() ) return;
		
		Field[] fields = c.getFields();
		for (int i=0 ; i<fields.length; i++) {
			try {
				Object f = fields[i].get(o);
				Class fc = fields[i].getType();
				
				if ( fc.getName().equals("java.lang.String") ) {
					if ( f == null ) fields[i].set(o, "");
					else	fields[i].set(o, f);
				}
			}
			catch(Exception e){
			}
		}
	}
	/**
	 * Entity Class의 null string field 초기화 &amp; trim().
	 * <p>
	 * Entity class 내에 있는 java.lang.String형의 field는 DB의 Column과
	 * 밀접한 연관이 있는 경우가 많다. 이러한 Entity Field가 특히 GUI의 특정
	 * TextFiled에 표현되어야 하는 경우도 많다. 만약 그 String Filed가 null일
	 * 경우 일일이 검사를 한다는 것은 참으로 답답한 일이 아닐 수 없다.
	 * <p>
	 * 이 method는 여하한의 Object 내에 있는 모든 java.lang.String형의 field 변수 중
	 * null 값으로 된 field를 길이가 0 인 blank string("")으로 초기화 시켜준다.
	 * 만약 null이 아닌 정상적인 String이 대입되어 있으면 강제적으로 trim()를
	 * 시켜준다.
	 * <p>
	 * 이 때 trim() 함수는 java.lang.String 의 trim()을 사용하지 않았다.
	 *
	 * <xmp>
	 * Sample Code:
	 * public java.util.Vector selectAll() throws Exception
	 * {
	 *  java.util.Vector list = new Vector();
	 * 	Statement stmt = null;
	 * 	ResultSet rs =null;
	 * 	try{
	 * 		stmt = conn.createStatement();
	 * 		String query = "select " +
	 * 			"id, " + 
	 * 			"name, " + 
	 * 			"desc " + 
	 * 			"from THE10 " +
	 * 			"order by id ";
	 * 
	 * 		rs = stmt.executeQuery(query);
	 * 
	 * 		while ( rs.next() ) {
	 * 			AdminAuth entity = new AdminAuth();
	 * 			entity.id = rs.getString("id");
	 * 			entity.name = rs.getString("name");
	 * 			entity.desc = rs.getString("desc");
	 * 			Utility.fixNull(entity);
	 * 			list.addElement(entity);
	 * 		}
	 * 	}
	 * 	finally {
	 * 		try{rs.close();}catch(Exception e){}
	 * 		try{stmt.close();}catch(Exception e){}
	 * 	}
	 * 	return list;
	 * }
	 *</xmp
	 *
	 * @param java.lang.Object Object내의 public java.lang.String 형의 
	 *        member variable에만 영향을 준다.
	 *
	 * @see fixNull(java.lang.Object)
	 * @see fixNullAll(java.lang.Object)
	 * @see fixNullAndTrimAll(java.lang.Object)
	 * @see trim(String)
	 * @author WonYoung Lee, wyounglee@lgeds.lg.co.kr
	 */
	public static void fixNullAndTrim(Object o)
	{
		if ( o == null ) return;
		
		Class c = o.getClass();
		if ( c.isPrimitive() ) return;
		
		Field[] fields = c.getFields();
		for (int i=0 ; i<fields.length; i++) {
			try {
				Object f = fields[i].get(o);
				Class fc = fields[i].getType();
				if ( fc.getName().equals("java.lang.String") ) {
					if ( f == null ) fields[i].set(o, "");
					else {
						String item = StringUtil.trim( (String)f );
						fields[i].set(o, item);
					}
				}
			}
			catch(Exception e){
			}
		}
	}
	/**
	 * Remove special white space from both ends of this string. 
	 * <p>
	 * All characters that have codes less than or equal to 
	 * <code>'&#92;u0020'</code> (the space character) are considered to be 
	 * white space. 
	 * <p>
	 * java.lang.String의 trim()과 차이점은 일반적인 white space만 짜르는 것이
	 * 아니라 위에서와 같은 특수한 blank도 짤라 준다.<br>
	 * 이 소스는 IBM HOST와 데이타를 주고 받을 때 유용하게 사용했었다.
	 * 일반적으로 많이 쓰이지는 않을 것이다.
	 *
	 * @param  java.lang.String
	 * @return trimed string with white space removed
	 *         from the front and end.
	 * @author WonYoung Lee, wyounglee@lgeds.lg.co.kr
	 */
	public static String trim(String s) {
		int st = 0;
		char[] val = s.toCharArray();
		int count = val.length;
		int len = count;

		while ((st < len) && ((val[st] <= ' ') || (val[st] == '　') ) )   st++;
		while ((st < len) && ((val[len - 1] <= ' ') || (val[len-1] == '　')))  len--;
		
		return ((st > 0) || (len < count)) ? s.substring(st, len) : s;
	}
	/**
	 * 
	 * @param in
	 * @param from
	 * @param to
	 * @return
	 */
	public static String replaceInString(String in, String from, String to) {
		if( in == null || from == null || to == null) {
			return in;
		}
		
		StringBuffer newValue = new StringBuffer();
		char[] inChars = in.toCharArray();
		int inLen = inChars.length;
		char[] fromChars = from.toCharArray();
		int fromLen = fromChars.length;
		
		for (int i = 0; i < inLen; i++) {
			if (inChars[i] == fromChars[0] && (i + fromLen) <= inLen) {
				boolean isEqual = true;
				for (int j = 1; j < fromLen; j++) {
					if (inChars[i + j] != fromChars[j]) {
						isEqual = false;
						break;
					}
				}
				if (isEqual) {
					newValue.append(to);
					i += fromLen - 1;
				}
				else {
					newValue.append(inChars[i]);
				}
			}
			else {
				newValue.append(inChars[i]);
			}
		}
		try {
			return newValue.toString();
		}catch(Exception e) { return newValue.toString();}
	}
	public static String replaceInString(String in, String from, String to, boolean enc) {
		if( in == null || from == null || to == null) {
			return in;
		}
		
		StringBuffer newValue = new StringBuffer();
		char[] inChars = in.toCharArray();
		int inLen = inChars.length;
		char[] fromChars = from.toCharArray();
		int fromLen = fromChars.length;
		
		for (int i = 0; i < inLen; i++) {
			if (inChars[i] == fromChars[0] && (i + fromLen) <= inLen) {
				boolean isEqual = true;
				for (int j = 1; j < fromLen; j++) {
					if (inChars[i + j] != fromChars[j]) {
						isEqual = false;
						break;
					}
				}
				if (isEqual) {
					newValue.append(to);
					i += fromLen - 1;
				}
				else {
					newValue.append(inChars[i]);
				}
			}
			else {
				newValue.append(inChars[i]);
			}
		}
		try {
			if(enc)
				return new String(newValue.toString().getBytes("ISO8859-1"),"EUC-KR");
			else
				return newValue.toString();
		}catch(Exception e) { return newValue.toString();}
	}
	/**
     * Replace all occurences of the string <code>match</code> in the string
     * <code>source</code> by the string <code>replace</code> relatively fast.
     * 
     * The parameter <code>expectMatches</code> signals how many matches you are
     * expecting to find from the source. A value large enough will prevent
     * (slow) memory reallocation for the resulting string. Any non-negative
     * value is sensible.
     */
    public static String fastReplaceAll(
            final String source,
            final String match,
            final String replace,
            final int expectMatches) {
 
        final int matchLength = match.length();
        final char[] sourceChars = source.toCharArray();
 
        int matchBegin = 0;
        int matchEnd = 0;
        // tries to prevent extra memory allocation:
        // the result is just about long enough if numMatches was right
        StringBuffer result = new StringBuffer(source.length()
                + expectMatches*(replace.length() - matchLength));
 
        while ((matchBegin = source.indexOf(match, matchEnd)) >= 0) {
            // appends the part before the match, starting from old match end
            result.append(sourceChars, matchEnd, matchBegin - matchEnd);
            // replaces the match with the replace string in the result
            result.append(replace);
            // moves ahead by the lentgh of the matched string
            matchEnd = matchBegin + matchLength;
        }
        // appends the unmatched tail
        result.append(sourceChars, matchEnd, sourceChars.length - matchEnd);
 
        try {
			return new String(result.toString().getBytes("ISO8859-1"),"EUC-KR");
		}catch(Exception e) { return result.toString();}
    }

}