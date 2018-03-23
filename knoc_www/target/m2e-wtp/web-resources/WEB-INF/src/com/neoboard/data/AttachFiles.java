package com.neoboard.data;

import java.util.Enumeration;
import java.util.Vector;

import com.neoboard.common.StringFormat;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class AttachFiles extends Vector{

    public AttachFiles() {
        super();
    }
    public AttachFiles(int initialCapacity) {
        super(initialCapacity);
    }
    
    public AttachFile getAttachFile(int index){
        return (AttachFile)get(index);
    }
    public void addAttachFile(AttachFile file) {
        add(file);
    }
    public int getCount() {
        return super.size();
    }
    
    public long getTotalSize() {
        long size = 0;
        for(Enumeration e = elements(); e.hasMoreElements();) {
            size += ((AttachFile)e.nextElement()).getFileSize();
        }
        return size;
    }
    public String getTotalSize(String type) {
	    long fileSize = getTotalSize();
		if(type.toUpperCase().equals("MB")) {
			double ds = (double)fileSize/1024.0/1024.0;
			return StringFormat.numberFormat(ds,",###.##") + "MB";
		}
		else if(type.toUpperCase().equals("KB")) {
			double ds = (double)fileSize/1024.0;
			return StringFormat.numberFormat(ds,",###.##") + "KB";
		}
		else  {
			double ds = (double)fileSize/1024.0;
			return StringFormat.numberFormat(ds,",###.##") + "KB";
		}
	}
    
}
