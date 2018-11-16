package com.szjm.controller.zlpapp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import spiderman.util.base.BaseUtil;

import com.google.gson.Gson;
import com.szjm.controller.base.BaseController;

public class BaseAppController extends BaseController {
	/**
	 * 向客户端写出JSON数据
	 * @param response
	 * @param status
	 * @param message
	 * @param content
	 */
	public void WriteClientMessage(HttpServletResponse response,String status,String message,Object content){
		try {
			response.setContentType("text/plain");
	        response.setHeader("Cache-Control", "no-cache");
	        response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            Gson gson=new Gson();
            if(content==null){
            	content= new Object();
            }
            writer.print(gson.toJson(WriteClientMessage(status, message, content)));
        } catch (IOException e){
        	BaseUtil.getLogger().error("出错!",e);
        }
	}
	/**
	 * 返回客户端信息实体
	 * @param status
	 * @param message
	 * @param content
	 * @return
	 */
	protected Object WriteClientMessage(String status,String message,Object content){
		return new ClientMessage(status, message, content);
	}
	/**
	 * 返回客户端信息实体
	 * @author Administrator
	 *
	 */
	class ClientMessage{

		public ClientMessage(String status, String message, Object content) {
			super();
			this.status = status;
			this.message = message;
			this.content = content;
		}
		/**
		 * 状态码,0为成功
		 */
		private String status;
		/**
		 * 信息描述
		 */
		private String message;
		/**
		 * 返回内容
		 */
		private Object content;
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
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
