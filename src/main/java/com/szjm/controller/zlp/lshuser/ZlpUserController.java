package com.szjm.controller.zlp.lshuser;

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

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.finance.FinanceManager;
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.order.OrderManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;
import com.szjm.util.Tools;

/**
 * 说明：用户管理
 * 创建人：
 * 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value="/lshuser")
public class ZlpUserController extends BaseController {

	String menuUrl = "lshuser/list.do"; //菜单地址(权限用)
	@Resource(name="lshuserService")
	private LshUserManager lshuserService;//用户
	
	@Resource(name="sysconfigService")
	private SysConfigManager sysconfigService;//系统参数
	
	@Resource(name="financeService")
	private FinanceManager financeService;//收入支出明细
	
	@Resource(name="integrationrecordService")
	private IntegrationRecordManager integrationrecordService;//礼豆明细
	
	@Resource(name="orderService")
	private OrderManager orderService;//订单
	
	

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增APPUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("USER_ID", this.get32UUID());	//主键
		lshuserService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除APPUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		lshuserService.delete(pd);
		out.write("success");
		out.close();
	}

	/**增加金额
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addMoney")
	public ModelAndView addMoney() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改APPUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData findById = lshuserService.findById(pd);
		Double money = Double.parseDouble(findById.get("MONEY").toString());//取出用户的当前金额
		Double pdMoney = Double.parseDouble(pd.get("MONEY").toString());//获取后台增加的金额
		Double newMoney = money+pdMoney;//增加后的金额
		pd.put("MONEY",newMoney);
		lshuserService.edit(pd);//修改用户金额和金豆
		pd.put("FINANCE_TYPE", 0);
		pd.put("AMOUNT", pdMoney);
		pd.put("DELETE_STATUS", 0);
		pd.put("INCOME_REASON", 2);
		pd.put("RECORD_TYPE", 0);
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername());	//创建人
		financeService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**增加礼豆
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addIntegration")
	public ModelAndView addIntegration() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改APPUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData findById = lshuserService.findById(pd);
		Double integration = Double.parseDouble(findById.get("INTEGRATION").toString());//取出用户的当前礼豆
		int pdIntegration = Integer.parseInt(pd.get("INTEGRATION").toString());//获取后台增加的礼豆
		Double newIntegration_return = integration+pdIntegration;//新的用户金豆
		pd.put("INTEGRATION",newIntegration_return);
		lshuserService.edit(pd);//修改用户金额和金豆
		pd.put("RECORD_TYPE", 0);
		pd.put("AMOUNT", pdIntegration);
		pd.put("DELETE_STATUS", 0);
		pd.put("INCOME_REASON", 3);
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername());	//创建人
		integrationrecordService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表APPUser");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = lshuserService.list(page);	//列出APPUser列表
		mv.setViewName("zlp/lshuser/lshuser_list");
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
		mv.setViewName("lsh/lshuser/lshuser_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	 /**去填写金额页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddMoney")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = lshuserService.findById(pd);	//根据ID读取
		mv.setViewName("lsh/lshuser/addMoney");
		mv.addObject("msg", "addMoney");
		mv.addObject("pd", pd);
		return mv;
	}
	
	 /**去填写礼豆页面
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/goAddIntegration")
		public ModelAndView goAddIntegrationS()throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			pd = lshuserService.findById(pd);	//根据ID读取
			mv.setViewName("zlp/lshuser/addIntegration");
			mv.addObject("msg", "addIntegration");
			mv.addObject("pd", pd);
			return mv;
		}
	
	/**去用户详情页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goUserDetail")
	public ModelAndView goUserDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = lshuserService.userDetail(pd);	//根据ID读取
		mv.setViewName("zlp/lshuser/lshuser_detail");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**查看用户下级
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goSubordinates")
	public ModelAndView goSubordinates(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		page.setPd(pd);
		List<PageData>	userSubordinate = lshuserService.userSubordinate(page);	//列出APPUser列表
		mv.setViewName("zlp/lshuser/lshuser_list");
		mv.addObject("varList", userSubordinate);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**查看用户订单明细
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goOrderDetail")
	public ModelAndView goOrderDetail(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		page.setPd(pd);
		List<PageData>	orderDetail = orderService.list(page);	//列出APPUser列表
		mv.setViewName("zlp/order/order_list");
		mv.addObject("varList", orderDetail);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**查看收入支出明细
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/financeDetail")
	public ModelAndView financeDetail(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		page.setPd(pd);
		List<PageData>	orderDetail = financeService.list(page);	//列出APPUser列表
		mv.setViewName("lsh/finance/finance_list");
		mv.addObject("varList", orderDetail);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**查看礼豆明细
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/integrationDetail")
	public ModelAndView integrationDetail(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		page.setPd(pd);
		List<PageData>	orderDetail = integrationrecordService.list(page);	//列出APPUser列表
		mv.setViewName("zlp/integrationrecord/integrationrecord_list");
		mv.addObject("varList", orderDetail);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	

	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除APPUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			lshuserService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**修改角色
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editRole")
	@ResponseBody
	public String editRole() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改APPUser");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		pds.put("USER_ID", pd.get("USER_ID"));
		PageData findById = lshuserService.findById(pds);
		if("partner".equals(findById.get("ROLE").toString())){
			if(!"partner".equals(pd.get("ROLE").toString())){
				lshuserService.editRole(pd);
				lshuserService.editPartner(pd);
			}else{
				lshuserService.editRole(pd);
			}
		}else{
			lshuserService.editRole(pd);
		}
		return "1";
	}
	
	

	 /**导出到excel
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/excel")
		public ModelAndView exportExcel() throws Exception{
			logBefore(logger, Jurisdiction.getUsername()+"导出APPUser到excel");
			if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
			ModelAndView mv = new ModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("用户编号");	//1
			titles.add("手机号");	//2
			titles.add("昵称");	//3
			titles.add("性别");	//8
			titles.add("角色");	//6
			titles.add("生日");	//9		
			titles.add("上级");	//5
			titles.add("上级的合伙人");	//11
			titles.add("礼豆");	//10
			titles.add("余额");	//12
			titles.add("邀请码");	//4
			titles.add("创建日期");	//7
			dataMap.put("titles", titles);
			List<PageData> varOList = lshuserService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).get("USER_ID")!=null?varOList.get(i).get("USER_ID").toString():"");	//1
				vpd.put("var2", varOList.get(i).getString("PHONE_NUMBER") !=null?varOList.get(i).getString("PHONE_NUMBER").toString():"");	    //2
				vpd.put("var3", varOList.get(i).getString("NICK_NAME")!=null?varOList.get(i).getString("NICK_NAME").toString():"");	    //3
				if(varOList.get(i).get("SEX")!=null){
					int sex = (int)varOList.get(i).get("SEX");
					if(sex==1){
						vpd.put("var4", "男");	//14
					}else if(sex==2){
						vpd.put("var4", "女");	//14
					}else{
						vpd.put("var4", "未知");	//14
					}
				}else{
					vpd.put("var4", "");	//14
				}
				if(varOList.get(i).getString("ROLE")!=null){
					String role = varOList.get(i).getString("ROLE").toString();
					if("common".equals(role)){
						vpd.put("var5","普通用户");
					}else if("agent".equals(role)){
						vpd.put("var5","代理商");
					}else if("partner".equals(role)){
						vpd.put("var5","合伙人");				
					}else if("vip".equals(role)){
						vpd.put("var5","VIP用户");	
					}else if("members".equals(role)){
						vpd.put("var5","付费会员用户");	
					}
				}   
				vpd.put("var6", varOList.get(i).getString("BIRTHDAY")!=null?varOList.get(i).getString("BIRTHDAY").toString():"");	    //15
				if(varOList.get(i).get("PARENT_NAME") != null){
					String parent_name = varOList.get(i).get("PARENT_NAME").toString();
					String parent_phone_number = varOList.get(i).get("PARENT_PHONE_NUMBER").toString();
					vpd.put("var7",parent_name+"("+parent_phone_number+")");
				}else{
					vpd.put("var7","");
				}
				if(varOList.get(i).get("PARTNER_NAME") != null){
					String partner_name = varOList.get(i).get("PARTNER_NAME").toString();
					String partner_phone_number = varOList.get(i).get("PARTNER_PHONE_NUMBER").toString();
					vpd.put("var8",partner_name+"("+partner_phone_number+")");
				}else{
					vpd.put("var8","");
				}
				vpd.put("var9", varOList.get(i).get("INTEGRATION")!=null?varOList.get(i).get("INTEGRATION").toString():"");	//16
				vpd.put("var10", varOList.get(i).get("MONEY")!=null?varOList.get(i).get("MONEY").toString():"");	    //18
				vpd.put("var11", varOList.get(i).getString("INVITE_CODE")!=null?varOList.get(i).getString("INVITE_CODE").toString():"");	    //4
				vpd.put("var12", varOList.get(i).getString("CREATE_DATE")!=null?varOList.get(i).getString("CREATE_DATE").toString():"");	    //7
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
}
