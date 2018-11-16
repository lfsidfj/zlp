package spiderman.wechat.util;

import java.util.Date;

import spiderman.wechat.domain.result.JsApiTicket;

public class JsApiTicketUtil {
	private static JsApiTicket jsApiTicket=null;
	/**
	 * 提前刷新秒数
	 */
	private static int ticketAdvanceRefreshTime=60*15;

	public static JsApiTicket getJsApiTicket() {
		//测试用
		//accessToken = new AccessToken("Y1uAl61kMUGkouYxHcPcvRY955s1qtxB8ZsZ5yXAcxo4f188FnA4AgYZrRfZPmc-ET5KOadykyLcZxRgjqflFLkdOjbjnIhjqtWMhjCV2SQ4s3K1qu4wAushj3qs6xOFYFUcAIAFMB", 1500603762383l, 7200);
		if (jsApiTicket == null) {
			jsApiTicket = new JsApiTicket("", 0, 0);
		}
		if(isJsApiTicketValid(jsApiTicket)){
			return jsApiTicket;
		}else{
			jsApiTicket=WechatInterfaceInvokeUtil.getJsApiTicket();
		}
		return jsApiTicket;
	}

	public static void setAccessToken(JsApiTicket jsApiTicket) {
		JsApiTicketUtil.jsApiTicket = jsApiTicket;
	}

	/**
	 * access_token是否还有效
	 * @return access_token是否还有效
	 */
	private static boolean isJsApiTicketValid(JsApiTicket data){
		if (data.getExpires_in() <= 0) {
			return false;
		}else {
			long timePastAfterGetAccessToken = new Date().getTime() - data.getTicket_getTime();
			if (timePastAfterGetAccessToken < (data.getExpires_in()-ticketAdvanceRefreshTime)*1000) {
				return true;
			}else {
				return false;
			}
		}
	}
}
