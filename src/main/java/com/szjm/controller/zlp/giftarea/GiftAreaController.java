package com.szjm.controller.zlp.giftarea;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.entity.zlp.GiftArea;
import com.szjm.service.zlp.giftarea.GiftAreaManager;
import com.szjm.service.zlp.giftareatype.GiftAreaTypeManager;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
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
 * 说明：礼物专区 创建人： 创建时间：2018-08-17
 */
@Controller
@RequestMapping(value = "/giftarea")
public class GiftAreaController extends BaseController {

	String menuUrl = "giftarea/list.do"; // 菜单地址(权限用)
	// 专区
	@Resource(name = "giftareaService")
	private GiftAreaManager giftareaService;
	// 商品类型
	@Resource(name = "goodstypeService")
	private GoodsTypeManager goodstypeService;
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
	public ModelAndView save(HttpServletRequest request, GiftArea giftArea, @RequestParam(value="AREA_IMAGE") MultipartFile giftAreaImage) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增GiftArea");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("AREA_NAME", giftArea.getAREA_NAME()); // 名称
		pd.put("AREA_IMAGE",QiNiuFileUtil.uploadMulFile(giftAreaImage)); // 图片
		pd.put("SEQENCE", giftArea.getSEQENCE()); // 排序
		pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername()); // 创建人
		pd.put("DELETE_STATUS", 0); // 删除状态
		giftareaService.save(pd);
		// 商品类目
		String checkIds = giftArea.getCHECKIDS() != null ? giftArea.getCHECKIDS() : "";
		String[] ids = checkIds.split(",");
		// 保存区域关联类目
		for (String id : ids) {
			PageData atData = new PageData();
			atData.put("GOODSTYPE_ID", id); // 商品类目
			atData.put("GIFTAREA_ID", pd.get("id")); // 区域ID
			giftareatypeService.save(atData);
		}
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
		logBefore(logger, Jurisdiction.getUsername() + "删除GiftArea");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		// 删除区域
		giftareaService.delete(pd);
		// 删除区域关联类目
		giftareatypeService.deleteByArea(pd);
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
	public ModelAndView edit(HttpServletRequest request, GiftArea giftArea, @RequestParam(value="AREA_IMAGE") MultipartFile giftAreaImage) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改GiftArea");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("GIFTAREA_ID",giftArea.getGIFTAREA_ID());
		pd.put("AREA_NAME", giftArea.getAREA_NAME()); // 名称
		pd.put("AREA_IMAGE",QiNiuFileUtil.uploadMulFile(giftAreaImage)); // 图片
		pd.put("SEQENCE", giftArea.getSEQENCE()); // 排序
		pd.put("UPDATE_DATE", Tools.date2Str(new Date())); // 修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername()); // 修改人
		giftareaService.edit(pd);
		// 商品类目
		String checkIds = giftArea.getCHECKIDS() != null ? giftArea.getCHECKIDS() : "";
		String[] ids = checkIds.split(",");
		// 删除区域关联类目
		giftareatypeService.deleteByArea(pd);
		for (String id : ids) {
			PageData atData = new PageData();
			atData.put("GOODSTYPE_ID", id); // 商品类目
			atData.put("GIFTAREA_ID", pd.get("GIFTAREA_ID")); // 区域ID
			giftareatypeService.save(atData);
		}
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
		logBefore(logger, Jurisdiction.getUsername() + "列表GiftArea");
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
		List<PageData> varList = giftareaService.list(page); // 列出GiftArea列表
		mv.setViewName("zlp/giftarea/giftarea_list");
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
		List<PageData> typeList = goodstypeService.listAll(pd); // 商品类目
		mv.setViewName("zlp/giftarea/giftarea_edit");
		mv.addObject("msg", "save");
		mv.addObject("typeList", typeList);
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
		List<PageData> typeList = goodstypeService.listAll(pd); // 所有商品类目
		List<PageData> areatypeList = giftareatypeService.listAllByArea(pd); // 当前区域类目
		
		for (PageData type : typeList) {
			for (PageData aType : areatypeList) {
				if(type.get("GOODSTYPE_ID").toString().equals(aType.get("GOODSTYPE_ID").toString())){
					type.put("check", "ischeck");
					break;
				}else{
					type.put("check", "notcheck");
				}
			}
		}
		pd = giftareaService.findById(pd); // 根据ID读取
		mv.setViewName("zlp/giftarea/giftarea_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("typeList", typeList);
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
		logBefore(logger, Jurisdiction.getUsername() + "批量删除GiftArea");
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
			giftareaService.deleteAll(ArrayDATA_IDS);
			giftareatypeService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername() + "导出GiftArea到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("区域名称"); // 1
		titles.add("专区图片"); // 2
		titles.add("排序"); // 3
		titles.add("创建时间"); // 4
		titles.add("创建人"); // 5
		titles.add("更新时间"); // 6
		titles.add("更新人"); // 7
		titles.add("删除状态,0为未删除,1为删除"); // 8
		dataMap.put("titles", titles);
		List<PageData> varOList = giftareaService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("AREA_NAME")); // 1
			vpd.put("var2", varOList.get(i).getString("AREA_IMAGE")); // 2
			vpd.put("var3", varOList.get(i).get("SEQENCE").toString()); // 3
			vpd.put("var4", varOList.get(i).getString("CREATE_DATE")); // 4
			vpd.put("var5", varOList.get(i).getString("CREATE_USER")); // 5
			vpd.put("var6", varOList.get(i).getString("UPDATE_DATE")); // 6
			vpd.put("var7", varOList.get(i).getString("UPDATE_USER")); // 7
			vpd.put("var8", varOList.get(i).get("DELETE_STATUS").toString()); // 8
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
