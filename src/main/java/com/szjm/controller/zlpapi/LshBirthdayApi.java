package com.szjm.controller.zlpapi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.szjm.controller.zlpapp.BaseAppController;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.memorialday.MemorialDayManager;
import com.szjm.service.zlp.userbrithday.UserBrithdayManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
/**
 * API接口类
 * @author
 *
 */
@Controller
@RequestMapping(value="app/Api")
public class LshBirthdayApi extends BaseAppController {
	@Resource(name = "lshuserService")
	private LshUserManager appuserService;// 用户
	@Resource(name="userbrithdayService")
	private UserBrithdayManager userbrithdayService;//用户生日
	@Resource(name="memorialdayService")
	private MemorialDayManager memorialdayService;//纪念日
	/**
	 * 生日
	 */
	@RequestMapping(value = "/user_brithday")
	public void user_brithday(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		String appUserRole = Jurisdiction.getAppUserRole();
		pd.put("USER_ID",user_id);
		List<PageData>	varList = userbrithdayService.listAll(pd);	//列出UserBrithday列表
		List<PageData> listAll = memorialdayService.listAll(pd); //纪念日列表
		Map<String,Object> content=new HashMap<String,Object>();
		List<Object> listB=new ArrayList<Object>();
		List<Object> listM=new ArrayList<Object>();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		//列出UserBrithday列表
		for (PageData pageData : varList) {
			Map<String,Object> contentNew=new HashMap<String,Object>();
			//头像
			if(pageData.get("PATH")!=null){
				contentNew.put("PATH", basePath+"uploadFiles/uploadImgs/"+pageData.get("PATH"));
			}else{
				contentNew.put("PATH", "");
			}
			contentNew.put("PRESENT", 0);
			if(appUserRole.equals("agent") || appUserRole.equals("partner")){
				if(pageData.get("REMIND_TYPE") != null && Integer.parseInt(pageData.get("REMIND_TYPE").toString()) == 0){
					if(pageData.get("NEXT_SB_DAYS")!= null && (Integer.parseInt( pageData.get("NEXT_SB_DAYS").toString()) >= 0  && Integer.parseInt( pageData.get("NEXT_SB_DAYS").toString()) <= 1 )){
						contentNew.put("PRESENT", 1);
					}
				}
				if(pageData.get("REMIND_TYPE") != null && Integer.parseInt(pageData.get("REMIND_TYPE").toString()) == 1){
					if(pageData.get("NEXT_LB_DAYS")!= null &&  (Integer.parseInt( pageData.get("NEXT_LB_DAYS").toString()) >= 0 && Integer.parseInt( pageData.get("NEXT_LB_DAYS").toString()) <= 1 )){
						contentNew.put("PRESENT", 1);
					}
				}
				if(pageData.get("REMIND_TYPE") != null && Integer.parseInt(pageData.get("REMIND_TYPE").toString()) == 2){
					if((pageData.get("NEXT_LB_DAYS") != null && Integer.parseInt( pageData.get("NEXT_LB_DAYS").toString()) >=0 && Integer.parseInt( pageData.get("NEXT_LB_DAYS").toString()) <=1) || (pageData.get("NEXT_SB_DAYS") != null && Integer.parseInt( pageData.get("NEXT_SB_DAYS").toString()) >= 0 && Integer.parseInt( pageData.get("NEXT_SB_DAYS").toString()) <= 1)){
						contentNew.put("PRESENT", 1);
					}
				}
			}
			//生日天数
			contentNew.put("BIRTHDAY_DAYS", pageData.get("BIRTHDAY_DAYS"));
			//昵称
			contentNew.put("NICK_NAME", pageData.get("NAME"));
			//电话
			contentNew.put("PHONE_NUMBER", pageData.get("PHONE_NUMBER"));
			//生日日期
			contentNew.put("SOLAR_BIRTHDAY", pageData.get("SOLAR_BIRTHDAY"));
			//关系
			contentNew.put("RELATIONSHIP", pageData.get("RELATIONSHIP"));
			//编号
			contentNew.put("BIRTHDAY_ID", pageData.get("BIRTHDAY_ID"));
			listB.add(contentNew);
		}
		for (PageData pageData : listAll) {
			Map<String,Object> contentNew=new HashMap<String,Object>();
			//日期
			contentNew.put("COMMEMORATE_DATE", pageData.get("COMMEMORATE_DATE"));
			//纪念日名称
			contentNew.put("NAME", pageData.get("NAME"));
			//编号
			contentNew.put("MEMORIALDAY_ID", pageData.get("MEMORIALDAY_ID"));
			//距离日期
			contentNew.put("DAYS", pageData.get("DAYS"));
			listM.add(contentNew);
		}
		content.put("brithdayList", listB);
		content.put("memorialdayList", listM);
		WriteClientMessage(response,"0", "成功", content);
	}
	
	@RequestMapping(value = "/my_brithday")
	public void my_brithday(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String,Object> contentNew=new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData userinfo = appuserService.findById(pd);
		String appUserRole = Jurisdiction.getAppUserRole();
		contentNew.put("NUMBER_DAYS", "9999");
		int number_days;
		if(userinfo.get("SOLAR_BIRTHDAY") == null){
			contentNew.put("NUMBER_DAYS", -1);
			contentNew.put("ROLE", appUserRole);
			WriteClientMessage(response,"0", "成功", contentNew);
			return;
		}
		if(userinfo.get("REMIND_TYPE") != null && Integer.parseInt(userinfo.get("REMIND_TYPE").toString()) == 0){
			if(userinfo.get("NEXT_SB_DAYS")!= null){
				contentNew.put("NUMBER_DAYS", userinfo.get("NEXT_SB_DAYS").toString());
			}
		}
		if(userinfo.get("REMIND_TYPE") != null && Integer.parseInt(userinfo.get("REMIND_TYPE").toString()) == 1){
			if(userinfo.get("NEXT_LB_DAYS")!= null){
				contentNew.put("NUMBER_DAYS", userinfo.get("NEXT_LB_DAYS").toString());
			} 
		}
		if(userinfo.get("REMIND_TYPE") != null && Integer.parseInt(userinfo.get("REMIND_TYPE").toString()) == 2){
			if(userinfo.get("NEXT_LB_DAYS") != null || userinfo.get("NEXT_SB_DAYS") != null){
				number_days=Integer.parseInt( userinfo.get("NEXT_LB_DAYS").toString())>Integer.parseInt( userinfo.get("NEXT_SB_DAYS").toString()) ? Integer.parseInt( userinfo.get("NEXT_SB_DAYS").toString()) :Integer.parseInt( userinfo.get("NEXT_LB_DAYS").toString()); 
				contentNew.put("NUMBER_DAYS", number_days);
			}
		}
		contentNew.put("ROLE", appUserRole);
		WriteClientMessage(response,"0", "成功", contentNew);
	}
}
