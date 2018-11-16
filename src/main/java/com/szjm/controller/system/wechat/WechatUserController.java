package com.szjm.controller.system.wechat;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spiderman.wechat.domain.param.GetBatchUserInfoSend;
import spiderman.wechat.domain.param.GetBatchUserInfoSend.User;
import spiderman.wechat.domain.result.UserListResult;
import spiderman.wechat.domain.result.WechatUserListResult;
import spiderman.wechat.domain.result.WechatUserResult;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatuser.WechatUserManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;

/** 
 * 说明：微信用户
 * 创建人：
 * 创建时间：2017-07-14
 */
@Controller
@RequestMapping(value="/wechatuser")
public class WechatUserController extends BaseController {
	
	String menuUrl = "wechatuser/list.do"; //菜单地址(权限用)
	@Resource(name="wechatuserService")
	private WechatUserManager wechatuserService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增WechatUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("WECHATUSER_ID", this.get32UUID());	//主键
		wechatuserService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除WechatUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		wechatuserService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改WechatUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		wechatuserService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表WechatUser");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = wechatuserService.list(page);	//列出WechatUser列表
		mv.setViewName("system/wechat/wechatuser/wechatuser_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/wechat/wechatuser/wechatuser_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = wechatuserService.findById(pd);	//根据ID读取
		mv.setViewName("system/wechat/wechatuser/wechatuser_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除WechatUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			wechatuserService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出WechatUser到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("OPENID");	//1
		titles.add("关注状态");	//2
		titles.add("昵称");	//3
		titles.add("性别");	//4
		titles.add("语言");	//5
		titles.add("城市");	//6
		titles.add("省份");	//7
		titles.add("国家");	//8
		titles.add("头像");	//9
		titles.add("关注时间");	//10
		titles.add("UNIONID");	//11
		titles.add("备注");	//12
		titles.add("分组");	//13
		titles.add("标签列表");	//14
		titles.add("添加时间");	//15
		dataMap.put("titles", titles);
		List<PageData> varOList = wechatuserService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("OPENID"));	    //1
			vpd.put("var2", varOList.get(i).get("SUBSCRIBE").toString());	//2
			vpd.put("var3", varOList.get(i).getString("NICKNAME"));	    //3
			vpd.put("var4", varOList.get(i).get("SEX").toString());	//4
			vpd.put("var5", varOList.get(i).getString("LANGUAGE"));	    //5
			vpd.put("var6", varOList.get(i).getString("CITY"));	    //6
			vpd.put("var7", varOList.get(i).getString("PROVINCE"));	    //7
			vpd.put("var8", varOList.get(i).getString("COUNTRY"));	    //8
			vpd.put("var9", varOList.get(i).getString("HEADIMGURL"));	    //9
			vpd.put("var10", varOList.get(i).getString("SUBSCRIBE_TIME"));	    //10
			vpd.put("var11", varOList.get(i).getString("UNIONID"));	    //11
			vpd.put("var12", varOList.get(i).getString("REMARK"));	    //12
			vpd.put("var13", varOList.get(i).get("GROUPID").toString());	//13
			vpd.put("var14", varOList.get(i).getString("TAGID_LIST"));	    //14
			vpd.put("var15", varOList.get(i).getString("CREATETIME"));	    //15
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**
	 * 更新所有微信用户
	 *author:Spiderman
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateAllWechatUser")
	@ResponseBody
	public Object updateAllWechatUser() throws Exception{
		long begintime=System.currentTimeMillis();
		Map<String,Object> map=new HashMap<String,Object>();
		//先保存所有用户的OPENID
		PageData getAllOpenidPd=new PageData();
		List<String> allDbOpenidList=wechatuserService.selectAllOpenidList(getAllOpenidPd);//查出所有用户的OPENID
		List<String> allWxOpenidList=new ArrayList<String>();//微信的所有OPENID列表
		UserListResult result=WechatInterfaceInvokeUtil.getUserList("");
		while (result.getCount().intValue()!=0) {//如果数量不为0
			allWxOpenidList.addAll(result.getData().getOpenid());
			result=WechatInterfaceInvokeUtil.getUserList(result.getNext_openid());//下一页
		}
		if(allWxOpenidList!=null&&!allWxOpenidList.isEmpty()){//如果微信传来的OPENID列表不为空
			if(allDbOpenidList!=null&&!allDbOpenidList.isEmpty()){//如果数据库的OPENID列表不为空
				allWxOpenidList.removeAll(allDbOpenidList);//这是实际要插入的OPENID列表
			}
			int begin=0;//截取的起始点
			int end=0;//截取的终点
			while (allWxOpenidList!=null&&!allWxOpenidList.isEmpty()&&end!=allWxOpenidList.size()) {//如果不为空
				end=(begin+2000)>allWxOpenidList.size()?allWxOpenidList.size():begin+2000;//防止数组越界
				List<String> partBatchInsertList=allWxOpenidList.subList(begin, end);//批量插入OPENID的临时列表
				//allWxOpenidList.removeAll(partBatchInsertList);
				try {
					wechatuserService.batchSaveOpendid(partBatchInsertList);//插入数据库
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
				begin=begin+2000;
			}
		}
		
		//再获取所有用户的详细信息
		List<WechatUserResult> batchUpdateList=new ArrayList<WechatUserResult>();//批量更新用户列表
		int i=0;//当前数据集下标
		PageData pd=new PageData();
		pd.put("BEGIN", i);
		pd.put("COUNT", 100);
		List<PageData> userList=wechatuserService.selectOpenidList(pd);
		while (userList!=null&&!userList.isEmpty()) {//如果查有用户集
			GetBatchUserInfoSend send=new GetBatchUserInfoSend();
			List<User> user_list=new ArrayList<User>();
			for(PageData temp:userList){
				GetBatchUserInfoSend.User user1=send.new User();
				user1.setOpenid(temp.getString("OPENID"));
				user_list.add(user1);
			}
			send.setUser_list(user_list);
			WechatUserListResult userList1=WechatInterfaceInvokeUtil.getBatchUserInfo(send);
			try {
				batchUpdateList.addAll(userList1.getUser_info_list());//放到批量更新用户集
				if(batchUpdateList.size()>2000){//满两千条添加
					wechatuserService.batchUpdate(batchUpdateList);
					batchUpdateList.clear();
				}
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			i=i+100;
			pd.put("BEGIN", i);
			userList=wechatuserService.selectOpenidList(pd);
		}
		if(!batchUpdateList.isEmpty()){//把不足两千条的放进数据库
			wechatuserService.batchUpdate(batchUpdateList);
		}
		long useTime=System.currentTimeMillis()-begintime;
		map.put("status", "1");
		map.put("用时", useTime/1000+"秒");
		return map;
	}
	/**
	 * 更新单个微信用户信息
	 *author:Spiderman
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateWechatUser")
	@ResponseBody
	public Object updateWechatUser() throws Exception{
		Map<String,Object> result=new HashMap<String,Object>();//返回前端
		PageData pd=this.getPageData();
		WechatUserResult user=WechatInterfaceInvokeUtil.getUserInfo(pd.getString("OPENID"));
		if(user.isSuccess()){
			pd.put("CITY", user.getCity());
			pd.put("COUNTRY", user.getCountry());
			pd.put("GROUPID", user.getGroupid());
			pd.put("HEADIMGURL", user.getHeadimgurl());
			pd.put("LANGUAGE", user.getLanguage());
			pd.put("NICKNAME", user.getNickname());
			pd.put("OPENID", user.getOpenid());
			pd.put("PROVINCE", user.getProvince());
			pd.put("REMARK", user.getRemark());
			pd.put("SEX", user.getSex());
			pd.put("SUBSCRIBE", user.getSubscribe());
			pd.put("SUBSCRIBE_TIME", user.getSubscribe_time());
			pd.put("TAGID_LIST", user.getTagid_list_tostring());
			pd.put("UNIONID", user.getUnionid());
			try {
				wechatuserService.edit(pd);//更新用户信息
				result.put("status", "1");
				result.put("message", "更新成功！");
			} catch (Exception e) {
				result.put("status", "2");
				result.put("message", "保存微信用户信息失败！");
				// TODO: handle exception
			}
		}else{
			result.put("status", "2");
			result.put("message", "获取微信用户信息失败！");
		}
		return result;
	}
	/**
	 * 批量更新微信用户信息
	 *author:Spiderman
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateBatchWechatUser")
	@ResponseBody
	public Object updateBatchWechatUser() throws Exception{
		Map<String,Object> result=new HashMap<String,Object>();//返回前端
		PageData pd=this.getPageData();
		
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			
			GetBatchUserInfoSend send=new GetBatchUserInfoSend();
			List<User> user_list=new ArrayList<User>();
			for(String temp:ArrayDATA_IDS){
				GetBatchUserInfoSend.User user1=send.new User();
				user1.setOpenid(temp);
				user_list.add(user1);
			}
			send.setUser_list(user_list);
			WechatUserListResult userList=WechatInterfaceInvokeUtil.getBatchUserInfo(send);
			wechatuserService.batchUpdate(userList.getUser_info_list());
		}
		return result;
	}
}
