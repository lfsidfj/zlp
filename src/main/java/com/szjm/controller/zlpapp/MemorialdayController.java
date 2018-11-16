package com.szjm.controller.zlpapp;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.memorialday.MemorialDayManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/** 
 * 说明：纪念日
 * 创建人：
 * 创建时间：2018-07-24
 */
@Controller
@RequestMapping(value="/lshapp/memorialday")
public class MemorialdayController extends BaseController {
	
	@Resource(name="memorialdayService")
	private MemorialDayManager memorialdayService;
	
	
	
	/**去添加纪念日页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goMemorialday")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("lshapp/add_commemorate");
		mv.addObject("msg", "addMemorialday");
		return mv;
	}	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addMemorialday")
	@ResponseBody
	public String save() throws Exception{
		Integer appUserId = Jurisdiction.getAppUserId();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.remove("MEMORIALDAY_ID");
		pd.put("USER_ID", appUserId);
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("DELETE_STATUS", 0);
		memorialdayService.save(pd);
		return "1";
	}
	
	
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteMemorialday")
	@ResponseBody
	public String delete() throws Exception{
		
		PageData pd = new PageData();
		pd = this.getPageData();
		memorialdayService.delete(pd);
		return "1";
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editMemorialday")
	@ResponseBody
	public String editMemorialday() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		memorialdayService.edit(pd);
		return "1";
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = memorialdayService.list(page);	//列出Memorialday列表
		mv.setViewName("lshapp/memorialday/memorialday_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditMemorialday")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = memorialdayService.findById(pd);	//根据ID读取
		mv.setViewName("lshapp/add_commemorate");
		mv.addObject("msg", "editMemorialday");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
