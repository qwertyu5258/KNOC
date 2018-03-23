package kr.co.knoc.tags.pager;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class PagerTagExtraInfo extends TagExtraInfo{
    public VariableInfo[] getVariableInfo(TagData data) {
		return new VariableInfo[]
		{
			new VariableInfo(data.getAttributeString("prevPage"),
				"kr.co.knoc.tags.pager.PageAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("prevBlock"),
				"kr.co.knoc.tags.pager.PageAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("nextPage"),
				"kr.co.knoc.tags.pager.PageAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("nextBlock"),
				"kr.co.knoc.tags.pager.PageAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("pages"),
				"java.util.Vector",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("firstPage"),
				"kr.co.knoc.tags.pager.PageAnchor",
				true,
				VariableInfo.AT_END),
			new VariableInfo(data.getAttributeString("lastPage"),
				"kr.co.knoc.tags.pager.PageAnchor",
				true,
				VariableInfo.AT_END),
				
		};
	}
}