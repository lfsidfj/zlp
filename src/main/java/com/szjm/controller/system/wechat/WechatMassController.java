package com.szjm.controller.system.wechat;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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

import spiderman.wechat.domain.param.MassSend;
import spiderman.wechat.domain.result.MassResult;
import spiderman.wechat.domain.result.MassSendStatusResult;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatmass.WechatMassManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;

/** 
 * 说明：消息群发
 * 创建人：
 * 创建时间：2017-07-17
 */
@Controller
@RequestMapping(value="/wechatmass")
public class WechatMassController extends BaseController {
	
	String menuUrl = "wechatmass/list.do"; //菜单地址(权限用)
	@Resource(name="wechatmassService")
	private WechatMassManager wechatmassService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增WechatMass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		MassSend send=new MassSend();
		//发送内容
		if("mpnews".equals(pd.get("MSGTYPE").toString())){//图文
			MassSend.Mpnews mpnews=send.new Mpnews();
			mpnews.setMedia_id(pd.get("MEDIA_ID").toString());
			send.setMpnews(mpnews);
		}else if("text".equals(pd.get("MSGTYPE").toString())){//文本
			MassSend.Text text=send.new Text();
			text.setContent(pd.get("TEXTCONTENT").toString());
			send.setText(text);
		}else if("image".equals(pd.get("MSGTYPE").toString())){//图片
			MassSend.Image image=send.new Image();
			image.setMedia_id(pd.get("MEDIA_ID").toString());
			send.setImage(image);
		}else if("mpvideo".equals(pd.get("MSGTYPE").toString())){//视频
			MassSend.Mpvideo mpvideo=send.new Mpvideo();
			mpvideo.setMedia_id(pd.get("MEDIA_ID").toString());
			send.setMpvideo(mpvideo);
			send.setTitle(pd.get("TITLE").toString());
			send.setDescription(pd.get("DESCRIPTION").toString());
		}else if("voice".equals(pd.get("MSGTYPE").toString())){//语音
			MassSend.Voice voice=send.new Voice();
			voice.setMedia_id(pd.get("MEDIA_ID").toString());
			send.setVoice(voice);
		}
		//发送对象
		if("all".equals(pd.get("IS_TO_ALL").toString())){
			MassSend.Filter filter=send.new Filter();
			filter.setIs_to_all(true);
			send.setFilter(filter);
		}else if("tag".equals(pd.get("IS_TO_ALL").toString())){
			MassSend.Filter filter=send.new Filter();
			filter.setIs_to_all(false);
			filter.setTag_id(pd.get("TAG_ID").toString());
			send.setFilter(filter);
		}else if("openid".equals(pd.get("IS_TO_ALL").toString())){
			String openidList=pd.get("OPENIDLIST").toString();
			String[] openidList1=openidList.split(",");
			List<String> touser=Arrays.asList(openidList1);
			send.setTouser(touser);
		}
		send.setClientmsgid(String.valueOf(System.currentTimeMillis()));
		send.setSend_ignore_reprint(Integer.valueOf(pd.get("SEND_IGNORE_REPRINT").toString()));
		MassResult result=WechatInterfaceInvokeUtil.massSend(send);
		if(result.isSuccess()){
			//pd.put("WECHAT_MASS_ID", id);	//主键
			pd.put("STATUS", "0");
			pd.put("MSG_ID", result.getMsg_id());
			if(result.getMsg_data_id()!=null){
				pd.put("MSG_DATA_ID", result.getMsg_data_id());
			}
		}else{
			pd.put("STATUS", "-1");
			pd.put("ERRMSG", result.getErrmsg());
		}
		wechatmassService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除WechatMass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		wechatmassService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改WechatMass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		wechatmassService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表WechatMass");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = wechatmassService.list(page);	//列出WechatMass列表
		mv.setViewName("system/wechat/wechatmass/wechatmass_list");
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
		mv.setViewName("system/wechat/wechatmass/wechatmass_edit");
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
		pd = wechatmassService.findById(pd);	//根据ID读取
		mv.setViewName("system/wechat/wechatmass/wechatmass_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除WechatMass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			wechatmassService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出WechatMass到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("消息类型");	//1
		titles.add("状态");	//2
		titles.add("媒体编号");	//3
		titles.add("标签");	//4
		titles.add("向全部用户发送");	//5
		titles.add("标题");	//6
		titles.add("描述");	//7
		titles.add("校验标识");	//8
		titles.add("消息编号");	//9
		titles.add("MSG_DATA_ID");	//10
		titles.add("文本内容");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = wechatmassService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MSGTYPE"));	    //1
			vpd.put("var2", varOList.get(i).getString("STATUS"));	    //2
			vpd.put("var3", varOList.get(i).getString("MEDIA_ID"));	    //3
			vpd.put("var4", varOList.get(i).get("TAG_ID").toString());	//4
			vpd.put("var5", varOList.get(i).getString("IS_TO_ALL"));	    //5
			vpd.put("var6", varOList.get(i).getString("TITLE"));	    //6
			vpd.put("var7", varOList.get(i).getString("DESCRIPTION"));	    //7
			vpd.put("var8", varOList.get(i).getString("SEND_IGNORE_REPRINT"));	    //8
			vpd.put("var9", varOList.get(i).get("MSG_ID").toString());	//9
			vpd.put("var10", varOList.get(i).get("MSG_DATA_ID").toString());	//10
			vpd.put("var11", varOList.get(i).getString("TEXTCONTENT"));	    //11
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
	/**
	 * 查询群发状态
	 *author:Spiderman
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/queryMassSendResult")
	public void queryMassSendResult(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除WechatMass");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		MassSendStatusResult result=WechatInterfaceInvokeUtil.getMassSendStatus(pd.get("MSG_ID").toString());
		if("SEND_SUCCESS".equals(result.getMsg_status())){
			pd.put("STATUS", "1");
		}
		wechatmassService.editNotNull(pd);
		out.write("success");
		out.close();
	}
}
