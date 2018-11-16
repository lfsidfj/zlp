package com.szjm.controller.zlp.goodstype;

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
import com.szjm.service.information.pictures.PicturesManager;
import com.szjm.service.zlp.giftareatype.GiftAreaTypeManager;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;
import com.szjm.util.Tools;

/**
 * 说明：商品分类 创建人： 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value = "/goodstype")
public class GoodsTypeController extends BaseController {

	String menuUrl = "goodstype/list.do"; // 菜单地址(权限用)
	@Resource(name = "goodstypeService")
	private GoodsTypeManager goodstypeService;
	@Resource(name = "picturesService")
	private PicturesManager picturesService;// 图片
	// 区域关联表
	@Resource(name = "giftareatypeService")
	private GiftAreaTypeManager giftareatypeService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增GoodsType");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername()); // 创建人
		pd.put("DELETE_STATUS", 0); // 删除状态
		goodstypeService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除GoodsType");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		/*
		 * PageData pdP = new PageData(); pdP.put("PICTURES_ID",
		 * banner.get("PICTURE_ID")); PageData
		 * picture=picturesService.findById(pdP);
		 * if(picture.getString("PATH")!=null
		 * ||"".equals(picture.getString("PATH"))){
		 * DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG +
		 * picture.getString("PATH"));//删除图片 } picturesService.delete(picture);
		 */
		goodstypeService.delete(pd); // 删除类目
		giftareatypeService.deleteByType(pd); // 删除区域关联
		out.write("success");
		out.close();
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改GoodsType");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_DATE", Tools.date2Str(new Date())); // 修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername()); // 修改人
		goodstypeService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表GoodsType");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = goodstypeService.list(page); // 列出GoodsType列表
		mv.setViewName("zlp/goodstype/goodstype_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("zlp/goodstype/goodstype_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = goodstypeService.findById(pd); // 根据ID读取
		mv.setViewName("zlp/goodstype/goodstype_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "批量删除GoodsType");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			goodstypeService.deleteAll(ArrayDATA_IDS); // 删除商品类目
			giftareatypeService.deleteAllByType(ArrayDATA_IDS); // 删除关联送礼区域类目
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出GoodsType到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("ID"); // 1
		titles.add("类目名称"); // 2
		titles.add("类目图片"); // 3
		titles.add("类目排序"); // 4
		titles.add("创建时间"); // 5
		titles.add("创建人"); // 6
		titles.add("修改时间"); // 7
		titles.add("修改人"); // 8
		titles.add("备注9"); // 9
		dataMap.put("titles", titles);
		List<PageData> varOList = goodstypeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("GOODSTYPE_ID").toString()); // 1
			vpd.put("var2", varOList.get(i).getString("TYPE_NAME")); // 2
			vpd.put("var3", varOList.get(i).getString("TYPE_IMAGE")); // 3
			vpd.put("var4", varOList.get(i).get("SEQENCE").toString()); // 4
			vpd.put("var5", varOList.get(i).getString("CREATE_DATE")); // 5
			vpd.put("var6", varOList.get(i).getString("CREATE_USER")); // 6
			vpd.put("var7", varOList.get(i).getString("UPDATE_DATE")); // 7
			vpd.put("var8", varOList.get(i).getString("UPDATE_USER")); // 8
			vpd.put("var9", varOList.get(i).get("DELETE_STATUS").toString()); // 9
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv, dataMap);
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}
