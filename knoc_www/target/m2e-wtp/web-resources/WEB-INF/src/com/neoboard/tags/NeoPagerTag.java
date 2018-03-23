package com.neoboard.tags;

import java.util.Vector;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import com.neoboard.data.*;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class NeoPagerTag extends TagSupport{
    private String pageName;
	
	private String prevPage;
	private String prevBlock;
	private String pages;
	private String nextPage;
	private String nextBlock;
	private String firstPage;
	private String lastPage;
	
	private int blockSize;
	private int totalCount;
	
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	public void setPrevPage(String prevPage) {
		this.prevPage = prevPage;	
	}
	public void setPrevBlock(String prevBlock) {
		this.prevBlock = prevBlock;
	}
	public void setPages(String pages) {
		this.pages = pages;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	public void setNextBlock(String nextBlock) {
		this.nextBlock = nextBlock;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize=  blockSize;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public void setFirstPage(String firstPage) {
		this.firstPage = firstPage;
	}
	public void setLastPage(String lastPage) {
		this.lastPage = lastPage;
	}
	public int doEndTag() throws JspException {
		/*
		 * Getting PageBean
		 */	
		PageAttribute pagebean = (PageAttribute)pageContext.getAttribute(pageName,PageContext.REQUEST_SCOPE);
		if(pagebean == null) throw new JspException("Can not find PageAttribute object!!");
		
		int page = pagebean.getNPage();
		int pageSize = pagebean.getNPageSize();
		
		NeoAnchor prevPageAnchor = new NeoAnchor();
		NeoAnchor prevBlockAnchor = new NeoAnchor();
		NeoAnchor nextPageAnchor = new NeoAnchor();
		NeoAnchor nextBlockAnchor = new NeoAnchor();
		Vector pagesAnchor = new Vector(pageSize);
		NeoAnchor firstPageAnchor = new NeoAnchor();
		NeoAnchor lastPageAnchor = new NeoAnchor();
		
		String s = "";
		String encodedUrl = pagebean.getPageUrl();
		if(encodedUrl.indexOf("?")>-1)
			s = "&";
		else
			s = "?";
			
		
		
		/*
		 * Adjust page
		 */
		 if(pageSize < 1) pageSize = 15;
		 if(page<1) page = 1;
		 if(page > (int)((totalCount-1)/pageSize)+1) page = (int)((totalCount-1)/pageSize)+1;
		 
		/*
		 * Calculate prevPage, nextPage
		 */
		if(page<=1) {
			prevPageAnchor.setPage(0);
			prevPageAnchor.setEmpty(true);
			prevPageAnchor.setAnchor("javascript:void(0);");
		} 
		else {
			prevPageAnchor.setPage(page-1);
			prevPageAnchor.setEmpty(false);
			prevPageAnchor.setAnchor(encodedUrl + s + "page=" + (new Integer(page-1)).toString()); 
		}
		if(page >= (int)((totalCount-1)/pageSize)+1) {
			nextPageAnchor.setPage(0);
			nextPageAnchor.setEmpty(true);
			nextPageAnchor.setAnchor("javascript:void(0);");	
		}
		else {
			nextPageAnchor.setPage(page+1);
			nextPageAnchor.setEmpty(false);
			nextPageAnchor.setAnchor(encodedUrl+ s + "page=" + (new Integer(page+1)).toString());
		}
		/*
		 * Calculate prevBlock, nextBlock
		 */
		if((int)((page-1)/blockSize)+1 <=1) {
			prevBlockAnchor.setPage(0);
			prevBlockAnchor.setEmpty(true);
			prevBlockAnchor.setAnchor("javascript:void(0);");
		}
		else {
			prevBlockAnchor.setPage(page-blockSize);
			prevBlockAnchor.setEmpty(false);
			prevBlockAnchor.setAnchor(encodedUrl + s + "page=" + (new Integer((int)((page-1)/blockSize) * blockSize  +1 -blockSize)).toString());
		}
		if((int)((page-1)/blockSize) +1 >= (int)((int)((totalCount-1)/pageSize)/blockSize)+1) {
			nextBlockAnchor.setPage(0);
			nextBlockAnchor.setEmpty(true);
			nextBlockAnchor.setAnchor("javascript:void(0);");
		}
		else{
			nextBlockAnchor.setPage(page+blockSize);
			nextBlockAnchor.setEmpty(false);
			nextBlockAnchor.setAnchor(encodedUrl+ s + "page=" + (new Integer((int)((page-1)/blockSize) * blockSize  +1 +blockSize)).toString());
		}
		/*
		 * pagesAnchor
		 */
		for(int i = (int)((page-1)/blockSize) * blockSize  +1; i < (int)((page-1)/blockSize) * blockSize  +1 + blockSize && i <= ((int)((totalCount-1)/pageSize)+1) ; i++) {
		 	NeoAnchor pa = new NeoAnchor();
		 	pa.setPage(i);
		 	pa.setEmpty(false);
		 	pa.setAnchor(encodedUrl + s + "page=" + (new Integer(i).toString()));
		 	pagesAnchor.add(pa);
		}
		/*
		 *  firstPage, lastPage
		 */
		firstPageAnchor.setPage(1);
		firstPageAnchor.setEmpty(false);
		firstPageAnchor.setAnchor(encodedUrl + s + "page=1");
		lastPageAnchor.setPage((int)((totalCount-1)/pageSize)+1);
		lastPageAnchor.setEmpty(false);
		lastPageAnchor.setAnchor(encodedUrl + s + "page=" + (new Integer((int)((totalCount-1)/pageSize)+1)).toString());
		
		pageContext.setAttribute(prevPage,prevPageAnchor,PageContext.PAGE_SCOPE);
		pageContext.setAttribute(nextPage,nextPageAnchor,PageContext.PAGE_SCOPE);
		pageContext.setAttribute(prevBlock,prevBlockAnchor,PageContext.PAGE_SCOPE);
		pageContext.setAttribute(nextBlock,nextBlockAnchor,PageContext.PAGE_SCOPE);
		pageContext.setAttribute(pages,pagesAnchor,PageContext.PAGE_SCOPE);
		pageContext.setAttribute(firstPage,firstPageAnchor,PageContext.PAGE_SCOPE);
		pageContext.setAttribute(lastPage,lastPageAnchor,PageContext.PAGE_SCOPE);
		
		 
		return EVAL_PAGE;
	}
	public void release() {
		pageName = null;
		prevPage = null;
		prevBlock = null;
		pages = null;
		nextPage = null;
		nextBlock = null;
		super.release();
	}
}
