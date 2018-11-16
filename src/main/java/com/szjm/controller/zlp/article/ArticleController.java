package com.szjm.controller.zlp.article;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.article.ArticleManager;
import com.szjm.service.zlp.articlecategory.ArticlecategoryManager;
import com.szjm.util.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：文章管理
 * 创建人：
 * 创建时间：2018-11-13
 */
@Controller
@RequestMapping(value="/article")
public class ArticleController extends BaseController {
	
	String menuUrl = "article/list.do"; //菜单地址(权限用)
	// 文章类目管理
	@Resource(name="articlecategoryService")
	private ArticlecategoryManager articlecategoryService;
	// 文章管理
	@Resource(name="articleService")
	private ArticleManager articleService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername()); // 创建人
		articleService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		articleService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_DATE", Tools.date2Str(new Date()));	//修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername());	//修改人
		articleService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Article");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = articleService.list(page);	//列出Article列表
		List<PageData> categoryList =  articlecategoryService.listAll(pd); // 文章类目列表
		mv.setViewName("zlp/article/article_list");
		mv.addObject("varList", varList);
		mv.addObject("categoryList", categoryList);
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
		List<PageData> categoryList =  articlecategoryService.listAll(pd); // 文章类目列表
		mv.setViewName("zlp/article/article_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("categoryList", categoryList);
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
		List<PageData> categoryList =  articlecategoryService.listAll(pd); // 文章类目列表
		pd = this.getPageData();
		pd = articleService.findById(pd);	//根据ID读取
		mv.setViewName("zlp/article/article_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("categoryList", categoryList);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Article");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			articleService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Article到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("id");	//1
		titles.add("文章名称");	//2
		titles.add("文章内容");	//3
		titles.add("排序");	//4
		titles.add("创建人");	//5
		titles.add("创建时间");	//6
		titles.add("更新人");	//7
		titles.add("更新时间");	//8
		titles.add("是否展示");	//9
		dataMap.put("titles", titles);
		List<PageData> varOList = articleService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ARTICLE_ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("ARTICLE_NAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("ARTICLE_CONTENT"));	    //3
			vpd.put("var4", varOList.get(i).get("SEQENCE").toString());	//4
			vpd.put("var5", varOList.get(i).getString("CREATE_USER"));	    //5
			vpd.put("var6", varOList.get(i).getString("CREATE_DATE"));	    //6
			vpd.put("var7", varOList.get(i).getString("UPDATE_USER"));	    //7
			vpd.put("var8", varOList.get(i).getString("UPDATE_DATE"));	    //8
			vpd.put("var9", varOList.get(i).get("DELETE_STATUS").toString());	//9
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
