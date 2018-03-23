package com.neoboard.tags;

import java.util.StringTokenizer;

public class StringConvert {
	/**
	* 글자수 제한하기
	* @param str 원본 글
	* @param i i만큼 글자수를 제한
	* @param trail 자른후 trail으로 대체
	*/
	public static String cropByte(String str, int i, String trail) {
    	if (str==null) return "";
    	String tmp = str;
    	int slen = 0, blen = 0;
    	char c;
    	try {
        	if(tmp.getBytes("MS949").length>i) {
        		while (blen+1 < i) {
        			c = tmp.charAt(slen);
        			blen++;
        			slen++;
        			if ( c  > 127 ) blen++;  //2-byte character..
        		}
        		tmp=tmp.substring(0,slen)+trail;
        	}
        } catch(java.io.UnsupportedEncodingException e) {}
    	return tmp;
    }

	/**
	* 널 체크
	* @param str 원본 글
	*/
	public static String nlCk(String str) {
		if (str == null || str.trim().equals("") ) return "";
		
		try {
			//return 시에 filterQuot()하는이유는 피넛의 BeanManager를
			//사용시에 executeUpdate() 의 값을 셋시킬때 쿼리에 값을 추가시켜서 
			//쿼리문을 완성시키기 때문이다.
			return StringConvert.filterQuot(str);
		} catch(Exception ex) {
			return null;
		}
	}
	public static String nullTo(String str){
		if (str == null || str.trim().equals("") || str.equals("null") ) return "";
		return str;
	}
	/**
	 * 한글변환
	 * 현재 한글 변환은 할필요 없는것 같다..^^
	 */
	public static String fromUStoKR(String str) {
		if (str == null || str.trim().equals("") ) return "";
		
		try {
			//return new String(str.getBytes("ISO-8859-1"), "EUC-KR");
			return str;
		} catch(Exception ex) {
			return null;
		}
	}
	
	public static String fromKRtoUS(String str) {
		if (str == null || str.trim().equals("") ) return "";		
		try {
			//return new String(str.getBytes("EUC-KR"), "ISO-8859-1");
			return str;
		} catch(Exception ex) {
			return null;
		}
	}
	public static String fromUStoKR_1(String str) {
		if (str == null || str.trim().equals("") ) return "";
		
		try {
			return new String(str.getBytes("ISO-8859-1"), "EUC-KR");
		} catch(Exception ex) {
			return null;
		}
	}
	public static String fromKRtoUS_1(String str) {
		if (str == null || str.trim().equals("") ) return "";		
		try {
			return new String(str.getBytes("EUC-KR"), "ISO-8859-1");
		} catch(Exception ex) {
			return null;
		}
	}
	/**
	 * String 변환.
	 * @param oldStr 기존 Char
	 * @param newStr 바꿀 Char
	 * @param input 원본글
	 * @return String
	 */
	public static String replaceString(String oldStr, String newStr, String input) {
      int progress = newStr.length() - oldStr.length();
      progress = 5;
      int index = 0 ;
      try
      {
        StringBuffer temp = new StringBuffer(input);
        while((index =input.indexOf(oldStr, index))!=-1)
        {
          temp.deleteCharAt(index);
          input=(temp.insert(index, newStr)).toString();
          index+=progress;
        }
      }
      catch(Exception e)
      {
        return "";
      }
      return input;
  }
 	/**
	 * \n을 newLine으로 바꾼다.
	 */
	public static String replaceEnter(String str) {
      int index = 0 ;
      try
      {
        while((index = str.indexOf('\n',index))!=-1)
        {
          str=((new StringBuffer(str)).insert(index,"<br>")).toString();
          index+=6;
        }
      }
      catch(Exception e)
      {
        return "";
      }
      return str;
  }
 	/**
	 * 모든 테그들을 삭제하고 순수입력된 글만 리턴된다.
	 */
    public static String removeTag(String s) {
        int n, n1 = -1, n2 = -1, k1 = -1, k2 = -1, m1 = -1, m2 = -1;
        n1 = s.indexOf('<');
        if (n1 < 0)
            return s;
        StringBuffer sb = new StringBuffer(1024);
        sb.append(s.substring(0, n1));
        int len = s.length();
        while (n1 < len - 1 && (n2 = s.indexOf('>', n1 + 1)) >= n1 + 1) {
            n = n1 + 1;
            k1 = s.indexOf('\"', n);
            m1 = s.indexOf('\'', n);
            if (k1 >= n && k1 < m1 && k1 < n2) {
                k2 = s.indexOf('\"', k1 + 1);
                if (k2 >= k1 + 1) {
                    n1 = k2;
                    continue;
                }
                else {
                    break;
                }
            }
            else if (m1 >= n && m1 < k1 && m1 < n2) {
                m2 = s.indexOf('\'', m1 + 1);
                if (m2 >= m1 + 1) {
                    n1 = m2;
                    continue;
                }
                else {
                    break;
                }
            }
            else if (k1 >= n && k1 < n2) {
                k2 = s.indexOf('\"', k1 + 1);
                if (k2 >= k1 + 1) {
                    n1 = k2;
                    continue;
                }
                else {
                    break;
                }
            }
            else if (m1 >= n && m1 < n2) {
                m2 = s.indexOf('\'', m1 + 1);
                if (m2 >= m1 + 1) {
                    n1 = m2;
                    continue;
                }
                else {
                    break;
                }
            }
            else {
                n1 = s.indexOf('<', n2 + 1);
                if (n1 < 0) {
                    sb.append(s.substring(n2 + 1));
                    break;
                }
                else {
                    sb.append(s.substring(n2 + 1, n1));
                    continue;
                }
            }
        }
        return sb.toString();
    } 
    public static String filterQuot(String message) {

        if (message == null)
            return ("");

        char content[] = new char[message.length()];
        message.getChars(0, message.length(), content, 0);
        StringBuffer result = new StringBuffer(content.length + 50);
        for (int i = 0; i < content.length; i++) {
            switch (content[i]) {
            case '\'':
                result.append("&#39;");
                break;
            default:
                result.append(content[i]);
            }
        }
        return (result.toString());
    }
    public static String filter(String message) {

        if (message == null)
            return ("");

        char content[] = new char[message.length()];
        message.getChars(0, message.length(), content, 0);
        StringBuffer result = new StringBuffer(content.length + 50);
        for (int i = 0; i < content.length; i++) {
            switch (content[i]) {
            case '<':
                result.append("&lt;");
                break;
            case '>':
                result.append("&gt;");
                break;
            case '&':
                result.append("&amp;");
                break;
            case '"':
                result.append("&quot;");
                break;
            case '\'':
                result.append("&#39;");
                break;
            default:
                result.append(content[i]);
            }
        }
        return (result.toString());
    }
	public static String[] tokenToArray(String input, String deli) throws Exception
	{
		String[] res = null;
		if(input == null || input.equals(""))
		{
			return res;
		}
		else
		{
			StringTokenizer st = new StringTokenizer(input, deli);
			res = new String[st.countTokens()];
			int i = 0;
			while(st.hasMoreTokens())
			{
				res[i]=st.nextToken();
				i++;
			}
		}
		return res;
	}
    public static String replace(String src, String oldstr, String newstr)
    {
        if (src == null)
            return null;

        StringBuffer dest = new StringBuffer("");
        int  len = oldstr.length();
        int  srclen = src.length();
        int  pos = 0;
        int  oldpos = 0;
		int  count =0;
        while ((pos = src.indexOf(oldstr, oldpos)) >= 0) {
            dest.append(src.substring(oldpos, pos));
            dest.append(newstr);
            oldpos = pos + len;
			count++;
        }

        if (oldpos < srclen)
            dest.append(src.substring(oldpos, srclen));
		//System.out.println("******************문자열 바뀐 횟수 :"+count);
		//logs.append("******************문자열 바뀐 횟수 :"+count+"<br>");
        return dest.toString();
    }
    public static String filterCstyle(String input) {
        char[] s = input.toCharArray();
        StringBuffer ret = new StringBuffer();
        int length = s.length;
        for (int i = 0; i < length; i++) {
            if (s[i] == '"') {
                ret.append("\\\"");
			}else if (s[i] == '\''){
				 ret.append("\\\'");
            } else if (s[i] == '\\') {
                ret.append("\\\\");
            } else {
                ret.append(s[i]);
            }
        }// for
        return ret.toString();
    }
    public static String filterDisableHtml(String input) {
        if (input == null) {
            return null;
        }

        char[] s = input.toCharArray();
        int length = s.length;
        StringBuffer ret = new StringBuffer(length + 100);// add more room to the result String

        for (int i = 0; i < length; i++) {
            if (s[i] == '<') {
                ret.append("&lt;");
            } else if (s[i] == '>') {
                ret.append("&gt;");
            } else if (s[i] == '&') {
                // this hack the escape for unicode character, eg : &2345;
                if ( ((i + 3) < length) &&
                     (s[i+1] == '#') &&
                     (s[i+2]>='0'&&s[i+1]<='9') &&
                     (s[i+3]>='0'&&s[i+2]<='9') ) {
                    ret.append(s[i]);
                // hack &lt; (dont escape this char more than once)
                } else if ( ((i + 3) < length) &&
                            (s[i+1] == 'l') &&
                            (s[i+2] == 't') &&
                            (s[i+3] == ';') ) {
                    ret.append(s[i]);
                // hack &gt; (dont escape this char more than once)
                } else if ( ((i + 3) < length) &&
                            (s[i+1] == 'g') &&
                            (s[i+2] == 't') &&
                            (s[i+3] == ';') ) {
                    ret.append(s[i]);
                // hack &amp; (dont escape this char more than once)
                } else if ( ((i + 4) < length) &&
                            (s[i+1] == 'a') &&
                            (s[i+2] == 'm') &&
                            (s[i+3] == 'p') &&
                            (s[i+4] == ';') ) {
                    ret.append(s[i]);
                // hack &quot; (dont escape this char more than once)
                } else if ( ((i + 5) < length) &&
                            (s[i+1] == 'q') &&
                            (s[i+2] == 'u') &&
                            (s[i+3] == 'o') &&
                            (s[i+4] == 't') &&
                            (s[i+5] == ';') ) {
                    ret.append(s[i]);
                } else {
                    ret.append("&amp;");
                }
            } else if (s[i] == '"') {
                ret.append("&quot;");
            } else {
                ret.append(s[i]);
            }
        }// for
        return ret.toString();
    }
	/**
	 * 입력받은 문자열이 숫자로 전부 이루어 졌는지 확인한다.
	 */
	public static boolean allNumbers(String s) {
		if (s == null || s.length() == 0)
			return false;
		char c;
		for (int i = 0; i < s.length(); i++) {
			c = s.charAt(i);
			if (c < '0' || c > '9')
				return false;
		}
		return true;
	}
	/**
	 * 공백 제거
	 * @param str
	 * @return
	 */
	public static String trimAllWhiteSpace( String str ){ 
		StringBuffer sb = new StringBuffer(); 

		if( str == null ) 

		return ""; 
		for( int i = 0; i < str.length(); i++ ){ 
			if( str.charAt( i ) != ' ' ) 
			sb.append( str.charAt( i ) ); 
		} 

		return sb.toString(); 
	} 
	/**
	 * 이메일 체크
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email){
		int intId=0, intDomain1=0, intDomain2=0, intDomain3=0, intAt=0, intDot=0, intError=0;

		for(int i=0; i < email.length(); i++ ) {
			char chrNow = email.charAt(i);
			if( chrNow=='@' ) intAt++;
			else if( chrNow=='.') intDot++;
			else if( intAt==0 ) intId ++;
			else if( intDot==0 ) intDomain1++;
			else if( intDot==1 ) intDomain2++;
			else if( intDot==2 ) intDomain3++;
			else intError++;
		}
		if ((intError==0 && intId>0 && intAt==1 && intDomain1>0&& intDomain2>0 && intDot==1) ||
		   (intError==0 && intId > 0 && intAt==1 && intDomain1>0&& intDomain2>0 && intDomain3>0 && intDot==2 ))
			return true;
		else  
			return false;

	}
}
