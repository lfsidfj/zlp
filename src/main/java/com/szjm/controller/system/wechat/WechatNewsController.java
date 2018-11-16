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
import org.springframework.web.servlet.ModelAndView;

import spiderman.wechat.domain.param.Article;
import spiderman.wechat.domain.param.ArticleList;
import spiderman.wechat.domain.param.MideaListSend;
import spiderman.wechat.domain.result.BaseWechatResult;
import spiderman.wechat.domain.result.MideaCountResult;
import spiderman.wechat.domain.result.MideaListResult;
import spiderman.wechat.domain.result.NewsListResult;
import spiderman.wechat.domain.result.PermanentNewsUploadResult;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.system.wechat.wechatmedia.WechatMediaManager;
import com.szjm.service.system.wechat.wechatnews.WechatNewsManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Jurisdiction;
import com.szjm.util.ObjectExcelView;
import com.szjm.util.PageData;

/** 
 * 说明：微信文章素材
 * 创建人：
 * 创建时间：2017-07-12
 */
@Controller
@RequestMapping(value="/wechatnews")
public class WechatNewsController extends BaseController {
	
	String menuUrl = "wechatnews/list.do"; //菜单地址(权限用)
	@Resource(name="wechatmediaService")
	private WechatMediaManager wechatmediaService;
	//微信素材之文章接口
	@Resource(name="wechatnewsService")
	private WechatNewsManager wechatNewsManager;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增WechatMedia");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TYPE", "news");
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
		String path=WechatInterfaceInvokeUtil.downLoadPermanentMidea(pd.getString("MEDIA_ID"));
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
		PageData media=wechatmediaService.findById(pd);
		if(media.get("MEDIA_ID")!=null){
			BaseWechatResult result=WechatInterfaceInvokeUtil.deletePermanentMidea(media.getString("MEDIA_ID"));
			if(result.isSuccess()){
				wechatmediaService.delete(pd);
			}
		}else{
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
		if("1".equals(pd.get("synchronize"))){
			synchronize();
		}
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TEMPORARYORMATERIAL", "1");
		pd.put("TYPE", "news");
		page.setPd(pd);
		List<PageData>	varList = wechatmediaService.list(page);	//列出WechatMedia列表
		mv.setViewName("system/wechat/wechatnews/wechatmedia_list");
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
		mv.setViewName("system/wechat/wechatnews/wechatmedia_edit");
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
		mv.setViewName("system/wechat/wechatnews/wechatmedia_edit");
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
	/**
	 * 同步
	 *author:Spiderman
	 * @throws Exception
	 */
	private void synchronize() throws Exception{
		MideaCountResult count=WechatInterfaceInvokeUtil.getPermanentMideaCount();//获取素材总数
		MideaListSend send =new MideaListSend();
		send.setType("news");
		send.setCount(20);
		for(int i=0;i<count.getNews_count();i=i+20){
			send.setOffset(i);
			MideaListResult list=WechatInterfaceInvokeUtil.getPermanentMideaList(send);
			for(MideaListResult.Item temp1:list.getItem()){
				PageData news=new PageData();
				news.put("TYPE", "news");
				news.put("TEMPORARYORMATERIAL", "1");
				news.put("MEDIA_ID", temp1.getMedia_id());
				news.put("UPDATE_TIME", temp1.getUpdate_time());
				wechatmediaService.save(news);
				MideaListResult.Item item=temp1;
				int ii=0;
				for(MideaListResult.NewsItem temp2:item.getContent().getNews_item()){
					//wechatNewsManager
					PageData newsItem=new PageData();
					newsItem.put("AUTHOR", temp2.getAuthor());
					newsItem.put("CONTENT", temp2.getContent());
					newsItem.put("CONTENT_SOURCE_URL", temp2.getContent_source_url());
					newsItem.put("DIGEST", temp2.getDigest());
					newsItem.put("SHOW_COVER_PIC", temp2.getShow_cover_pic());
					newsItem.put("THUMB_MEDIA_ID", temp2.getThumb_media_id());
					newsItem.put("TITLE", temp2.getTitle());
					newsItem.put("URL", temp2.getUrl());
					newsItem.put("MEDIA_ID", item.getMedia_id());
					newsItem.put("ORDER_BY", ii);
					newsItem.put("WECHAT_MEDIA_ID", news.get("WECHAT_MEDIA_ID"));
					wechatNewsManager.save(newsItem);
					ii++;
				}
			}
		}
	}
	/**
	 * 发表图文至微信服务器
	 *author:Spiderman
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/publicNews")
	@ResponseBody
	public Object publicNews()throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();//返回前端，1为成功，2为失败
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> newsList = wechatNewsManager.listAll(pd);	//查出该ID下的所有图文
		if(newsList!=null&&!newsList.isEmpty()){
			List<Article> articles=new ArrayList<Article>();
			for(PageData temp:newsList){
				Article article=new Article();
				article.setAuthor(temp.getString("AUTHOR"));
				article.setContent(temp.getString("CONTENT"));
				article.setContent_source_url(temp.getString("CONTENT_SOURCE_URL"));
				article.setDigest(temp.getString("DIGEST"));
				article.setShow_cover_pic(temp.getString("SHOW_COVER_PIC"));
				article.setThumb_media_id(temp.getString("THUMB_MEDIA_ID"));
				article.setTitle(temp.getString("TITLE"));
				articles.add(article);
			}
			ArticleList articleList=new ArticleList();
			articleList.setArticles(articles);
			PermanentNewsUploadResult result=WechatInterfaceInvokeUtil.uploadPermanentNews(articleList);
			if(result.isSuccess()){
				pd.put("MEDIA_ID", result.getMedia_id());
				pd.put("UPDATE_TIME", String.valueOf(System.currentTimeMillis()));
				wechatmediaService.edit(pd);//更新媒体编号
				map.put("status", "1");
			}else{
				map.put("status", "2");
				map.put("message", "上传失败");
			}
		}else{
			map.put("status", "2");
			map.put("message", "该图文列表为空");
		}
		return map;
	}
	/**
	 * 下载永久图文素材
	 *author:Spiderman
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/downLoadNews")
	@ResponseBody
	public Object downLoadNews()throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();//返回前端，1为成功，2为失败
		PageData pd=this.getPageData();
		PageData media=wechatmediaService.findById(pd);
		if(media.get("MEDIA_ID")!=null){//如果有多媒体编号
			NewsListResult newsList=WechatInterfaceInvokeUtil.downLoadPermanentNews(media.getString("MEDIA_ID"));
			if(newsList.isSuccess()){
				List<PageData> newsList1=new ArrayList<PageData>();//要保存的
				int index=0;
				for(NewsListResult.Item temp:newsList.getNews_item()){
					PageData item=this.getPageData();//图文
					item.put("AUTHOR", temp.getAuthor());
					item.put("CONTENT", temp.getContent());
					item.put("CONTENT_SOURCE_URL", temp.getContent_source_url());
					item.put("DIGEST", temp.getDigest());
					item.put("SHOW_COVER_PIC", temp.getShow_cover_pic());
					item.put("THUMB_MEDIA_ID", temp.getThumb_media_id());
					item.put("TITLE", temp.getTitle());
					item.put("URL", temp.getUrl());
					item.put("MEDIA_ID", media.get("MEDIA_ID"));
					item.put("WECHAT_MEDIA_ID", media.get("WECHAT_MEDIA_ID"));
					item.put("ORDER_BY", index);
					newsList1.add(item);
					index++;
				}
				try {
					wechatNewsManager.deleteByWechatMediaId(Integer.valueOf(pd.getString("WECHAT_MEDIA_ID")));
					wechatNewsManager.batchSave(newsList1);
					map.put("status", "1");
				} catch (Exception e) {
					// TODO: handle exception
					map.put("status", "2");
					map.put("status", "保存失败！");
				}
			}else{
				map.put("status", "2");
				map.put("status", "下载失败！");
			}
		}else{
			map.put("status", "2");
			map.put("message", "没有多媒体编号！");
		}
		return map;
	}
}
