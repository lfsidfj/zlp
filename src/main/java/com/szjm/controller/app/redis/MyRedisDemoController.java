package com.szjm.controller.app.redis;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szjm.controller.base.BaseController;
import com.szjm.util.AppUtil;
import com.szjm.util.PageData;
import com.szjm.util.redis.RedisCommand;

/** RedisDemo
 * @author 
 * 2016.5.8
 */
@Controller
@RequestMapping(value="/appMyRedisDemo")
public class MyRedisDemoController extends BaseController{
	
	@Resource(name = "redisHandle")
	private RedisCommand redisHandle;
	
	/**
	 * 请讲接口 http://127.0.0.1:8080/项目名称/appRedisDemo/redisDemo.do
	 * demo展示的在redis存储读取数据的方式，本系统暂时用不到redis，此redis接口可根据实际业务需求选择使用
	 * 具体redis的应用场景->百度下即可
	 */
	@RequestMapping(value="/redisDemo")
	@ResponseBody
	public Object redis(){
		
		Map<String,Object> map = new HashMap<String,Object>();
		String result = "";
		if(redisHandle.exists("csp")){
			System.out.println(redisHandle.get("csp"));
		}else{
			redisHandle.set("csp", "kb");
			System.out.println("设置完成");
		}
		return AppUtil.returnObject(new PageData(), map);
	}

}
