package com.szjm.controller.zlpapi;

import com.szjm.controller.zlpapp.BaseAppController;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
/**
 * API接口类
 * @author
 *
 */
@Controller
@RequestMapping(value="app/Api")
public class LshCenterApi extends BaseAppController {
	@Resource(name = "lshuserService")
	private LshUserManager appuserService;// 用户
	/**
	 *      个人中心  center_index
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_index")
	public void user_index(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdUser = appuserService.findById(pd);
		Map<String,Object> content=new HashMap<String,Object>();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		//昵称
		content.put("NICK_NAME", pdUser.get("NICK_NAME"));
		//头像
		content.put("PATH", basePath+"uploadFiles/uploadImgs/"+pdUser.get("PATH"));
		//角色
		if("common".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "普通用户");
		}
		if("agent".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "代理商");
		}
		if("partner".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "合伙人");
		}
		if("members".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "付费会员");
		}
		if("vip".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "VIP会员");
		}
		//性别
		if("0".equals(pdUser.get("SEX").toString())){
			content.put("SEX", "未知");
		}
		if("1".equals(pdUser.get("SEX").toString())){
			content.put("SEX", "男");
		}
		if("2".equals(pdUser.get("SEX").toString())){
			content.put("SEX", "女");
		}
		//礼豆数量
		content.put("INTEGRATION", pdUser.get("INTEGRATION"));
		//余额数量
		content.put("MONEY", pdUser.get("MONEY"));
		WriteClientMessage(response,"0", "成功", content);
	}
}
