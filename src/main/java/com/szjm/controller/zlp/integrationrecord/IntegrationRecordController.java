package com.szjm.controller.zlp.integrationrecord;

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
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;

/**
 * 说明：礼豆记录
 * 创建人：
 * 创建时间：2018-07-18
 */
@Controller
@RequestMapping(value="/integrationrecord")
public class IntegrationRecordController extends BaseController {

	String menuUrl = "integrationrecord/list.do"; //菜单地址(权限用)
	@Resource(name="integrationrecordService")
	private IntegrationRecordManager integrationrecordService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增IntegrationRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("INTEGRATIONRECORD_ID", this.get32UUID());	//主键
		integrationrecordService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除IntegrationRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		integrationrecordService.delete(pd);
		out.write("success");
		out.close();
	}

	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改IntegrationRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		integrationrecordService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表IntegrationRecord");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = integrationrecordService.list(page);	//列出IntegrationRecord列表
		mv.setViewName("zlp/integrationrecord/integrationrecord_list");
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
		mv.setViewName("zlp/integrationrecord/integrationrecord_edit");
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
		pd = integrationrecordService.findById(pd);	//根据ID读取
		mv.setViewName("zlp/integrationrecord/integrationrecord_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除IntegrationRecord");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			integrationrecordService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出IntegrationRecord到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("礼豆记录编号");	//1
		titles.add("创建时间");	//2
		titles.add("用户昵称");	//3
		titles.add("用户电话");	//4
		titles.add("金豆数量");	//5
		titles.add("类型");	//6
		titles.add("收入来源");	//7
		titles.add("订单编号");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = integrationrecordService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("INTEGRATIONRECORD_ID")== null ?"":varOList.get(i).get("INTEGRATIONRECORD_ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("CREATE_DATE")== null ?"":varOList.get(i).get("CREATE_DATE").toString());	//1
			vpd.put("var3", varOList.get(i).get("NICK_NAME")== null ?"":varOList.get(i).get("NICK_NAME").toString());	//1
			vpd.put("var4", varOList.get(i).get("PHONE_NUMBER")== null ?"":varOList.get(i).get("PHONE_NUMBER").toString());	//1
			vpd.put("var5", varOList.get(i).get("AMOUNT")== null ?"":varOList.get(i).get("AMOUNT").toString());	//1
			if(varOList.get(i).get("RECORD_TYPE")!= null){
				String FINANCE_TYPE = varOList.get(i).get("RECORD_TYPE").toString();
				if("0".equals(FINANCE_TYPE)){
					vpd.put("var6","收入");	    //11
				}
				if("0".equals(FINANCE_TYPE)){
					vpd.put("var6","支出");	    //11
				}
			}else{
				vpd.put("var6","");	    //11
			}
			if(varOList.get(i).get("INCOME_REASON")!= null){
				String INCOME_REASON = varOList.get(i).get("INCOME_REASON").toString();
				if("1".equals(INCOME_REASON)){
					vpd.put("var7","订单收入");	    //11
				}
				if("2".equals(INCOME_REASON)){
					vpd.put("var7","每天自增");	    //11
				}
				if("3".equals(INCOME_REASON)){
					vpd.put("var7","后台增加");	    //11
				}
				if("4".equals(INCOME_REASON)){
					vpd.put("var7","订单消耗");	    //11
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
