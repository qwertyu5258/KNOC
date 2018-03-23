package kr.co.knoc.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



 



public class FileUpload {


	/**
	 * 멀티파트 파일업로드 (업로드된 파일정로를 ArrayList로 HashMap형태로 담아온다)
	 * @param request 
	 * @param filePath
	 * @param fileSize
	 * @return
	 */
	public ArrayList articleFile(HttpServletRequest request, String filePath, int fileSize, HashMap requestData){
		String encoding = "euc-kr";
		int maxUploadSize = fileSize * 1024 *1024; 
		MultipartRequest mrequest = null; 
		ArrayList list = new ArrayList();
		
		try{
			EtcUtil etcutil = new EtcUtil(); 
			request.setCharacterEncoding("euc-kr");
			mrequest = new MultipartRequest(request, filePath, maxUploadSize, encoding, new DefaultFileRenamePolicy());
			
			requestData.put("contents", etcutil.checkNull(mrequest.getParameter("content")));
			requestData.put("order_no", etcutil.checkNull(mrequest.getParameter("order_no")));
			requestData.put("level_no", etcutil.checkNull(mrequest.getParameter("level_no")));
			requestData.put("subject", etcutil.checkNull(mrequest.getParameter("subject")));
			requestData.put("status_no", etcutil.checkNull(mrequest.getParameter("status_no")));
			requestData.put("obm_type", etcutil.checkNull(mrequest.getParameter("obm_type")));
			requestData.put("article_pwd", etcutil.checkNull(mrequest.getParameter("article_pwd")));
			requestData.put("user_nm", etcutil.checkNull(mrequest.getParameter("user_nm")));
			
			Enumeration ent =  mrequest.getFileNames();
			
			while(ent.hasMoreElements()){
				HashMap hash = new HashMap();
				try{
					String fileName = (String)ent.nextElement();
					String saveFileNm = mrequest.getFile(fileName).getName();
					String orgFileNm = mrequest.getOriginalFileName(fileName);
					 
					hash.put("saveFileNm", mrequest.getFile(fileName).getName());
					hash.put("orgFileNm", mrequest.getOriginalFileName(fileName));
					hash.put("filePath", filePath);
					
					System.out.println(saveFileNm);
					if(orgFileNm != null){
						list.add(hash);
					}
				}catch (NullPointerException ex) {
					System.out.println("등록된 파일이 없습니다.");
				}
			
			}
			
		}catch (Exception e) {
			System.out.println("Exception :: "+e);
		}
		return list;
	}
	
	/**
	 * 멀티파트 파일업로드 (업로드된 파일정로를 ArrayList로 HashMap형태로 담아온다)
	 * @param request 
	 * @param filePath
	 * @param fileSize
	 * @return
	 */
	public ArrayList articleFile2(HttpServletRequest request, String filePath, int fileSize, HashMap requestData){
		String encoding = "euc-kr";
		int maxUploadSize = fileSize * 1024 *1024; 
		MultipartRequest mrequest = null; 
		ArrayList list = new ArrayList();
		
		try{
			EtcUtil etcutil = new EtcUtil(); 
			request.setCharacterEncoding("euc-kr");
			mrequest = new MultipartRequest(request, filePath, maxUploadSize, encoding, new DefaultFileRenamePolicy());
			
			requestData.put("contents", etcutil.checkNull(mrequest.getParameter("content")));
			requestData.put("order_no", etcutil.checkNull(mrequest.getParameter("order_no")));
			requestData.put("level_no", etcutil.checkNull(mrequest.getParameter("level_no")));
			requestData.put("subject", etcutil.checkNull(mrequest.getParameter("subject")));
			requestData.put("status_no", etcutil.checkNull(mrequest.getParameter("status_no")));
			requestData.put("obm_type", etcutil.checkNull(mrequest.getParameter("obm_type")));
			requestData.put("article_pwd", etcutil.checkNull(mrequest.getParameter("article_pwd")));
			requestData.put("article_nid", etcutil.checkNull(mrequest.getParameter("article_nid")));
			requestData.put("user_nm", etcutil.checkNull(mrequest.getParameter("user_nm")));
			
			Enumeration ent =  mrequest.getFileNames();
			
			while(ent.hasMoreElements()){
				HashMap hash = new HashMap();
				try{
					String fileName = (String)ent.nextElement();
					String saveFileNm = mrequest.getFile(fileName).getName();
					String orgFileNm = mrequest.getOriginalFileName(fileName);
					 
					hash.put("saveFileNm", mrequest.getFile(fileName).getName());
					hash.put("orgFileNm", mrequest.getOriginalFileName(fileName));
					hash.put("filePath", filePath);
					
					
					if(orgFileNm != null){
						list.add(hash);
					}
				}catch (NullPointerException ex) {
					System.out.println("등록된 파일이 없습니다.");
				}
			
			}
			
		}catch (Exception e) {
			System.out.println("Exception :: "+e);
		}
		return list;
	}
	
	/**
	 * 멀티파트 파일업로드 옴부즈맨(업로드된 파일정로를 ArrayList로 HashMap형태로 담아온다)
	 * @param request 
	 * @param filePath
	 * @param fileSize
	 * @return
	 */
	public ArrayList articleObmFile(HttpServletRequest request, String filePath, int fileSize, HashMap requestData){
		String encoding = "euc-kr";
		int maxUploadSize = fileSize * 1024 *1024; 
		MultipartRequest mrequest = null; 
		ArrayList list = new ArrayList();
		
		try{
			EtcUtil etcutil = new EtcUtil(); 
			request.setCharacterEncoding("euc-kr");
			mrequest = new MultipartRequest(request, filePath, maxUploadSize, encoding, new DefaultFileRenamePolicy());
			
			
			
			
			requestData.put("contents", etcutil.checkNull(mrequest.getParameter("content")));
			requestData.put("order_no", etcutil.checkNull(mrequest.getParameter("order_no")));
			requestData.put("level_no", etcutil.checkNull(mrequest.getParameter("level_no")));
			requestData.put("subject", etcutil.checkNull(mrequest.getParameter("subject")));
			requestData.put("status_no", etcutil.checkNull(mrequest.getParameter("status_no")));
			requestData.put("type", etcutil.checkNull(mrequest.getParameter("type")));
			requestData.put("article_pwd", etcutil.checkNull(mrequest.getParameter("article_pwd")));
			requestData.put("obm_type", etcutil.checkNull(mrequest.getParameter("obm_type")));
			
			Enumeration ent =  mrequest.getFileNames();
			
			while(ent.hasMoreElements()){
				HashMap hash = new HashMap();
				try{
					String fileName = (String)ent.nextElement();
					String saveFileNm = mrequest.getFile(fileName).getName();
					String orgFileNm = mrequest.getOriginalFileName(fileName);
					 
					hash.put("saveFileNm", mrequest.getFile(fileName).getName());
					hash.put("orgFileNm", mrequest.getOriginalFileName(fileName));
					hash.put("filePath", filePath);
					
					
					if(orgFileNm != null){
						list.add(hash);
					}
				}catch (NullPointerException ex) {
					System.out.println("등록된 파일이 없습니다.");
				}
			
			}
			
			
			
			
			
		}catch (Exception e) {
			System.out.println("Exception :: "+e);
		}
		return list;
	}
	
	/**
	 * 멀티파트 파일업로드 (업로드된 파일정로를 ArrayList로 HashMap형태로 담아온다)
	 * @param request 
	 * @param filePath
	 * @param fileSize
	 * @return
	 */
	public ArrayList articleUpdateFile(MultipartRequest mrequest, String filePath,  HashMap requestData ,String file_name){
		String encoding = "euc-kr";
		//int maxUploadSize = fileSize * 1024 *1024; 
		//MultipartRequest mrequest = null; 
		ArrayList list = new ArrayList();
		
		try{
			EtcUtil etcutil = new EtcUtil(); 
			//request.setCharacterEncoding("euc-kr");
			//mrequest = new MultipartRequest(request, filePath, maxUploadSize, encoding, new DefaultFileRenamePolicy());
			
			String old_filex1=etcutil.checkNull(mrequest.getParameter("old_filex1"));
			String old_save_filex1=etcutil.checkNull(mrequest.getParameter("old_save_filex1"));
			String old_filex1_nid=etcutil.checkNull(mrequest.getParameter("old_nid_filex1"));
			
			String old_filex2=etcutil.checkNull(mrequest.getParameter("old_filex2")); 
			String old_save_filex2=etcutil.checkNull(mrequest.getParameter("old_save_filex2"));
			String old_filex2_nid=etcutil.checkNull(mrequest.getParameter("old_nid_filex2"));
			
			
			requestData.put("contents", etcutil.checkNull(mrequest.getParameter("content")));
			requestData.put("order_no", etcutil.checkNull(mrequest.getParameter("order_no")));
			requestData.put("level_no", etcutil.checkNull(mrequest.getParameter("level_no")));
			requestData.put("subject", etcutil.checkNull(mrequest.getParameter("subject")));
			requestData.put("status_no", etcutil.checkNull(mrequest.getParameter("status_no")));
			requestData.put("obm_type", etcutil.checkNull(mrequest.getParameter("obm_type")));
			requestData.put("article_pwd", etcutil.checkNull(mrequest.getParameter("article_pwd")));
			requestData.put("article_nid", etcutil.checkNull(mrequest.getParameter("article_nid")));
			requestData.put("obm_type", etcutil.checkNull(mrequest.getParameter("obm_type")));
			requestData.put("old_nid_filex1", etcutil.checkNull(mrequest.getParameter("old_nid_filex1")));
			requestData.put("old_nid_filex2", etcutil.checkNull(mrequest.getParameter("old_nid_filex2"))); 
			
			
			Enumeration ent =  mrequest.getFileNames();
			
			while(ent.hasMoreElements()){
				HashMap hash = new HashMap();
				try{
					String orgFileNm = null;
					String saveFileNm ="";
					String fileName = (String)ent.nextElement(); 
					 
					if(file_name.equals(fileName)){
						
						if( mrequest.getFile(fileName)!=null){
							saveFileNm = mrequest.getFile(fileName).getName(); 
							orgFileNm = mrequest.getOriginalFileName(fileName);
							hash.put("saveFileNm", mrequest.getFile(fileName).getName());
							hash.put("orgFileNm", mrequest.getOriginalFileName(fileName));
							hash.put("filePath", filePath);
							if("filex1".equals(fileName)){
							hash.put("file_nid", old_filex1_nid);
							}else{
							hash.put("file_nid", old_filex2_nid);	
							}
						}else{
							if("filex1".equals(fileName)){
							hash.put("saveFileNm", old_save_filex1);
							hash.put("orgFileNm", old_filex1);
							hash.put("filePath", filePath);
							hash.put("file_nid", old_filex1_nid);
							}else{
							hash.put("saveFileNm", old_save_filex2);
							hash.put("orgFileNm", old_filex2);
							hash.put("filePath", filePath);
							hash.put("file_nid", old_filex2_nid);	
							}
						}
					} 
					
					
					if(orgFileNm != null){
						list.add(hash);
					}
				}catch (NullPointerException ex) {
					System.out.println("등록된 파일이 없습니다.");
				}
			
			}
			
			
			
			
			
		}catch (Exception e) {
			System.out.println("Exception :: "+e);
		}
		return list;
	}	
}

