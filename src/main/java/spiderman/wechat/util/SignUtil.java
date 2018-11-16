package spiderman.wechat.util;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import spiderman.exception.runtime.system.FrameworkException;
import spiderman.util.base.StringUtil;
import spiderman.util.digest.Md5Util;
import spiderman.util.digest.Sha1Util;
import spiderman.util.digest.Sha256Util;
import spiderman.util.reflect.ReflectUtil;
import spiderman.wechat.config.WechatConfig;
import spiderman.wechat.domain.callback.PayCallBack;
import spiderman.wechat.domain.param.CompanyPayQuerySend;
import spiderman.wechat.domain.param.CompanyPaySend;
import spiderman.wechat.domain.param.RedPacketSend;
import spiderman.wechat.domain.param.UnifiedOrderSend;
import spiderman.wechat.domain.result.JsApiTicket;
import spiderman.wechat.domain.result.UnifiedOrderResult;



public class SignUtil {
	/**
     * 验证签名
     *
     * @param signature
     * @param timestamp
     * @param nonce
     * @return
     */
    public static boolean checkSignature(String signature, String timestamp, String nonce,String token) {
        String[] arr = new String[] { token, timestamp, nonce };
        Arrays.sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }
        String sha1Digest = Sha1Util.sha1Digest(content.toString());
        content = null;
		return sha1Digest.equals(signature.toLowerCase());
    }

    /**
     * 签名下单结果,供网页端支付调用
     * @param unifiedOrder
     * @return
     */
    public static Map<String, Object> signOrderResult4JsApi(UnifiedOrderResult unifiedOrder) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("appId", WechatConfig.appID);
		Long value = (Long)(new Date().getTime()/1000);
		map.put("timeStamp", value);
		map.put("nonceStr", Md5Util.Md5Digest("sted"+value));
		map.put("package", "prepay_id="+unifiedOrder.getPrepay_id());
		map.put("signType", "MD5");
		map.put("paySign", SignUtil.signMap(map, "MD5",true).toUpperCase());
		return map;
	}
    /**
     * 签名小程序下单结果,供小程序支付调用
     * @param unifiedOrder
     * @return
     */
    public static Map<String, Object> signXOrderResult4JsApi(UnifiedOrderResult unifiedOrder) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("appId", WechatConfig.xappID);
		Long value = (Long)(new Date().getTime()/1000);
		map.put("timeStamp", value);
		map.put("nonceStr", Md5Util.Md5Digest("sted"+value));
		map.put("package", "prepay_id="+unifiedOrder.getPrepay_id());
		map.put("signType", "MD5");
		map.put("paySign", SignUtil.signMap(map, "MD5",true).toUpperCase());
		return map;
	}
    /**
     * 签名下单结果,供app支付调用
     * @param unifiedOrder
     * @return
     */
    /*public static Map<String, Object> signOrderResult4App(UnifiedOrderResult unifiedOrder) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("appid", WechatConfig.appID);
    	map.put("partnerid", WechatConfig.mchId);
    	map.put("package", "Sign=WXPay");
    	Long value = (Long)(new Date().getTime()/1000);
    	map.put("noncestr", Md5Util.Md5Digest("sted"+value));
    	map.put("timestamp", value);
    	map.put("prepayid", unifiedOrder.getPrepay_id());
    	map.put("sign", SignUtil.signMap(map, "MD5",true).toUpperCase());
    	return map;
    }*/
    /**
     * 签名下单结果,供app支付调用
     * @param unifiedOrder
     * @return
     */
    public static Map<String, Object> signOrderResult4App(UnifiedOrderResult unifiedOrder) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("appid", WechatConfig.openAppID);
    	map.put("partnerid", WechatConfig.openMchId);
    	map.put("package", "Sign=WXPay");
    	Long value = (Long)(new Date().getTime()/1000);
    	map.put("noncestr", Md5Util.Md5Digest("sted"+value));
    	map.put("timestamp", value);
    	map.put("prepayid", unifiedOrder.getPrepay_id());
    	map.put("sign", SignUtil.signMap(map, "MD5",true).toUpperCase());
    	return map;
    }

    /**
     * 对发放红包的实体类进行签名
     * @param redPacketSend
     * @return
     */
    public static String signRedPacketSend(RedPacketSend redPacketSend){
    	redPacketSend.setNonce_str(StringUtil.getSecureRandomString());
    	redPacketSend.setWxappid(WechatConfig.appID);
    	Map<String, Object> field2Map = ReflectUtil.field2Map(redPacketSend);
		String string = sortAndAppendMap(field2Map);
		string+="&key="+WechatConfig.apiKey;
		String sign = Md5Util.Md5Digest(string).toUpperCase();
		redPacketSend.setSign(sign);
		return sign;
    }
    /**
     * 对企业付款进行签名
     * @param companyPaySend
     * @return
     */
    public static String signCompanyPaySend(CompanyPaySend companyPaySend){
    	companyPaySend.setNonce_str(StringUtil.getSecureRandomString());
    	Map<String, Object> field2Map = ReflectUtil.field2Map(companyPaySend);
		String string = sortAndAppendMap(field2Map);
		string+="&key="+WechatConfig.apiKey;
		String sign = Md5Util.Md5Digest(string).toUpperCase();
		companyPaySend.setSign(sign);
		return sign;
    }
    /**
     * 对企业付款进行签名
     * @param companyPaySend
     * @return
     */
    public static String signOpenCompanyPaySend(CompanyPaySend companyPaySend){
    	companyPaySend.setNonce_str(StringUtil.getSecureRandomString());
    	Map<String, Object> field2Map = ReflectUtil.field2Map(companyPaySend);
		String string = sortAndAppendMap(field2Map);
		string+="&key="+WechatConfig.openApiKey;
		String sign = Md5Util.Md5Digest(string).toUpperCase();
		companyPaySend.setSign(sign);
		return sign;
    }
    /**
     * 对企业付款查询进行签名
     * @param companyPaySend
     * @return
     */
    public static String signCompanyPayQuerySend(CompanyPayQuerySend companyPayQuerySend){
    	companyPayQuerySend.setNonce_str(StringUtil.getSecureRandomString());
    	Map<String, Object> field2Map = ReflectUtil.field2Map(companyPayQuerySend);
		String string = sortAndAppendMap(field2Map);
		string+="&key="+WechatConfig.apiKey;
		String sign = Md5Util.Md5Digest(string).toUpperCase();
		companyPayQuerySend.setSign(sign);
		return sign;
    }
    /**
     * 对扫描支付回调实体类进行签名
     * @param redPacketSend
     * @return
     */
    public static String signScanPayCallBack(PayCallBack scanPayCallBack){
    	Map<String, Object> field2Map = ReflectUtil.field2Map(scanPayCallBack);
    	String string = sortAndAppendMap(field2Map);
    	string+="&key="+WechatConfig.apiKey;
    	String sign = Md5Util.Md5Digest(string).toUpperCase();
    	scanPayCallBack.setSign(sign);
    	return sign;
    }
    /**
     * 对统一下单的实体类进行签名
     * @param redPacketSend
     * @return
     */
    public static String signUnifiedOrderSend(UnifiedOrderSend unifiedOrderSend){
    	unifiedOrderSend.setNonce_str(StringUtil.getSecureRandomString());
    	unifiedOrderSend.setAppid(WechatConfig.appID);
    	Map<String, Object> field2Map = ReflectUtil.field2Map(unifiedOrderSend);
    	String string = sortAndAppendMap(field2Map);
    	string+="&key="+WechatConfig.apiKey;
    	String sign = Md5Util.Md5Digest(string).toUpperCase();
    	unifiedOrderSend.setSign(sign);
    	return sign;
    }
    /**
     * 对小程序统一下单的实体类进行签名
     * @param redPacketSend
     * @return
     */
    public static String signXUnifiedOrderSend(UnifiedOrderSend unifiedOrderSend){
    	unifiedOrderSend.setNonce_str(StringUtil.getSecureRandomString());
    	unifiedOrderSend.setAppid(WechatConfig.xappID);
    	Map<String, Object> field2Map = ReflectUtil.field2Map(unifiedOrderSend);
    	String string = sortAndAppendMap(field2Map);
    	string+="&key="+WechatConfig.apiKey;
    	String sign = Md5Util.Md5Digest(string).toUpperCase();
    	unifiedOrderSend.setSign(sign);
    	return sign;
    }
    /**
     *
     * @param unifiedOrderSend
     * @return
     */
    public static String signAUnifiedOrderSend(UnifiedOrderSend unifiedOrderSend){
    	unifiedOrderSend.setNonce_str(StringUtil.getSecureRandomString());
    	unifiedOrderSend.setAppid(WechatConfig.openAppID);
    	Map<String, Object> field2Map = ReflectUtil.field2Map(unifiedOrderSend);
    	String string = sortAndAppendMap(field2Map);
    	string+="&key="+WechatConfig.openApiKey;
    	String sign = Md5Util.Md5Digest(string).toUpperCase();
    	unifiedOrderSend.setSign(sign);
    	return sign;
    }

    public static String signMap(Map<String, Object> map,String signType) {
    	return signMap(map, signType, false);
    }

	public static String signMap(Map<String, Object> map,String signType,boolean appendMurchKey) {
    	String sortAndAppendMap = sortAndAppendMap(map);
    	if (appendMurchKey) {
			sortAndAppendMap += "&key="+WechatConfig.apiKey;
		}
    	signType = signType.toUpperCase();
    	if ("MD5".equals(signType)) {
			return Md5Util.Md5Digest(sortAndAppendMap);
		}else if("SHA1".equals(signType)){
			return Sha1Util.sha1Digest(sortAndAppendMap);
		}else if("SHA256".equals(signType)){
			return Sha256Util.sha256Digest(sortAndAppendMap);
		}else {
			throw new FrameworkException("找不到"+signType+"加密算法！");
		}
    }
    public static String signObj(Object object,String signType,boolean appendMurchKey) {
    	return signMap(ReflectUtil.field2Map(object), signType, appendMurchKey);
    }
	public static String sortAndAppendMap(Map<String, Object> map) {
		Object[] array = map.keySet().toArray();
		Arrays.sort(array);
		StringBuffer sb = new StringBuffer();
		for (Object temp:array) {
			sb.append(temp).append("=").append(map.get(temp)).append("&");
		}
		String string = sb.substring(0, sb.length()-1).toString();
		return string;
	}

    /**
     * 验证签名
     *
     * @return
     */
    public static boolean checkSignature(HttpServletRequest request) {
    	// 微信加密签名
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        return SignUtil.checkSignature(signature, timestamp, nonce,WechatConfig.token);
    }
    /**
     * ticket签名
     * @param requestUrl
     * @return
     */
    public static Map<String,Object> getSignTicket(String requestUrl){
		String noncestr = UUID.randomUUID().toString().replace("-", "");
		JsApiTicket ticket=JsApiTicketUtil.getJsApiTicket();
		long timestamp = new Date().getTime();
		String params = "jsapi_ticket=" + ticket.getTicket() + "&noncestr=" + noncestr + "&timestamp=" + timestamp + "&url="+ requestUrl;
		String signature = "";
		System.out.println("params:" + params);
		try {
			MessageDigest crypt = MessageDigest.getInstance("SHA-1");
			crypt.reset();
			crypt.update(params.getBytes("UTF-8"));
			signature = bytesToHexString(crypt.digest());
			Map<String,Object> sign=new HashMap<String,Object>();
			sign.put("appid", WechatConfig.appID);
			sign.put("timestamp", timestamp);
			sign.put("noncestr", noncestr);
			sign.put("signature", signature);
			return sign;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
    public static String bytesToHexString(byte[] src){
	    StringBuilder stringBuilder = new StringBuilder("");
	    if (src == null || src.length <= 0) {
	        return null;
	    }
	    for (int i = 0; i < src.length; i++) {
	        int v = src[i] & 0xFF;
	        String hv = Integer.toHexString(v);
	        if (hv.length() < 2) {
	            stringBuilder.append(0);
	        }
	        stringBuilder.append(hv);
	    }
	    return stringBuilder.toString();
	}
}
