package com.szjm.controller.app.alipay;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.szjm.controller.base.BaseController;


@Controller
@RequestMapping(value="/app/alipay/wappay")
public class AlipayController extends BaseController {
	@RequestMapping(value="/index")
	public ModelAndView index(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/index");
		return mv;
	}
	@RequestMapping(value="/close")
	public ModelAndView close(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/close");
		return mv;
	}
	@RequestMapping(value="/downloadurl")
	public ModelAndView downloadurl(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/downloadurl");
		return mv;
	}
	@RequestMapping(value="/notify_url")
	public ModelAndView notify_url(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/notify_url");
		return mv;
	}
	@RequestMapping(value="/pay")
	public ModelAndView pay() throws UnsupportedEncodingException{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/pay");
		return mv;
	}
	@RequestMapping(value="/query")
	public ModelAndView query(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/query");
		return mv;
	}
	@RequestMapping(value="/refund")
	public ModelAndView refund(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/refund");
		return mv;
	}
	@RequestMapping(value="/refundquery")
	public ModelAndView refundquery(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/refundquery");
		return mv;
	}
	@RequestMapping(value="/return_url")
	public ModelAndView return_url(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("alipay/wappay/return_url");
		return mv;
	}
}
