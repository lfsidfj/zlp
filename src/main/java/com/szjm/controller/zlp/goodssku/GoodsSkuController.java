package com.szjm.controller.zlp.goodssku;

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
import com.szjm.service.zlp.goodssku.GoodsSkuManager;
import com.szjm.service.zlp.goodsspec.GoodsSpecManager;
import com.szjm.service.zlp.specvalue.SpecValueManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;

/** 
 * 说明：商品SKU
 * 创建人：
 * 创建时间：2018-07-13
 */
@Controller
@RequestMapping(value="/goodssku")
public class GoodsSkuController extends BaseController {
	
	String menuUrl = "goodssku/list.do"; //菜单地址(权限用)
	@Resource(name="goodsskuService")
	private GoodsSkuManager goodsskuService;
	// 商品规格
	@Resource(name="goodsspecService")
	private GoodsSpecManager goodsspecService;
	//规格值
	@Resource(name="specvalueService")
	private SpecValueManager specvalueService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增GoodsSku");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/*pd.put("GOODSSKU_ID", this.get32UUID());	//主键*/		
		pd.put("SPECVALUE_ID", pd.get("SELECTIDS").toString());
		
		String[] split = pd.get("SELECTIDS").toString().split(",");
		String SPECVALUE_NAME = "";
		for (String string : split) { // 规格名称
			if(!string.equals("")){
				PageData vpd = new PageData();
				vpd.put("SPECVALUE_ID", string);
				PageData result = specvalueService.findById(vpd);
				SPECVALUE_NAME=SPECVALUE_NAME+result.get("SPEC_VALUE").toString()+" ";
			}
		}
		pd.put("SPECVALUE_NAME", SPECVALUE_NAME);
		
		goodsskuService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除GoodsSku");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		goodsskuService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改GoodsSku");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SPECVALUE_ID", pd.get("SELECTIDS").toString());
		
		String[] split = pd.get("SELECTIDS").toString().split(",");
		String SPECVALUE_NAME = "";
		for (String string : split) { // 规格名称
			PageData vpd = new PageData();
			vpd.put("SPECVALUE_ID", string);
			PageData result = specvalueService.findById(vpd);
			SPECVALUE_NAME=SPECVALUE_NAME+result.get("SPEC_VALUE").toString()+" ";
		}
		pd.put("SPECVALUE_NAME", SPECVALUE_NAME);
		
		goodsskuService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表GoodsSku");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = goodsskuService.list(page);	//列出GoodsSku列表
		
		/*try {
			for (PageData pageData : varList) {
				String[] values = pageData.get("SPECVALUE_ID").toString().split(",");
				String value = "";
				for (String string : values) {
					PageData vpd = new PageData();
					vpd.put("SPECVALUE_ID", string);
					PageData result = specvalueService.findById(vpd);
					value=value+result.get("SPEC_VALUE").toString()+" ";
				}
				pageData.put("value", value);
			}
		} catch (Exception e) {
		}*/
		
		mv.setViewName("zlp/goodssku/goodssku_list");
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
		mv.setViewName("zlp/goodssku/goodssku_edit");
		
		List<PageData> specList = goodsspecService.listGoodsId(pd); // 商品规格列表
		List<List<PageData>> specValueList = new ArrayList<List<PageData>>(); // 商品规格值
		for (PageData spd : specList) {
			pd.put("SPEC_ID", spd.get("SPEC_ID").toString());
			List<PageData> specValue = specvalueService.listBySpecId(pd);
			// 商品规格未被删除
			if(!specValue.isEmpty()){
				specValueList.add(specValue);
			}		
		}
		
		mv.addObject("specValueList", specValueList);
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
		pd = goodsskuService.findById(pd);	//根据ID读取
		List<PageData> specList = goodsspecService.listGoodsId(pd); // 商品规格列表
		List<List<PageData>> specValueList = new ArrayList<List<PageData>>(); // 商品规格值
	
		String[] values = pd.get("SPECVALUE_ID").toString().split(",");
		for (int i = 0; i < values.length; i++) {
			pd.put("SPEC_ID", specList.get(i).get("SPEC_ID").toString());
			List<PageData> specValue = specvalueService.listBySpecId(pd);
			// 商品规格未被删除
			if(!specValue.isEmpty()){
				// 选中ID
				for (PageData pageData : specValue) {
					pageData.put("check", values[i]);
				}
				specValueList.add(specValue);
			}	
			
		}
		mv.setViewName("zlp/goodssku/goodssku_edit");
		mv.addObject("specValueList", specValueList);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除GoodsSku");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			goodsskuService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出GoodsSku到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("ID");	//1
		titles.add("商品ID");	//2
		titles.add("商品价格");	//3
		titles.add("商品库存");	//4
		titles.add("所需礼豆");	//5
		dataMap.put("titles", titles);
		List<PageData> varOList = goodsskuService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("SKU_ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("GOODS_ID").toString());	//2
			vpd.put("var3", varOList.get(i).getString("GOODS_PRICE"));	    //3
			vpd.put("var4", varOList.get(i).get("GOODS_INVENTORY").toString());	//4
			vpd.put("var5", varOList.get(i).get("INTEGRATION").toString());	//5
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
