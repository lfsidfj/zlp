package com.szjm.controller.zlp.order;

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


import spiderman.util.base.BaseUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.util.AppUtil;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;
import com.szjm.util.Jurisdiction;
import com.szjm.util.Tools;
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.expresscompany.ExpressCompanyManager;
import com.szjm.service.zlp.order.OrderManager;
import spiderman.util.base.KdniaoTrackQueryAPI;

/**
 * 说明：订单管理
 * 创建人：
 * 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value="/order")
public class OrderController extends BaseController {

	String menuUrl = "order/list.do"; //菜单地址(权限用)
	@Resource(name="orderService")
	private OrderManager orderService;
	@Resource(name="cartService")
	private CartManager cartService;//购物车
	@Resource(name="expresscompanyService")
	private ExpressCompanyManager expresscompanyService;//快递公司
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("ORDER_ID", this.get32UUID());	//主键
		pd.remove("ORDER_ID");
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("CREATE_USER", Jurisdiction.getUsername());	//创建人
		pd.put("DELETE_STATUS", 0);	//删除状态
		orderService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderService.delete(pd);
		out.write("success");
		out.close();
	}

	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_DATE", Tools.date2Str(new Date()));	//修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername());	//修改人
		orderService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Order");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("DELETE_STATUS", 0);
		pd.put("ORDER_POSITION",1); // 普通商品订单
		page.setPd(pd);
		List<PageData>	varList = orderService.list(page);	//列出Order列表
		mv.setViewName("zlp/order/normalorder/order_list");
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
		mv.setViewName("zlp/order/normalorder/order_edit");
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
		pd = orderService.findById(pd);	//根据ID读取
		mv.setViewName("zlp/order/normalorder/order_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	/**订单详情页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goInformation")
	public ModelAndView goInformation()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = orderService.informationFindById(pd);	//根据ID读取
		PageData pdC = new PageData();
		pdC.put("ORDER_ID", pd.get("ORDER_ID"));
		List<PageData> cartList=cartService.listAllCartAndGoods(pdC);
		mv.setViewName("zlp/order/normalorder/order_information");
		mv.addObject("msg", "shipments");
		mv.addObject("pd", pd);
		mv.addObject("cartList", cartList);
		return mv;
	}
	/**查看物流
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goLogistics")
	public ModelAndView goLogistics()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = orderService.informationFindById(pd);	//根据ID读取
		PageData pdC = new PageData();
		pdC.put("EXPRESSCOMPANY_ID", pd.get("EXPRESSCOMPANY_ID"));//快递公司编号
		PageData pdE=expresscompanyService.findById(pdC);
		String wl="";
		String kdgsywjc="";
		if(pd.get("EXPRESS_NO")!=null&&!"".equals(pd.get("EXPRESS_NO").toString())){
			wl=pd.getString("EXPRESS_NO");//物流编号
		}
		if(pd.get("CODE")!=null&&!"".equals(pd.get("CODE").toString())){
			kdgsywjc=pd.getString("CODE");//快递公司大写英文简称
		}
		KdniaoTrackQueryAPI api = new KdniaoTrackQueryAPI();
		if("".equals(wl)||"".equals(kdgsywjc)){
			List<PageData> list=new ArrayList<PageData>();//保存物流信息
			list.add(pd);
			mv.addObject("pd", pd);
			mv.addObject("list", list);
			mv.addObject("json", null);
		}else{
			String result=api.getOrderTracesByJson(kdgsywjc,wl);
			Map<String,Object> json=BaseUtil.parseJson(result, Map.class);
			List<PageData> list=new ArrayList<PageData>();//保存物流信息
			list.add(pd);

			mv.addObject("pd", pd);
			mv.addObject("list", list);
			mv.addObject("json", json.get("Traces"));
		}
		mv.setViewName("zlp/order/normalorder/order_logistics");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**去发货页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goShipments")
	public ModelAndView goShipments()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> expresscompanyList=expresscompanyService.listAll(pd);
		pd = orderService.findById(pd);	//根据ID读取
		mv.setViewName("zlp/order/normalorder/order_shipments");
		mv.addObject("msg", "shipments");
		mv.addObject("pd", pd);
		mv.addObject("expresscompanyList", expresscompanyList);
		return mv;
	}
	/**发货后修改订单状态为已发货  修改快递和物流编号
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/shipments")
	public ModelAndView shipments() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATE_DATE", Tools.date2Str(new Date()));	//修改日期
		pd.put("UPDATE_USER", Jurisdiction.getUsername());	//修改人
		pd.put("ORDER_STATUS", 2);
		orderService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			orderService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Order到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单编号");	//1
		titles.add("创建时间");	//1.1
		titles.add("收货人姓名");	//2
		titles.add("收货人电话");	//3
		titles.add("订单总金额");	//4
		titles.add("商品金额");	//5
		titles.add("邮费");	//6
		titles.add("礼豆抵扣金额");	//7
		titles.add("使用礼豆数量(只记录非积分商品)");	//8
		titles.add("实付金额");	//9
		titles.add("详细地址");	//10
		titles.add("订单状态");	//11
		titles.add("支付状态");	//12
		titles.add("支付编号");	//13
		titles.add("用户编号");	//14
		titles.add("物流编号");	//15
		titles.add("快递公司编号");	//16
		dataMap.put("titles", titles);
		List<PageData> varOList = orderService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
		//	vpd.put("var1", varOList.get(i).getString("ORDER_ID"));	    //1
			vpd.put("var1", varOList.get(i).get("ORDER_ID")== null ?"":varOList.get(i).get("ORDER_ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("RECEIVER")== null ?"":varOList.get(i).get("RECEIVER").toString());	//1
			vpd.put("var2", varOList.get(i).get("CREATE_DATE")== null ?"":varOList.get(i).get("CREATE_DATE").toString());	//1
			vpd.put("var3", varOList.get(i).get("PHONE_NUMBER")== null ?"":varOList.get(i).get("PHONE_NUMBER").toString());	//1
			vpd.put("var4", varOList.get(i).get("TOTAL_AMOUNT")== null ?"":varOList.get(i).get("TOTAL_AMOUNT").toString());	//1
			vpd.put("var5", varOList.get(i).get("GOODS_AMOUNT")== null ?"":varOList.get(i).get("GOODS_AMOUNT").toString());	//1
			vpd.put("var6", varOList.get(i).get("FREIGHT_AMOUNT")== null ?"":varOList.get(i).get("FREIGHT_AMOUNT").toString());	//1
			vpd.put("var7", varOList.get(i).get("DEDUCTION_AMOUNT")== null ?"":varOList.get(i).get("DEDUCTION_AMOUNT").toString());	//1
			vpd.put("var8", varOList.get(i).get("INTEGRATION_AMOUNT")== null ?"":varOList.get(i).get("INTEGRATION_AMOUNT").toString());	//1
			vpd.put("var9", varOList.get(i).get("REAL_PAY_AMOUNT")== null ?"":varOList.get(i).get("REAL_PAY_AMOUNT").toString());	//1
			String PROVINCE="";
			String CITY="";
			String AREA="";
			String DETAILS_ADDRESS="";
			if(varOList.get(i).get("PROVINCE")!=null){
				PROVINCE=varOList.get(i).get("PROVINCE").toString();
			}
			if(varOList.get(i).get("CITY")!=null){
				CITY=varOList.get(i).get("CITY").toString();
			}
			if(varOList.get(i).get("AREA")!=null){
				AREA=varOList.get(i).get("AREA").toString();
			}
			if(varOList.get(i).get("DETAILS_ADDRESS")!=null){
				DETAILS_ADDRESS=varOList.get(i).get("DETAILS_ADDRESS").toString();
			}
			vpd.put("var10",PROVINCE+CITY+ AREA+DETAILS_ADDRESS);	//10
			if(varOList.get(i).get("ORDER_STATUS")!=null){
				String order_status = varOList.get(i).get("ORDER_STATUS").toString();
				if("0".equals(order_status)){
					vpd.put("var11","待支付");	    //11
				}
				if("1".equals(order_status)){
					vpd.put("var11","待发货");	    //11
				}
				if("2".equals(order_status)){
					vpd.put("var11","待收货");	    //11
				}
				if("3".equals(order_status)){
					vpd.put("var11","待评价");	    //11
				}
				if("4".equals(order_status)){
					vpd.put("var11","已完成");	    //11
				}
			}else{
					vpd.put("var11","");
			}
			vpd.put("var13", varOList.get(i).get("OUT_ORDER_ID")== null ?"":varOList.get(i).get("OUT_ORDER_ID").toString());	//1
			vpd.put("var14", varOList.get(i).get("USER_ID")== null ?"":varOList.get(i).get("USER_ID").toString());	//1
			vpd.put("var15", varOList.get(i).get("EXPRESS_NO")== null ?"":varOList.get(i).get("EXPRESS_NO").toString());	//1
			vpd.put("var16", varOList.get(i).get("COMPANY_NAME")== null ?"":varOList.get(i).get("COMPANY_NAME").toString());	//1

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
