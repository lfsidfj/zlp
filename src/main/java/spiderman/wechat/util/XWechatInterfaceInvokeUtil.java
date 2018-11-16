package spiderman.wechat.util;

import java.util.Date;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import spiderman.util.base.BaseUtil;
import spiderman.util.digest.Md5Util;
import spiderman.util.http.HttpUtil;
import spiderman.wechat.config.WechatConfig;
import spiderman.wechat.config.WechatConstantParamter;
import spiderman.wechat.domain.param.OrderQueryParam;
import spiderman.wechat.domain.param.RefundQuerySend;
import spiderman.wechat.domain.param.RefundSend;
import spiderman.wechat.domain.param.UnifiedOrderSend;
import spiderman.wechat.domain.param.XSessionKeyResult;
import spiderman.wechat.domain.param.XTemplateMessageSend;
import spiderman.wechat.domain.result.BaseWechatResult;
import spiderman.wechat.domain.result.OrderQueryResult;
import spiderman.wechat.domain.result.RefundQueryResult;
import spiderman.wechat.domain.result.RefundResult;
import spiderman.wechat.domain.result.UnifiedOrderResult;
import spiderman.wechat.domain.result.WechatResult;
import spiderman.wechat.domain.result.XAccessToken;

import com.google.gson.Gson;

/**
 * 微信小程序接口调用工具类
 * @author 战马
 *
 */
@SuppressWarnings("deprecation")
public class XWechatInterfaceInvokeUtil {
	private static final Logger log = LoggerFactory.getLogger(XWechatInterfaceInvokeUtil.class);

	/**
	 * 把AppID，AppSecret,ACCESS_TOKEN装配到url
	 * @param url
	 * @return
	 */
	public static String fitParam2Url(String url){
		String temp = url.replaceAll("#APPID#", WechatConfig.xappID);
		if (temp.contains("#ACCESS_TOKEN#")) {
			temp = temp.replaceAll("#ACCESS_TOKEN#", XAccessTokenUtil.getAccessToken().getAccess_token());
		}
		return temp.replaceAll("#SECRET#", WechatConfig.xappSecret);
	}

	/**
	 * 从微信服务器获取accessToken,不会缓存accessToken，
	 * 请调用steed.util.wechat.AccessTokenUtil
	 * @see steed.util.wechat.AccessTokenUtil
	 */
	public static XAccessToken getAccessToken(){
		String url = XWechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.getAccessTokenUrl);
		String json = HttpUtil.getRequestString(HttpUtil.http_get, url, null, null);
		XAccessToken data = new Gson().fromJson(json, XAccessToken.class);
		data.setAccess_token_getTime(new Date().getTime());
		log.debug("accessToken----->"+data.getAccess_token());
		return data;
	}
	/**
	 * 获取小程序用户openid和session_key
	 *author:Spiderman
	 * @param code
	 * @return
	 */
	public static XSessionKeyResult getSessionKey(String code){
		String url = XWechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.getSessionKeyUrl).replaceAll("#JSCODE#", code);
		String json = HttpUtil.getRequestString(HttpUtil.http_get, url, null, null);
		return BaseUtil.parseJson(json, XSessionKeyResult.class);
	}
	/**
	 * 统一下单接口
	 * @return
	 */
	public static UnifiedOrderResult unifiedOrder(UnifiedOrderSend unifiedOrderSend){
		unifiedOrderSend.setAppid(WechatConfig.xappID);
		unifiedOrderSend.setMch_id(WechatConfig.xMchId);
		unifiedOrderSend.setNotify_url(WechatConfig.xNotifyUrl);
		SignUtil.signXUnifiedOrderSend(unifiedOrderSend);
		String redPacketSendMessageToXml = MessageUtil.toXml(unifiedOrderSend);
		String xml=HttpUtil.getRequestString(HttpUtil.http_post,WechatConstantParamter.unifiedOrderUrl, null, null, redPacketSendMessageToXml);
		UnifiedOrderResult result=MessageUtil.fromXml(xml, UnifiedOrderResult.class);
		return result;
	}
	/**
	 * 订单查询接口
	 * @return
	 */
	public static OrderQueryResult queryOrder(OrderQueryParam orderQuerySend){
		orderQuerySend.setMch_id(WechatConfig.xMchId);
		orderQuerySend.setAppid(WechatConfig.xappID);
		orderQuerySend.setNonce_str(Md5Util.Md5Digest(new Date().getTime()+""+new Random().nextInt()));
		orderQuerySend.setSign(null);
		orderQuerySend.setSign(SignUtil.signObj(orderQuerySend, "MD5", true).toUpperCase());
		String orderQuerySendToXml = MessageUtil.toXml(orderQuerySend);
		log.debug("查询订单接口，发送数据----->{}",new Object[]{orderQuerySendToXml});
		try {
			return MessageUtil.fromXml(HttpUtil.getRequestString(HttpUtil.http_post,WechatConstantParamter.queryOrderUrl, null, null, orderQuerySendToXml),OrderQueryResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 退款接口
	 * @return
	 */
	public static RefundResult refund(RefundSend refundSend){
		refundSend.setAppid(WechatConfig.xappID);
		refundSend.setMch_id(WechatConfig.xMchId);
		refundSend.setOp_user_id(WechatConfig.xMchId);
		refundSend.setNonce_str(Md5Util.Md5Digest(new Date().getTime()+""+new Random().nextInt()));
		refundSend.setSign(null);
		refundSend.setSign(SignUtil.signObj(refundSend, "MD5", true));
		String redPacketSendMessageToXml = MessageUtil.toXml(refundSend);
		try {
			return MessageUtil.fromXml(HttpUtil.getRequestString(fitParam2Url(WechatConstantParamter.refundtUrl), null, null, redPacketSendMessageToXml, WechatConfig.certPath, WechatConfig.mchId),RefundResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 退款查询
	 * @param refundQuerySend
	 * @return
	 */
	public static RefundQueryResult refundQuery(RefundQuerySend refundQuerySend){
		refundQuerySend.setMch_id(WechatConfig.xMchId);
		refundQuerySend.setAppid(WechatConfig.xappID);
		refundQuerySend.setNonce_str(Md5Util.Md5Digest(new Date().getTime()+""+new Random().nextInt()));
		refundQuerySend.setSign(null);
		refundQuerySend.setSign(SignUtil.signObj(refundQuerySend, "MD5", true).toUpperCase());
		String refundQuerySendToXml = MessageUtil.toXml(refundQuerySend);
		log.debug("查询订单接口，发送数据----->{}",new Object[]{refundQuerySendToXml});
		try {
			return MessageUtil.fromXml(HttpUtil.getRequestString(HttpUtil.http_post,WechatConstantParamter.refundQuerytUrl, null, null, refundQuerySendToXml),RefundQueryResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 发送模板消息
	 * @param send
	 * @return
	 */
	public static BaseWechatResult sendTemplateMessage(XTemplateMessageSend send){
		return invokeWechatInterface(send, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.sendTemplateMessageUrl));
	}
	/**
	 *
	 * @param objSend
	 * @param clazz
	 * @param url
	 * @return
	 */
	private static <T extends WechatResult> T invokeWechatInterface(Object objSend,Class<T> clazz,String url){
		String requestString = HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(url), null, null, BaseUtil.getJson(objSend));
		return BaseUtil.parseJson(requestString, clazz);
	}
}
