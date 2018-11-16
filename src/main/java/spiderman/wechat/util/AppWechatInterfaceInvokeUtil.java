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
import spiderman.wechat.domain.param.CompanyPaySend;
import spiderman.wechat.domain.param.RefundSend;
import spiderman.wechat.domain.param.UnifiedOrderSend;
import spiderman.wechat.domain.result.AccessToken;
import spiderman.wechat.domain.result.CompanyPayResult;
import spiderman.wechat.domain.result.PageAccessToken;
import spiderman.wechat.domain.result.RefundResult;
import spiderman.wechat.domain.result.UnifiedOrderResult;
import spiderman.wechat.domain.result.WechatResult;
import spiderman.wechat.domain.result.WechatUser;

import com.google.gson.Gson;

public class AppWechatInterfaceInvokeUtil {
	private static final Logger log = LoggerFactory.getLogger(AppWechatInterfaceInvokeUtil.class);
	/**
	 * 根据code拉取用户信息
	 */
	public static WechatUser pullUserInformation(String code){
		PageAccessToken pageAccessToken = getPageAccessToken(code);
		return pullUserInformation(pageAccessToken.getAccess_token(), pageAccessToken.getOpenid(), "zh_CN");
	}
	/**
	 * 拉取用户信息
	 * @param access_token
	 * @param openid
	 * @param lang 语言 一般传'zh_CN'
	 * @return
	 */
	public static WechatUser pullUserInformation(String access_token,String openid,String lang){
		String url = WechatConstantParamter.pullUserInformationUrl
			.replaceFirst("#PAGE_ACCESS_TOKEN#", access_token)
			.replaceFirst("#OPENID#", openid).replaceFirst("#LANG#", lang);
		String requestString = HttpUtil.getRequestString(HttpUtil.http_get, url, null, null, null);
		System.out.println(requestString);
		log.debug("拉取到的用户信息--->{}",requestString);
		return BaseUtil.parseJson(requestString, WechatUser.class);
	}
	/**
	 * 用code兑换PageAccessToken
	 * @param code
	 * @return
	 */
	public static PageAccessToken getPageAccessToken(String code){
		String url = WechatConstantParamter.getAuthorAssessTokenUrl
				.replaceAll("#APPID#", WechatConfig.openAppID)
				.replaceAll("#APPSECRET#", WechatConfig.openAppSecret)
				.replaceAll("#CODE#", code);
		String requestString = HttpUtil.getRequestString(HttpUtil.http_post, url, null, null, null);
		return BaseUtil.parseJson(requestString, PageAccessToken.class);
	}
	/**
	 * 统一下单接口
	 * @return
	 */
	public static UnifiedOrderResult unifiedOrder(UnifiedOrderSend unifiedOrderSend){
		unifiedOrderSend.setAppid(WechatConfig.openAppID);
		unifiedOrderSend.setMch_id(WechatConfig.openMchId);
		unifiedOrderSend.setNotify_url(WechatConfig.openNotifyUrl);
		SignUtil.signAUnifiedOrderSend(unifiedOrderSend);
		String redPacketSendMessageToXml = MessageUtil.toXml(unifiedOrderSend);
		String xml=HttpUtil.getRequestString(HttpUtil.http_post,WechatConstantParamter.unifiedOrderUrl, null, null, redPacketSendMessageToXml);
		UnifiedOrderResult result=MessageUtil.fromXml(xml, UnifiedOrderResult.class);
		return result;
	}
	public static RefundResult refund(RefundSend refundSend){
		refundSend.setAppid(WechatConfig.openAppID);
		refundSend.setMch_id(WechatConfig.openMchId);
		refundSend.setOp_user_id(WechatConfig.openMchId);
		refundSend.setNonce_str(Md5Util.Md5Digest(new Date().getTime()+""+new Random().nextInt()));
		refundSend.setSign(null);
		refundSend.setSign(SignUtil.signObj(refundSend, "MD5", true));
		String redPacketSendMessageToXml = MessageUtil.toXml(refundSend);
		try {
			return MessageUtil.fromXml(HttpUtil.getRequestString(fitParam2Url(WechatConstantParamter.refundtUrl), null, null, redPacketSendMessageToXml, WechatConfig.openCertPath, WechatConfig.openMchId),RefundResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 把AppID，AppSecret,ACCESS_TOKEN装配到url
	 * @param url
	 * @return
	 */
	public static String fitParam2Url(String url){
		String temp = url.replaceAll("#APPID#", WechatConfig.openAppID);
		if (temp.contains("#ACCESS_TOKEN#")) {
			temp = temp.replaceAll("#ACCESS_TOKEN#", AppAccessTokenUtil.getAccessToken().getAccess_token());
		}
		return temp.replaceAll("#APPSECRET#", WechatConfig.openAppSecret);
	}
	/**
	 * 从微信服务器获取accessToken,不会缓存accessToken，
	 * 请调用steed.util.wechat.AccessTokenUtil
	 * @see steed.util.wechat.AccessTokenUtil
	 */
	public static AccessToken getAccessToken(){
		String url = AppWechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.getAccessTokenUrl);
		String json = HttpUtil.getRequestString(HttpUtil.http_get, url, null, null);
		AccessToken data = new Gson().fromJson(json, AccessToken.class);
		data.setAccess_token_getTime(new Date().getTime());
		log.debug("accessToken----->"+data.getAccess_token());
		return data;
	}
	/**
	 * 企业付款
	 * @param companyPaySend
	 * @return
	 */
	public static CompanyPayResult companyPay(CompanyPaySend companyPaySend){
		companyPaySend.setMch_appid(WechatConfig.openAppID);
		companyPaySend.setMchid(WechatConfig.openMchId);
		SignUtil.signOpenCompanyPaySend(companyPaySend);
		String companyPaySendMessageToXml = MessageUtil.toXml(companyPaySend);
		try {
			String result=HttpUtil.getRequestString(fitParam2Url(WechatConstantParamter.companyPayUrl), null, null, companyPaySendMessageToXml, WechatConfig.openCertPath, WechatConfig.openMchId);
			return MessageUtil.fromXml(result, CompanyPayResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
