package com.neoboard.tags;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class NeoPagerTagExtraInfo extends TagExtraInfo{
    public VariableInfo[] getVariableInfo(TagData data) {
		return new VariableInfo[]
		{
			new VariableInfo(data.getAttributeString("prevPage"),
				"com.neoboard.data.NeoAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("prevBlock"),
				"com.neoboard.data.NeoAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("nextPage"),
				"com.neoboard.data.NeoAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("nextBlock"),
				"com.neoboard.data.NeoAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("pages"),
				"java.util.Vector",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("firstPage"),
				"com.neoboard.data.NeoAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("lastPage"),
				"com.neoboard.data.NeoAnchor",
				true,
				VariableInfo.AT_END),
				
		};
	}
}
