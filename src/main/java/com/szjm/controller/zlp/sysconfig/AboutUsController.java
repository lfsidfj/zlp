package com.szjm.controller.zlp.sysconfig;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.RequestImageSave;

/**
 * 说明：系统参数
 * 创建人：
 * 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value="/usconfig")
public class AboutUsController extends BaseController{
	String menuUrl = "usconfig/list.do"; //菜单地址(权限用)
	@Resource(name="sysconfigService")
	private SysConfigManager sysconfigService;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表SysConfig");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = sysconfigService.list(page);	//列出SysConfig列表
		for (PageData pageData : varList) {
			mv.addObject("pd", pageData);
		}
		mv.setViewName("zlp/sysconfig/about_us_edit");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public void edit(HttpServletRequest request,HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改SysConfig");
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, String> map = RequestImageSave.getPatems(request); // 获得修改参数
		pd.put("ABOUT_US", map.get("ABOUT_US"));// 百度富文本编辑类容
		pd.put("CONFIG_ID", map.get("CONFIG_ID"));//
		sysconfigService.edit(pd);
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
		response.sendRedirect(basePath+"usconfig/list.do");
	}
}
