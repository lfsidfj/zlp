package com.szjm.controller.system.wechat;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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

import spiderman.wechat.domain.param.Button;
import spiderman.wechat.domain.param.Menu;
import spiderman.wechat.domain.result.BaseWechatResult;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.entity.system.WechatMenu;
import com.szjm.service.system.wechat.wechatmenu.WechatMenuManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;

/** 
 * 说明：微信菜单设置
 * 创建人：
 * 创建时间：2015-12-16
 */
@Controller
@RequestMapping(value="/wechatMenu")
public class WechatMenuController extends BaseController {
	
	String menuUrl = "wechatMenu/list.do"; //菜单地址(权限用)
	@Resource(name="wechatMenuService")
	private WechatMenuManager dictionariesService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Dictionaries");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DICTIONARIES_ID", this.get32UUID());	//主键
		dictionariesService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 * @param DICTIONARIES_ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String DICTIONARIES_ID) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除Dictionaries");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID);
		String errInfo = "success";
		if(dictionariesService.listSubDictByParentId(DICTIONARIES_ID).size() > 0){//判断是否有子级，是：不允许删除
			errInfo = "false";
		}else{
			pd = dictionariesService.findById(pd);//根据ID读取
			if(null != pd.get("TBSNAME") && !"".equals(pd.getString("TBSNAME"))){
				String[] table = pd.getString("TBSNAME").split(",");
				for(int i=0;i<table.length;i++){
					pd.put("thisTable", table[i]);
					try {
						if(Integer.parseInt(dictionariesService.findFromTbs(pd).get("zs").toString())>0){//判断是否被占用，是：不允许删除(去排查表检查字典表中的编码字段)
							errInfo = "false";
							break;
						}
					} catch (Exception e) {
							errInfo = "false2";
							break;
					}
				}
			}
		}
		if("success".equals(errInfo)){
			dictionariesService.delete(pd);	//执行删除
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Dictionaries");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		dictionariesService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Dictionaries");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String DICTIONARIES_ID = null == pd.get("DICTIONARIES_ID")?"":pd.get("DICTIONARIES_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			DICTIONARIES_ID = pd.get("id").toString();
		}
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID);					//上级ID
		page.setPd(pd);
		List<PageData>	varList = dictionariesService.list(page);	//列出Dictionaries列表
		mv.addObject("pd", dictionariesService.findById(pd));		//传入上级所有信息
		mv.addObject("DICTIONARIES_ID", DICTIONARIES_ID);			//上级ID
		mv.setViewName("system/wechatmenu/dictionaries_list");
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());					//按钮权限
		return mv;
	}
	
	/**
	 * 显示列表ztree
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllDict")
	public ModelAndView listAllDict(Model model,String DICTIONARIES_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			JSONArray arr = JSONArray.fromObject(dictionariesService.listAllDict("0"));
			String json = arr.toString();
			json = json.replaceAll("DICTIONARIES_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDict", "nodes").replaceAll("hasDict", "checked").replaceAll("treeurl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("DICTIONARIES_ID",DICTIONARIES_ID);
			mv.addObject("pd", pd);	
			mv.setViewName("system/wechatmenu/dictionaries_ztree");
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
		String DICTIONARIES_ID = null == pd.get("DICTIONARIES_ID")?"":pd.get("DICTIONARIES_ID").toString();
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID);					//上级ID
		mv.addObject("pds",dictionariesService.findById(pd));		//传入上级所有信息
		mv.addObject("DICTIONARIES_ID", DICTIONARIES_ID);			//传入ID，作为子级ID用
		mv.setViewName("system/wechatmenu/dictionaries_edit");
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
		String DICTIONARIES_ID = pd.getString("DICTIONARIES_ID");
		pd = dictionariesService.findById(pd);	//根据ID读取
		mv.addObject("pd", pd);					//放入视图容器
		pd.put("DICTIONARIES_ID",pd.get("PARENT_ID").toString());			//用作上级信息
		mv.addObject("pds",dictionariesService.findById(pd));				//传入上级所有信息
		mv.addObject("DICTIONARIES_ID", pd.get("PARENT_ID").toString());	//传入上级ID，作为子ID用
		pd.put("DICTIONARIES_ID",DICTIONARIES_ID);							//复原本ID
		mv.setViewName("system/wechatmenu/dictionaries_edit");
		mv.addObject("msg", "edit");
		return mv;
	}	

	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasBianma")
	@ResponseBody
	public Object hasBianma(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(dictionariesService.findByBianma(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**
	 * 设置菜单到公众号
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/setMenu")
	@ResponseBody
	public Object setMenu()throws Exception{
		Menu menu=new Menu();//菜单
		menu.setErrcode(null);
		List<Button> button=new ArrayList<Button>();//菜单的一级按钮集
		List<WechatMenu> parantMenuList=dictionariesService.listSubDictByParentId("0");//查出所有一级按钮
		for(WechatMenu temp:parantMenuList){
			Button button1=new Button();//子按钮
			List<Button> sub_button1=new ArrayList<Button>();
			List<WechatMenu> childMenuList=dictionariesService.listSubDictByParentId(temp.getDICTIONARIES_ID());
			for(WechatMenu child:childMenuList){
				Button c=new Button();
				c.setName(child.getNAME());
				c.setType(child.getTYPE());
				c.setKey(child.getKEE());
				c.setUrl(child.getURL());
				sub_button1.add(c);
			}
			if(sub_button1.size()>0){//如果二级按钮不为空
				button1.setSub_button(sub_button1);
			}
			button1.setName(temp.getNAME());
			button.add(button1);//把二级按钮添加到一级按钮
		}
		menu.setButton(button);//设置一级按钮集
		BaseWechatResult result=WechatInterfaceInvokeUtil.setMenu(menu);
		Map<String,Object> json=new HashMap<String,Object>();
		if(result.isSuccess()){// 如果设置成功
			json.put("status", "1");
		}else{
			json.put("status", "2");
			json.put("message", result.getErrmsg());
		}
		return json;
	}
	/**
	 * 删除公众号中的菜单
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteMenu")
	@ResponseBody
	public Object deleteMenu()throws Exception{
		Map<String,Object> json=new HashMap<String,Object>();
		if(WechatInterfaceInvokeUtil.deleteMenu()){
			json.put("status", "1");
		}else{
			json.put("status", "2");
		}
		return json;
	}
	@RequestMapping(value="/checkAddable")
	@ResponseBody
	public Object checkAddable()throws Exception{
		Map<String,Object> json=new HashMap<String,Object>();
		PageData pd=this.getPageData();
		String parentId=pd.getString("parentId");
		List<WechatMenu> children=dictionariesService.listSubDictByParentId(parentId);
		if(children!=null&&children.size()>=3&&"0".equals(parentId)){//如果一级菜单大于等于3
			json.put("status", "2");
			json.put("message", "一级菜单数量不能大于3个");
		}else if(children!=null&&children.size()>=5){//如果二级菜单大于等于5
			json.put("status", "2");
			json.put("message", "二级菜单数量不能大于5个");
		}else{
			json.put("status", "1");
		}
		return json;
	}
}
