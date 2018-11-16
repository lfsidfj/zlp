package com.szjm.controller.zlp.finance;

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
import com.szjm.util.AppUtil;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;
import com.szjm.util.Jurisdiction;
import com.szjm.util.Tools;
import com.szjm.service.zlp.finance.FinanceManager;

/**
 * 说明：收入支出明细
 * 创建人：
 * 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value="/finance")
public class FinanceController extends BaseController {

	String menuUrl = "finance/list.do"; //菜单地址(权限用)
	@Resource(name="financeService")
	private FinanceManager financeService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Finance");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("FINANCE_ID", this.get32UUID());	//主键
		pd.remove("FINANCE_ID");
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername());	//创建人
		pd.put("DELETE_STATUS", 0);	//删除状态
		financeService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Finance");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		financeService.delete(pd);
		out.write("success");
		out.close();
	}

	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Finance");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_DATE", Tools.date2Str(new Date()));	//修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername());	//修改人
		financeService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Finance");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = financeService.list(page);	//列出Finance列表
		mv.setViewName("zlp/finance/finance_list");
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
		mv.setViewName("zlp/finance/finance_edit");
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
		pd = financeService.findById(pd);	//根据ID读取
		mv.setViewName("zlp/finance/finance_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Finance");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			financeService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Finance到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("收支编号");	//1
		titles.add("创建时间");	//2
		titles.add("用户昵称");	//3
		titles.add("用户电话");	//4
		titles.add("金额");	//5
		titles.add("类型");	//6
		titles.add("收入来源");	//7
		titles.add("订单编号");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = financeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("FINANCE_ID")== null ?"":varOList.get(i).get("FINANCE_ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("CREATE_DATE")== null ?"":varOList.get(i).get("CREATE_DATE").toString());	//1
			vpd.put("var3", varOList.get(i).get("NICK_NAME")== null ?"":varOList.get(i).get("NICK_NAME").toString());	//1
			vpd.put("var4", varOList.get(i).get("PHONE_NUMBER")== null ?"":varOList.get(i).get("PHONE_NUMBER").toString());	//1
			vpd.put("var5", varOList.get(i).get("AMOUNT")== null ?"":varOList.get(i).get("AMOUNT").toString());	//1
			if(varOList.get(i).get("FINANCE_TYPE")!= null){
				String FINANCE_TYPE = varOList.get(i).get("FINANCE_TYPE").toString();
				if("0".equals(FINANCE_TYPE)){
					vpd.put("var6","收入");	    //11
				}
				if("0".equals(FINANCE_TYPE)){
					vpd.put("var6","提现");	    //11
				}
			}else{
				vpd.put("var6","");	    //11
			}
			if(varOList.get(i).get("INCOME_REASON")!= null){
				String INCOME_REASON = varOList.get(i).get("INCOME_REASON").toString();
				if("0".equals(INCOME_REASON)){
					vpd.put("var7","订单收入");	    //11
				}
				if("1".equals(INCOME_REASON)){
					vpd.put("var7","后台增加");	    //11
				}
				if("2".equals(INCOME_REASON)){
					vpd.put("var7","提现");	    //11
				}
			}else{
				vpd.put("var7","");	    //11
			}

			vpd.put("var8", varOList.get(i).get("ORDER_ID")== null ?"":varOList.get(i).get("ORDER_ID").toString());	//1

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
