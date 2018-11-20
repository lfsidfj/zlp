package com.szjm.controller.zlp.goodstype;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.system.fhlog.impl.FHlogService;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;
import net.sf.json.JSONArray;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：商品分类
 * 创建时间：2017-07-31
 */
@Controller
@RequestMapping(value="/goodstype")
public class GoodsTypeController extends BaseController {
	
	String menuUrl = "goodstype/list.do"; //菜单地址(权限用)
	@Resource(name="goodstypeService")
	private GoodsTypeManager goodstypeService;
	//操作日志记录
	@Resource(name="fhlogService")
	private FHlogService fhlogService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增goodsType");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("GOODS_TYPE_ID", this.get32UUID());	//主键
		if(pd.get("ORDER_BY")!=null&&pd.get("ORDER_BY").toString().equals("")){
			pd.remove("ORDER_BY");
		}
		pd.remove("GOODS_TYPE_ID");
		pd.put("STATUS", "1");
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", new Date(System.currentTimeMillis()));
		goodstypeService.save(pd);

		if(pd.get("PARENT_ID").toString().equals("0")){//如果是顶级，则祖先列表编号为,0,
			pd.put("PARENT_ID_LIST", ",0,"+pd.get("GOODS_TYPE_ID").toString()+",");
		}else{
			PageData parent = new PageData();
			parent.put("GOODS_TYPE_ID", pd.get("PARENT_ID"));
			parent=goodstypeService.findById(parent);
			pd.put("PARENT_ID_LIST", parent.get("PARENT_ID_LIST").toString()+pd.get("GOODS_TYPE_ID").toString()+",");
		}
		goodstypeService.edit(pd);//更新祖先列表编号
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		fhlogService.save(Jurisdiction.getUsername(), "添加商品分类："+pd);
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String GOODS_TYPE_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除goodsType");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} 					//校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd.put("GOODS_TYPE_ID", GOODS_TYPE_ID);
		String errInfo = "success";
		if(goodstypeService.listByParentId(GOODS_TYPE_ID).size() > 0){		//判断是否有子级，是：不允许删除
			errInfo = "false";
		}else{
			goodstypeService.fakeDelete(pd);	//执行删除
		}
		map.put("result", errInfo);
		fhlogService.save(Jurisdiction.getUsername(), "删除商品分类："+pd);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改goodsType");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", new Date(System.currentTimeMillis()));
		goodstypeService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		fhlogService.save(Jurisdiction.getUsername(), "修改商品分类："+pd);
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表goodsType");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} 	//校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");								//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String GOODS_TYPE_ID = (null == pd.get("GOODS_TYPE_ID")||pd.get("GOODS_TYPE_ID").toString().equals(""))?"0":pd.get("GOODS_TYPE_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			GOODS_TYPE_ID = pd.get("id").toString();
		}
		pd.put("GOODS_TYPE_ID", GOODS_TYPE_ID);					//上级ID
		page.setPd(pd);
		List<PageData>	varList = goodstypeService.list(page);			//列出goodsType列表
		mv.setViewName("zlp/goodstype/goodstype_list");
		mv.addObject("pd", goodstypeService.findById(pd));				//传入上级所有信息
		mv.addObject("GOODS_TYPE_ID", GOODS_TYPE_ID);			//上级ID
		mv.addObject("varList", varList);
		mv.addObject("QX", Jurisdiction.getHC());								//按钮权限
		return mv;
	}

	/**
	 * 显示列表ztree
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listTree")
	public ModelAndView listTree(Model model, String GOODS_TYPE_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(goodstypeService.listTree("0"));
			String json = arr.toString();
			json = json.replaceAll("GOODS_TYPE_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("TYPE_NAME", "name").replaceAll("subGoodsType", "nodes").replaceAll("hasGoodsType", "checked").replaceAll("treeurl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("GOODS_TYPE_ID",GOODS_TYPE_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("zlp/goodstype/goodstype_tree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
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
		String GOODS_TYPE_ID = null == pd.get("GOODS_TYPE_ID")?"":pd.get("GOODS_TYPE_ID").toString();
		pd.put("GOODS_TYPE_ID", GOODS_TYPE_ID);					//上级ID
		mv.addObject("pds",goodstypeService.findById(pd));				//传入上级所有信息
		mv.addObject("GOODS_TYPE_ID", GOODS_TYPE_ID);			//传入ID，作为子级ID用
		mv.setViewName("zlp/goodstype/goodstype_edit");
		mv.addObject("msg", "save");
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
		String GOODS_TYPE_ID = pd.getString("GOODS_TYPE_ID");
		pd = goodstypeService.findById(pd);							//根据ID读取		
		mv.addObject("pd", pd);													//放入视图容器
		pd.put("GOODS_TYPE_ID",pd.get("PARENT_ID").toString());			//用作上级信息
		mv.addObject("pds",goodstypeService.findById(pd));				//传入上级所有信息
		mv.addObject("GOODS_TYPE_ID", pd.get("PARENT_ID").toString());	//传入上级ID，作为子ID用
		pd.put("GOODS_TYPE_ID",GOODS_TYPE_ID);					//复原本ID
		pd = goodstypeService.findById(pd);							//根据ID读取
		mv.setViewName("zlp/goodstype/goodstype_edit");
		mv.addObject("msg", "edit");
		return mv;
	}	
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出goodsType到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("状态");	//1
		titles.add("创建人");	//2
		titles.add("创建日期");	//3
		titles.add("修改人");	//4
		titles.add("修改日期");	//5
		titles.add("描述");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = goodstypeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("STATUS"));	    //1
			vpd.put("var2", varOList.get(i).getString("CREATE_USER"));	    //2
			vpd.put("var3", varOList.get(i).getString("CREATE_DATE"));	    //3
			vpd.put("var4", varOList.get(i).getString("MODIFY_USER"));	    //4
			vpd.put("var5", varOList.get(i).getString("MODIFY_DATE"));	    //5
			vpd.put("var6", varOList.get(i).getString("DESCRIPTION"));	    //6
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
