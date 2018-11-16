package com.szjm.controller.zlp.goodscomment;

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
import com.szjm.service.zlp.goodscomment.GoodsCommentManager;

/**
 * 说明：商品评论
 * 创建人：
 * 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value="/goodscomment")
public class GoodsCommentController extends BaseController {

	String menuUrl = "goodscomment/list.do"; //菜单地址(权限用)
	@Resource(name="goodscommentService")
	private GoodsCommentManager goodscommentService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增GoodsComment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("GOODSCOMMENT_ID", this.get32UUID());	//主键
		pd.remove("GOODSCOMMENT_ID");
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername());	//创建人
		pd.put("DELETE_STATUS", 0);	//删除状态
		goodscommentService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除GoodsComment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		goodscommentService.delete(pd);
		out.write("success");
		out.close();
	}
	/**隐藏 展示 评论
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/articleDel")
	@ResponseBody
	public void articleDel(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Article");
		PageData pd = new PageData();
		pd = this.getPageData();
		String status = pd.get("DELETE_STATUS").toString();
		pd.put("DELETE_STATUS", status);
		goodscommentService.edit(pd);

	}
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改GoodsComment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_DATE", Tools.date2Str(new Date()));	//修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername());	//修改人
		goodscommentService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表GoodsComment");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = goodscommentService.list(page);	//列出GoodsComment列表
		mv.setViewName("zlp/goodscomment/goodscomment_list");
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
		mv.setViewName("lsh/goodscomment/goodscomment_edit");
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
		pd = goodscommentService.findById(pd);	//根据ID读取
		mv.setViewName("zlp/goodscomment/goodscomment_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	/**查看评论详情
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsCommentDetails")
	public ModelAndView lookDetails()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = goodscommentService.findCommentById(pd);	//根据ID读取
		List<PageData> list=new ArrayList<PageData>();
		String path=pd.getString("PATH");
		String[]  strs=path.split(",");
		for(int i=0,len=strs.length;i<len;i++){
			PageData pdP = new PageData();
			pdP.put("PATH", strs[i].toString());
			list.add(pdP);
		}
		mv.setViewName("zlp/goodscomment/goodscomment_details");
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		return mv;
	}

	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除GoodsComment");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			goodscommentService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出GoodsComment到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("编号");	//1
		titles.add("商品编号");	//2
		titles.add("评论内容");	//3
		titles.add("备注4");	//4
		titles.add("备注5");	//5
		titles.add("备注6");	//6
		titles.add("备注7");	//7
		titles.add("备注8");	//8
		titles.add("用户编号");	//9
		titles.add("购物车编号");	//10
		dataMap.put("titles", titles);
		List<PageData> varOList = goodscommentService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("GOODSCOMMENT_ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("GOODS_ID").toString());	//2
			vpd.put("var3", varOList.get(i).getString("CONTENT"));	    //3
			vpd.put("var4", varOList.get(i).getString("CREATE_DATE"));	    //4
			vpd.put("var5", varOList.get(i).getString("CREATE_USER"));	    //5
			vpd.put("var6", varOList.get(i).getString("UPDATE_DATE"));	    //6
			vpd.put("var7", varOList.get(i).getString("UPDATE_USER"));	    //7
			vpd.put("var8", varOList.get(i).get("DELETE_STATUS").toString());	//8
			vpd.put("var9", varOList.get(i).get("USER_ID").toString());	//9
			vpd.put("var10", varOList.get(i).get("CART_ID").toString());	//10
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
