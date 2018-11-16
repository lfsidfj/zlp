package com.szjm.controller.weixin.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.szjm.controller.base.BaseController;
import com.szjm.util.PageData;

import spiderman.wechat.domain.param.UnifiedOrderSend;
import spiderman.wechat.domain.result.UnifiedOrderResult;
import spiderman.wechat.domain.result.WechatUser;
import spiderman.wechat.util.SignUtil;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;
/**
 * 微信页面例子
 * @author spiderman
 * 2017年5月12日下午2:02:57
 */
@Controller
@RequestMapping(value="/weixin/web/example")
public class WechatExample extends BaseController {
	/**
	 * 展示用户的昵称
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/myfistview")
	public ModelAndView myFistView(HttpServletRequest request){
		WechatUser user=(WechatUser) request.getSession().getAttribute("wechatUser");
		ModelAndView view=this.getModelAndView();
		String url="";
		if(request.getQueryString()!=null&&
				!"".equals(request.getQueryString())){
			url=request.getRequestURL()+"?"+request.getQueryString();
		}else{
			url=request.getRequestURL()+"";
		}
		Map<String,Object> sign=SignUtil.getSignTicket(url);
		view.addObject("myuser",user);
		view.addObject("sign",sign);
		view.setViewName("weixin/web/example/NewFile");
		return view;
	}
	@RequestMapping(value="/weixinPay")
	public ModelAndView weixinPay(HttpServletRequest request){
		ModelAndView view=this.getModelAndView();
		view.setViewName("weixin/web/example/weixinPay");
		return view;
	}
	/**
	 * 获取网页微信支付数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getWXPayData")
	@ResponseBody
	public Object getWXPayData(HttpServletRequest request){
		PageData pd=this.getPageData();
		UnifiedOrderSend send=new UnifiedOrderSend();
		send.setBody(pd.getString("body"));
		send.setOut_trade_no(pd.getString("out_trade_no"));
		send.setTotal_fee(Integer.valueOf(pd.getString("total_fee")));
		send.setSpbill_create_ip(this.getRequest().getLocalAddr());
		send.setTrade_type("JSAPI");
		send.setOpenid(getOpenId());
		UnifiedOrderResult result=WechatInterfaceInvokeUtil.unifiedOrder(send);
		Map<String, Object> data=SignUtil.signOrderResult4JsApi(result);
		return data;
	}
	protected String getOpenId(){
		WechatUser user=(WechatUser) this.getRequest().getSession().getAttribute("wechatUser");
		String openid=user.getOpenid();
		return openid;
	}
}
