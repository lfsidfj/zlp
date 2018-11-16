package spiderman.wechat.pay;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

public class ApplyCash {
	/**
	 * 微信提现
	 * @param request
	 * @param openid
	 * @param realName	微信真实姓名
	 * @param transactionId	商户交易号
	 * @param money	金额：分
	 * @return	微信返回的信息
	 */
	public static Map<String, String> getMoney(HttpServletRequest request,String openid,String realName,String transactionId,String money){
			
		    //String code = request.getParameter("code"); //这个code是微信调用这个servlet传过来的
		    //System.out.println("======code是===》 "+code);
		    /**
			 * 第１步：通过code获取openId
			 */
			String nonceStr = UUID.randomUUID().toString().replace("-",""); //随机字符串
			SortedMap<Object,Object> parameters = new TreeMap<Object,Object>(); //用于生成签名用的map
			LinkedHashMap<Object, Object> reqMap = new LinkedHashMap<Object, Object>(); //用于请求提现接的map
			
	        parameters.put("mch_appid", MPConfigUtils.APPID);
	        reqMap.put("mch_appid", MPConfigUtils.APPID);
	        
	        parameters.put("mchid", MPConfigUtils.MCH_ID);
	        reqMap.put("mchid", MPConfigUtils.MCH_ID);
	        
	         //随机字符串  随机字符串，不长于32位。推荐随机数生成算法
	        parameters.put("nonce_str", nonceStr);
	        reqMap.put("nonce_str", nonceStr);
	        
	        //这个订单号用于和微信通信的订单号，可以是某个商品的订单号，可以是区分某一类的订单号，保证唯一就行
	        String orderNo = new Random().nextInt(10)+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	        parameters.put("partner_trade_no", orderNo);
	        reqMap.put("partner_trade_no", orderNo);
	        
	        parameters.put("openid", openid);//用户的openid
	        reqMap.put("openid", openid);
	        if(realName==null||"".equals(realName.trim())){
	            parameters.put("check_name", "NO_CHECK");//不要求检察实名认证
	            reqMap.put("check_name", "NO_CHECK");
	        }else{
	            parameters.put("check_name", "FORCE_CHECK");//强制要求检察实名认证
	            reqMap.put("check_name", "FORCE_CHECK");
	            
	            parameters.put("re_user_name", realName);//收款用户名（这里必须要填写提现人的真实姓名）
	            reqMap.put("re_user_name", realName);
	        }
	        
	        //String money = "100";//金额，以分为单位（提现至少为 1元）
	        if(money.contains(".")){
	        	money=money.substring(0, money.indexOf("."));
	        }
	        parameters.put("amount", money);
	        reqMap.put("amount", money);
	        
	        parameters.put("desc", "用户申请提现");//操作信息说明
	        reqMap.put("desc", "用户申请提现");
	        
	        String ip = CommonUtil.getIpAddr(request);//操作ip地址
	        parameters.put("spbill_create_ip", ip);
	        reqMap.put("spbill_create_ip", ip);
	        
	        String sign = CommonUtil.createSign("UTF-8", parameters);
	        reqMap.put("sign", sign);
	        
	        String xmlStr = CommonUtil.getHttpsTransfer(reqMap);
			System.out.println(" 微信返回的参数：  =====>\r\n  "+xmlStr);
	        try {
	        	Map<String, String> map = CommonUtil.parseXml(xmlStr);
	        	if("SUCCESS".equals(map.get("return_code")) && "SUCCESS".equals(map.get("result_code"))){
	        		String wxOrderNo = map.get("payment_no"); //属于微信的订单号
	        		String partnerNo = map.get("partner_trade_no"); //商户交易订单号
	        		String succesTime = map.get("payment_time"); //微信企业付款成功时间
	        		String sucMoney = money; //微信企业付款成功时间
	    	        return map;
	        	}else{
	    	        return map;
	        	}
			} catch (Exception e) {
				e.printStackTrace();
    	        return null;
			}
	}
}
