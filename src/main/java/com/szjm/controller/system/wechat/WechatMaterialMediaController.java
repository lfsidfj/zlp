package com.szjm.controller.system.wechat;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spiderman.util.file.AttachmentUtil;
import spiderman.util.file.FileUtil;
import spiderman.wechat.domain.result.BaseWechatResult;
import spiderman.wechat.domain.result.PermanentAttachUploadResult;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatmedia.WechatMediaManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;

/** 
 * 说明：微信永久素材
 * 创建人：
 * 创建时间：2017-07-12
 */
@Controller
@RequestMapping(value="/wechatmaterialmedia")
public class WechatMaterialMediaController extends BaseController {
	
	String menuUrl = "wechatmaterialmedia/list.do"; //菜单地址(权限用)
	@Resource(name="wechatmediaService")
	private WechatMediaManager wechatmediaService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(MultipartFile pictureFile) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增WechatMedia");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("WECHATMEDIA_ID", this.get32UUID());	//主键
		
		
		String path=AttachmentUtil.save(pictureFile);//保存临时素材
		PermanentAttachUploadResult result=WechatInterfaceInvokeUtil.uploadPermanentOthers(path);//上传永久素材
		String attachType = WechatInterfaceInvokeUtil.getAttachType(FileUtil.getFileSuffix(path));
		pd.put("TYPE", attachType);
		pd.put("MEDIA_ID", result.getMedia_id());
		pd.put("CREATED_AT", String.valueOf(System.currentTimeMillis()));
		pd.put("URL", result.getUrl());
		pd.put("LOCATION", path);
		pd.put("TEMPORARYORMATERIAL", "1");
		wechatmediaService.save(pd);//保存临时素材记录到数据库
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 下载临时文件到本地
	 *author:Spiderman
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/downLoadMidea")
	@ResponseBody
	public Object downLoadMedia() throws Exception{
		PageData pd=this.getPageData();
		Map<String,Object> map=new HashMap<String,Object>();//返回json
		String path=WechatInterfaceInvokeUtil.downLoadMidea(pd.getString("MEDIA_ID"));
		pd.put("LOCATION", path);
		wechatmediaService.edit(pd);
		map.put("status", "1");
		return map;
	}
	
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除WechatMedia");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		BaseWechatResult result=WechatInterfaceInvokeUtil.deletePermanentMidea(pd.getString("MEDIA_ID"));
		if(result.isSuccess()){
			wechatmediaService.delete(pd);
		}
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改WechatMedia");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		wechatmediaService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表WechatMedia");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("EXCLUDENEWS", "EXCLUDENEWS");
		pd.put("TEMPORARYORMATERIAL", "1");
		page.setPd(pd);
		List<PageData>	varList = wechatmediaService.list(page);	//列出WechatMedia列表
		mv.setViewName("system/wechat/wechatmaterialmedia/wechatmedia_list");
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
		mv.setViewName("system/wechat/wechatmaterialmedia/wechatmedia_edit");
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
		pd = wechatmediaService.findById(pd);	//根据ID读取
		mv.setViewName("system/wechat/wechatmaterialmedia/wechatmedia_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除WechatMedia");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			wechatmediaService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出WechatMedia到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("备注1");	//1
		titles.add("备注2");	//2
		titles.add("备注3");	//3
		titles.add("备注4");	//4
		titles.add("备注5");	//5
		titles.add("备注6");	//6
		titles.add("备注7");	//7
		dataMap.put("titles", titles);
		List<PageData> varOList = wechatmediaService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MEDIA_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("TYPE"));	    //2
			vpd.put("var3", varOList.get(i).getString("CREATED_AT"));	    //3
			vpd.put("var4", varOList.get(i).getString("LOCATION"));	    //4
			vpd.put("var5", varOList.get(i).getString("URL"));	    //5
			vpd.put("var6", varOList.get(i).getString("TITLE"));	    //6
			vpd.put("var7", varOList.get(i).getString("INTRODUCTION"));	    //7
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
