package spiderman.wechat.util;

import java.util.Date;

import spiderman.wechat.domain.result.AccessToken;
import spiderman.wechat.domain.result.XAccessToken;

public class XAccessTokenUtil {
	private static XAccessToken accessToken=null;
	/**
	 * 提前刷新秒数
	 */
	private static int tokenAdvanceRefreshTime=60*15;

	public static XAccessToken getAccessToken() {
		//测试用
		//accessToken = new AccessToken("Y1uAl61kMUGkouYxHcPcvRY955s1qtxB8ZsZ5yXAcxo4f188FnA4AgYZrRfZPmc-ET5KOadykyLcZxRgjqflFLkdOjbjnIhjqtWMhjCV2SQ4s3K1qu4wAushj3qs6xOFYFUcAIAFMB", 1500603762383l, 7200);
		if (accessToken == null) {
			accessToken = new XAccessToken("", 0, 0);
		}
		if(isAccessTokenValid(accessToken)){
			return accessToken;
		}else{
			accessToken=XWechatInterfaceInvokeUtil.getAccessToken();
		}
		return accessToken;
	}

	public static void setAccessToken(XAccessToken accessToken) {
		XAccessTokenUtil.accessToken = accessToken;
	}

	/**
	 * access_token是否还有效
	 * @return access_token是否还有效
	 */
	private static boolean isAccessTokenValid(XAccessToken data){
		if (data.getExpires_in() <= 0) {
			return false;
		}else {
			long timePastAfterGetAccessToken = new Date().getTime() - data.getAccess_token_getTime();
			if (timePastAfterGetAccessToken < (data.getExpires_in()-tokenAdvanceRefreshTime)*1000) {
				return true;
			}else {
				return false;
			}
		}
	}
}
