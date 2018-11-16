package com.szjm.controller.zlp.brand;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.entity.zlp.Brand;
import com.szjm.service.zlp.brand.BrandManager;
import com.szjm.util.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：品牌管理
 * 创建人：
 * 创建时间：2018-11-15
 */
@Controller
@RequestMapping(value="/brand")
public class BrandController extends BaseController {
	
	String menuUrl = "brand/list.do"; //菜单地址(权限用)
	@Resource(name="brandService")
	private BrandManager brandService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpServletRequest request, Brand brand, @RequestParam(value="BRAND_LOGO") MultipartFile brandLogo) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Brand");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("BRAND_NAME",brand.getBRAND_NAME()); // 名称
		pd.put("BRAND_URL",brand.getBRAND_URL()); // 官网链接
		pd.put("SEQENCE",brand.getSEQENCE()); // 排序
		pd.put("BRAND_LOGO",QiNiuFileUtil.uploadMulFile(brandLogo)); // 图片
		pd.put("UPDATE_DATE", Tools.date2Str(new Date())); // 修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername()); // 修改人
		brandService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Brand");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		brandService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(HttpServletRequest request, Brand brand, @RequestParam(value="BRAND_LOGO") MultipartFile brandLogo) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Brand");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("BRAND_ID",brand.getBRAND_ID()); // ID
		pd.put("BRAND_NAME",brand.getBRAND_NAME()); // 名称
		pd.put("BRAND_URL",brand.getBRAND_URL()); // 官网链接
		pd.put("SEQENCE",brand.getSEQENCE()); // 排序
		pd.put("BRAND_LOGO",QiNiuFileUtil.uploadMulFile(brandLogo)); // 图片
		pd.put("UPDATE_DATE", Tools.date2Str(new Date())); // 修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername()); // 修改人
		brandService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Brand");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = brandService.list(page);	//列出Brand列表
		mv.setViewName("zlp/brand/brand_list");
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
		mv.setViewName("zlp/brand/brand_edit");
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
		pd = brandService.findById(pd);	//根据ID读取
		mv.setViewName("zlp/brand/brand_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Brand");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			brandService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Brand到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("品牌名称");	//1
		titles.add("品牌网址");	//2
		titles.add("品牌Logo");	//3
		titles.add("品牌排序");	//4
		dataMap.put("titles", titles);
		List<PageData> varOList = brandService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("BRAND_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("BRAND_URL"));	    //2
			vpd.put("var3", varOList.get(i).getString("BRAND_LOGO"));	    //3
			vpd.put("var4", varOList.get(i).get("SEQENCE").toString());	//4
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
