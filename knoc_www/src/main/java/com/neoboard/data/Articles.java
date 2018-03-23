package com.neoboard.data;

import java.util.Vector;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class Articles extends Vector{
    private int totalCount;
    public Articles() {
        super();
        this.totalCount=0;
    }
    public Articles(int initialCapacity) {
        super(initialCapacity);
        this.totalCount=0;
    }
    public int getTotalCount(){
        return this.totalCount;
    }
    public void setTotalCount(int value) {
        this.totalCount = value;
    }
    
    public void addArticle(Article article){
        add(article);
    }
    
    public Article getArticle(int i){
        return (Article)get(i);
    }
}
