package spiderman.wechat.pay;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import spiderman.util.http.HttpUtil;
import spiderman.wechat.domain.param.OrderQueryParam;
import spiderman.wechat.domain.result.OrderQueryResult;
import spiderman.wechat.util.MessageUtil;

public class WechatPay {
	
	public SortedMap<Object,Object> getWeiXinPayParams(String openId,String money,HttpServletRequest request,String orderNo,String trade_type){
		
		/**
		 * 第３步：获取签名，把签名与PayInfo中的其他数据转成XML格式，当做参数传递给统一下单地址
		 */
		String nonceStr = UUID.randomUUID().toString().replace("-",""); //随机字符串
		//String ip = CommonUtil.getIpAddr(request);
		
		SortedMap<Object,Object> parameters = new TreeMap<Object,Object>();
		//公众账号ID  微信分配的公众账号ID（企业号corpid即为此appId）
        parameters.put("appid", MPConfigUtils.APPID);
         //商户号    微信支付分配的商户号
        parameters.put("mch_id", MPConfigUtils.MCH_ID);
         //随机字符串  随机字符串，不长于32位。推荐随机数生成算法
        parameters.put("nonce_str", nonceStr);
         //商品描述  商品或支付单简要描述
        parameters.put("body", "商品描述");
        parameters.put("out_trade_no", orderNo);//商品订单号
        parameters.put("total_fee", money);//订单总金额
        //parameters.put("total_fee", "1");//订单总金额
        parameters.put("spbill_create_ip",request.getRemoteHost());
        parameters.put("notify_url", MPConfigUtils.NOTIFY_URL);
        Calendar start=Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String time_start =sdf.format(start.getTimeInMillis());
        //交易起始时间  订单生成时间，格式为yyyyMMddHHmmss，如2009年12月25日9点10分10秒表示为20091225091010。其他详见时间规则
        parameters.put("time_start", time_start);
        //订单失效时间 订单失效时间为下单后30分钟，30分钟未支付则一律作废，如果有需求可以调整时间
        Calendar expire=Calendar.getInstance();
        int cont = 30;
        expire.add(Calendar.MINUTE,cont);
        String time_expire=sdf.format(expire.getTimeInMillis());
         //交易结束时间   订单失效时间，格式为yyyyMMddHHmmss，如2009年12月27日9点10分10秒表示为20091227091010。其他详见时间规则注意：最短失效时间间隔必须大于5分钟
        parameters.put("time_expire", time_expire);
        //交易类型    取值如下：JSAPI，NATIVE，APP，WAP,详细说明见参数规定
        parameters.put("trade_type", trade_type);
         //用户标识  trade_type=JSAPI，此参数必传，用户在商户appid下的唯一标识。
        //openid如何获取，可参考【获取openid】
        parameters.put("openid", openId);
        String sign = CommonUtil.createSign("UTF-8", parameters);
        parameters.put("sign", sign);
        String requestXML = CommonUtil.getRequestXml(parameters);
		System.out.println("生成的签名是： "+sign);
		/**
		 * 第４步：调用统一下单地址
		 */
		Map<String, String> map = CommonUtil.httpsRequestToXML(MPConfigUtils.UNIFIED_ORDER_URL, "POST", requestXML.replace("__", "_").replace("<![CDATA[", "").replace("]]>", ""));
		/**
		 * 第５步：获取 prepay_Id 预支付ID
		 */
		String return_code = map.get("return_code");
	    if(return_code!=null && return_code.length()>0 && "SUCCESS".equals(return_code)){
	    	String return_msg = map.get("return_msg");
		     if(return_msg!=null && return_msg.length()>0 && !return_msg.equals("OK")) {
		    	 System.out.println("统一下单错误！return_msg的值为："+return_msg);
		     }
		 }else{
			 System.out.println("统一下单错误！return_code 为空或不为SUCCESS "+return_code);
		 }
		 String prepay_id = map.get("prepay_id");
		 
		 /**
		  * 第６步：跳转到我们系统的支付界面
		  * 再次生成签名
		  */
		 String userAgent = request.getHeader("user-agent");
		 char agent = userAgent.charAt(userAgent.indexOf("MicroMessenger")+15);  
		 //JSONObject json = new JSONObject();
         SortedMap<Object,Object> params = new TreeMap<Object,Object>();
         if (prepay_id!=""||prepay_id!=null) {
             //生成时间戳
             String timestamp=Long.toString(new Date().getTime()).substring(0, 10);
             params.put("appId", MPConfigUtils.APPID);
             params.put("timeStamp", timestamp);
             params.put("nonceStr",  nonceStr);
             params.put("package", "prepay_id="+prepay_id);
             params.put("signType", "MD5");
             String paySign =  CommonUtil.createSign("UTF-8", params);
             params.put("packageValue", "prepay_id="+prepay_id);    //这里用packageValue是预防package是关键字在js获取值出错
             params.put("paySign", paySign);                     //paySign的生成规则和Sign的生成规则一致
             params.put("agent", agent);//微信版本号，用于前面提到的判断用户手机微信的版本是否是5.0以上版本。

             params.put("prepay_id", prepay_id);
             //params.put("nonceStr", nonceStr);
         }else {
        	 //this.getRequest().setAttribute("json", json);
         }
		return params;
	}
	
	public static boolean check(String out_trade_no){
		OrderQueryParam oq=new OrderQueryParam();
		SortedMap<Object,Object> params = new TreeMap<Object,Object>();
		params.put("appid", MPConfigUtils.APPID);
		params.put("mch_id", MPConfigUtils.MCH_ID);
		params.put("nonce_str", "ec2316275641faa3aacf3cc599e8730f");
		params.put("out_trade_no", out_trade_no);
		String sign=CommonUtil.createSign("UTF-8", params);
		oq.setAppid(MPConfigUtils.APPID);
		oq.setMch_id(MPConfigUtils.MCH_ID);
		oq.setNonce_str("ec2316275641faa3aacf3cc599e8730f");
		oq.setOut_trade_no(out_trade_no);
		oq.setSign(sign);
		String orderQuerySendToXml = MessageUtil.toXml(oq);
		String result=HttpUtil.getRequestString(HttpUtil.http_post, "https://api.mch.weixin.qq.com/pay/orderquery", null, null,orderQuerySendToXml);
		//LogUtil.saveLog(null, result, "成功");
		try {
			OrderQueryResult re=MessageUtil.fromXml(result,OrderQueryResult.class);
			System.out.println(re);
			if("SUCCESS".equals(re.getReturn_code())&&"SUCCESS".equals(re.getResult_code())){
				if("SUCCESS".equals(re.getTrade_state())){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}
