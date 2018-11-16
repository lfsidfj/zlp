package com.szjm.controller.weixin.miniprogram;

import spiderman.wechat.domain.param.XSessionKeyResult;
import spiderman.wechat.util.XSessionUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.service.system.wechat.wechatuser.WechatUserManager;
import com.szjm.util.PageData;

public class XBaseController extends BaseController {
	/**
	 * 获取当前用户session
	 * @return
	 */
	public XSessionKeyResult getCurrentUserSession(){
		PageData pd=this.getPageData();
		if(pd.get("token")!=null){
			return XSessionUtil.getUserData(pd.get("token").toString().replaceAll(" ", "+"));
		}else{
			return null;
		}
	}
	/**
	 * 获取当前用户
	 * @param wechatuserService
	 * @return
	 * @throws Exception
	 */
	public PageData getCurrentUser(WechatUserManager wechatuserService) throws Exception{
		String openid = getCurrentUserOpenId();
		if(openid!=null){
			PageData pd=new PageData();
			pd.put("OPENID", openid);
			return wechatuserService.findById(pd);
		}else{
			return null;
		}
	}
	/**
	 * 获取当前用户OPNEID
	 * @return
	 */
	public String getCurrentUserOpenId(){
		XSessionKeyResult session = getCurrentUserSession();
		if(session!=null){
			return session.getOpenid();
		}else{
			return null;
		}
	}
	/**
	 * 返回客户端信息实体
	 * @param status
	 * @param message
	 * @param content
	 * @return
	 */
	protected Object ClientMessage(int errCode,String message,Object content){
		message=message!=null?message:"成功";
		return new ClientMessage(errCode, message, content);
	}
	protected Object ClientMessage(boolean success,String message,Object content){
		message=message!=null?message:"成功";
		return new ClientMessage(success?0:-1, success?message:"系统繁忙", content);
	}
	/**
	 * 返回客户端信息实体
	 * @author Administrator
	 *
	 */
	class ClientMessage{

		public ClientMessage(int errCode, String message, Object content) {
			super();
			this.errCode = errCode;
			this.message = message;
			this.content = content;
		}
		/**
		 * 状态码,0为成功
		 */
		private int errCode;
		/**
		 * 信息描述
		 */
		private String message;
		/**
		 * 返回内容
		 */
		private Object content;

		public int getErrCode() {
			return errCode;
		}
		public void setErrCode(int errCode) {
			this.errCode = errCode;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public Object getContent() {
			return content;
		}
		public void setContent(Object content) {
			this.content = content;
		}

	}
}
