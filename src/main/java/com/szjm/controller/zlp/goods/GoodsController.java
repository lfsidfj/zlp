package com.szjm.controller.zlp.goods;

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
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.goodssku.GoodsSkuManager;
import com.szjm.service.zlp.goodsspec.GoodsSpecManager;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
import com.szjm.service.zlp.spec.SpecManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;
import com.szjm.util.Tools;

/**
 * 说明：商品 创建人： 创建时间：2018-07-12
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsController extends BaseController {

	String menuUrl = "goods/list.do"; // 菜单地址(权限用)
	// 商品
	@Resource(name = "goodsService")
	private GoodsManager goodsService;
	// 商品类型
	@Resource(name = "goodstypeService")
	private GoodsTypeManager goodstypeService;
	// 规格
	@Resource(name = "specService")
	private SpecManager specService;
	// 商品规格
	@Resource(name = "goodsspecService")
	private GoodsSpecManager goodsspecService;
	// 商品SKU
	@Resource(name = "goodsskuService")
	private GoodsSkuManager goodsskuService;
	// 购物车
	@Resource(name = "cartService")
	private CartManager cartService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增Goods");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/* pd.put("GOODS_ID", this.get32UUID()); //主键 */
		pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername()); // 创建人
		pd.put("DELETE_STATUS", 0); // 删除状态
		// 商品规格
		String checkIds = pd.get("CHECKIDS") != null ? pd.get("CHECKIDS")
				.toString() : "";
		String[] ids = checkIds.split(",");
		goodsService.save(pd); // 商品保存
		// 商品规格保存
		for (String sid : ids) {
			PageData specs = new PageData();
			specs.put("GOODS_ID", pd.get("id"));
			specs.put("SPEC_ID", Integer.parseInt(sid));
			goodsspecService.save(specs);
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
		logBefore(logger, Jurisdiction.getUsername() + "删除Goods");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();

		// 商品删除
		goodsService.deleteGoods(pd);
		// 用户购物车的数据去除
		cartService.deleteByGoods(pd);
		/*
		 * //删除商品规格 goodsspecService.deleteByGoodsId(pd); //删除之前的商品SKU
		 * goodsskuService.deleteByGoodsId(pd);
		 */
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
		logBefore(logger, Jurisdiction.getUsername() + "修改Goods");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_DATE", Tools.date2Str(new Date())); // 修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername()); // 修改人
		// 修改商品
		goodsService.edit(pd);

		// 当前所选择的商品规格
		String checkIds = pd.get("CHECKIDS") != null ? pd.get("CHECKIDS")
				.toString() : "";
		String[] ids = checkIds.split(",");

		// 之前商品规格列表
		List<PageData> specList = goodsspecService.listGoodsId(pd);

		// 修改过商品规格，删除商品规格
		String editIds = "";
		if (ids.length != specList.size()) { // 修改了商品规格，删除之前的商品SKU
			goodsskuService.deleteByGoodsId(pd); // 删除之前的商品SKU
		} else {
			for (PageData before : specList) {
				editIds = editIds + before.get("SPEC_ID").toString() + ",";
			}
			checkIds = checkIds + ",";
			if (!editIds.equals(checkIds)) { // 修改了商品规格，删除之前的商品SKU
				goodsskuService.deleteByGoodsId(pd); // 删除之前的商品SKU
			}
		}

		// 删除之前商品规格
		goodsspecService.deleteByGoodsId(pd);

		// 保存新的商品规格
		for (String sid : ids) {
			if (!sid.equals("")) {
				PageData specs = new PageData();
				specs.put("GOODS_ID", pd.get("GOODS_ID").toString());
				specs.put("SPEC_ID", Integer.parseInt(sid));
				goodsspecService.save(specs);
			}
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
		logBefore(logger, Jurisdiction.getUsername() + "列表Goods");
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
		List<PageData> varList = goodsService.list(page); // 列出Goods列表
		List<PageData> typeList = goodstypeService.listAll(pd);
		mv.setViewName("zlp/goods/goods_list");
		mv.addObject("varList", varList);
		mv.addObject("typeList", typeList);
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
		List<PageData> typeList = goodstypeService.listAll(pd);
		List<PageData> specList = specService.listAll(pd);
		mv.setViewName("zlp/goods/goods_add");
		mv.addObject("msg", "save");
		mv.addObject("typeList", typeList);
		mv.addObject("specList", specList);
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

		pd = goodsService.findById(pd); // 根据ID读取
		List<PageData> typeList = goodstypeService.listAll(pd);
		List<PageData> specList = specService.listAll(pd); // 所有规格

		for (PageData pageData : specList) {
			List<PageData> goodsSpeces = goodsspecService.listGoodsId(pd); // 当前商品规格
			for (PageData pageData2 : goodsSpeces) {
				if (pageData2.get("SPEC_ID").toString()
						.equals(pageData.get("SPEC_ID").toString())) {
					pageData.put("check", "ischeck"); // 当前选中的商品规格
					break;
				} else {
					pageData.put("check", "notcheck"); // 当前未选中的商品规格
				}
			}
		}
		mv.setViewName("zlp/goods/goods_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("typeList", typeList);
		mv.addObject("specList", specList);
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
		logBefore(logger, Jurisdiction.getUsername() + "批量删除Goods");
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
			goodsService.deleteAllGoods(ArrayDATA_IDS);
			// 用户购物车的数据去除
			cartService.deleteAllByGoods(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername() + "导出Goods到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("ID"); // 1
		titles.add("规格ID"); // 2
		titles.add("商品名称"); // 3
		titles.add("商品原价"); // 4
		titles.add("商品现价"); // 5
		titles.add("礼豆抵扣金额"); // 7
		titles.add("商品类型"); // 8
		titles.add("所需礼豆"); // 9
		titles.add("商品小图"); // 10
		titles.add("销量"); // 11
		titles.add("商品详情"); // 12
		titles.add("排序"); // 13
		titles.add("创建时间"); // 14
		titles.add("创建人"); // 15
		titles.add("修改时间"); // 16
		titles.add("修改人"); // 17
		titles.add("删除状态"); // 18
		titles.add("礼包类型"); // 19
		dataMap.put("titles", titles);
		List<PageData> varOList = goodsService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("GOODS_ID").toString()); // 1
			vpd.put("var2", varOList.get(i).get("GOODSTYPE_ID").toString()); // 2
			vpd.put("var3", varOList.get(i).getString("GOODS_NAME")); // 3
			vpd.put("var4", varOList.get(i).getString("ORIGINAL_PRICE")); // 4
			vpd.put("var5", varOList.get(i).getString("CURRENT_PRICE")); // 5
			vpd.put("var7", varOList.get(i).getString("DEDUCTION_MONEY")); // 7
			vpd.put("var8", varOList.get(i).get("GOODS_POSITION").toString()); // 8
			vpd.put("var9", varOList.get(i).get("INTEGRATION").toString()); // 9
			vpd.put("var10", varOList.get(i).getString("PICTURE_ID")); // 10
			vpd.put("var11", varOList.get(i).get("SALES_VOLUME").toString()); // 11
			vpd.put("var12", varOList.get(i).getString("GOODS_DETAILS")); // 12
			vpd.put("var13", varOList.get(i).get("SEQENCE").toString()); // 13
			vpd.put("var14", varOList.get(i).getString("CREATE_DATE")); // 14
			vpd.put("var15", varOList.get(i).getString("CREATE_USER")); // 15
			vpd.put("var16", varOList.get(i).getString("UPDATE_DATE")); // 16
			vpd.put("var17", varOList.get(i).getString("UPDATE_USER")); // 17
			vpd.put("var18", varOList.get(i).get("DELETE_STATUS").toString()); // 18
			vpd.put("var19", varOList.get(i).get("GIFT_BAG_TYPE").toString()); // 19
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
