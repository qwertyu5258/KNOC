package kr.co.knoc.tags;

import javax.servlet.jsp.tagext.*;

public class LoopTagExtraInfo extends TagExtraInfo {
	public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]
        {
            new VariableInfo(data.getAttributeString("loopId"),
                data.getAttributeString("className"),
                true,
                VariableInfo.NESTED)
        };
    }
}
