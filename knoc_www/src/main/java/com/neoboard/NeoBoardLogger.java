package com.neoboard;

import java.io.*;

import com.neoboard.data.Property;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class NeoBoardLogger {
    private String loggerRoot = Property.ROOT_DIR + "/logs";
    
    public NeoBoardLogger() {
        File f = new File(loggerRoot);
        if(!f.exists()) {
            f.mkdir();
        }
    }
    public void msgWrite(String msg) {
        try {
            PrintWriter writer = new PrintWriter(new BufferedOutputStream(new FileOutputStream(new File(loggerRoot + "/messages.log"),true)));
            writer.println(msg);
    	}catch(FileNotFoundException e) {
    	    ;
    	}
    }
    public void errorWrite(String msg) {
        try {
        PrintWriter writer = new PrintWriter(new BufferedOutputStream(new FileOutputStream(new File(loggerRoot + "/errors.log"),true)));
        writer.println(msg);
    	}catch(FileNotFoundException e) {
    	    ;
    	}
    }
  
}
