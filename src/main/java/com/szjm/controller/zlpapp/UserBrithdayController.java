package com.szjm.controller.zlpapp;

import com.szjm.controller.base.BaseController;
import com.szjm.service.zlp.cart.CartManager;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.memorialday.MemorialDayManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.service.zlp.userbrithday.UserBrithdayManager;
import com.szjm.util.Const;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import com.szjm.util.lsh.BirthdayUtil;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 说明：用户好友生日
 * 创建人：
 * 创建时间：2018-07-21
 */
@Controller
@RequestMapping(value="/lshapp/userbrithday")
public class UserBrithdayController extends BaseController {

	String menuUrl = "userbrithday/list.do"; //菜单地址(权限用)
	@Resource(name="userbrithdayService")
	private UserBrithdayManager userbrithdayService;

	@Resource(name="memorialdayService")
	private MemorialDayManager memorialdayService;


	@Resource(name = "lshuserService")
	private LshUserManager appuserService;// 用户

	@Resource(name = "cartService")
	private CartManager cartService;// 购物车

	@Resource(name="sysconfigService")
	private SysConfigManager sysconfigService;//系统参数

	@Resource(name = "goodsService")
	private GoodsManager goodsService;// 商品

	/**添加用户生日信息页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddbrithday")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("lshapp/add_birthday");
		return mv;
	}

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/addUserBirthday")
	@ResponseBody
	public String addUserBirthday(HttpServletRequest request) throws Exception{
		Object user_id = Jurisdiction.getAppUserId();
		PageData pd = new PageData();
		pd = this.getPageData();
		String solar_birthday = pd.get("SOLAR_BIRTHDAY").toString();//选择的新历生日
		String lunarBirthday = BirthdayUtil.getLunarBirthday(solar_birthday);//通过新历生日获取农历生日
		System.out.println("农历生日"+lunarBirthday);
		String nextSolarBirthday = BirthdayUtil.getNextSolarBirthday(solar_birthday);//下一次新历日期
		System.out.println("下一次新历日期"+nextSolarBirthday);
		String nextLunarBirthday = BirthdayUtil.getNextLunarBirthday(solar_birthday);//下一次农历新历日期
		System.out.println("下一次农历新历日期"+nextLunarBirthday);
		int solarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextSolarBirthday);//下一次新历生日天数
		System.out.println("下一次新历生日天数"+solarBetween);
		int lunarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextLunarBirthday);//下一次农历生日
		System.out.println("下一次农历历生日天数"+lunarBetween);
		pd.put("LUNAR_BRITHDAY", lunarBirthday);
		pd.put("NEXT_LUNAR_BRITHDAY", nextLunarBirthday);
		pd.put("NEXT_SOLAR_BRITHDAY", nextSolarBirthday);
		pd.put("NEXT_LB_DAYS", lunarBetween);
		pd.put("NEXT_SB_DAYS", solarBetween);
		pd.put("USER_ID", user_id);
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("DELETE_STATUS", 0);
		pd.put("ADVANCE_DATE_COUNT", 0);
		pd.put("REMIND_TYPE", 2);//默认双历提醒
		userbrithdayService.save(pd);
		return "1";
	}

	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteUser")
	@ResponseBody
	public String deleteUser() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		userbrithdayService.delete(pd);
		return "1";
	}

	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editUserBirthday")
	@ResponseBody
	public String editUserBirthday() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		String solar_birthday = pd.get("SOLAR_BIRTHDAY").toString();//选择的新历生日
		String lunarBirthday = BirthdayUtil.getLunarBirthday(solar_birthday);//通过新历生日获取农历生日
		System.out.println("农历生日"+lunarBirthday);
		String nextSolarBirthday = BirthdayUtil.getNextSolarBirthday(solar_birthday);//下一次新历日期
		System.out.println("下一次新历日期"+nextSolarBirthday);
		String nextLunarBirthday = BirthdayUtil.getNextLunarBirthday(solar_birthday);//下一次农历新历日期
		System.out.println("下一次农历新历日期"+nextLunarBirthday);
		int solarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextSolarBirthday);//下一次新历生日天数
		System.out.println("下一次新历生日天数"+solarBetween);
		int lunarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextLunarBirthday);//下一次农历生日
		System.out.println("下一次农历历生日天数"+lunarBetween);
		pd.put("LUNAR_BRITHDAY", lunarBirthday);
		pd.put("NEXT_LUNAR_BRITHDAY", nextLunarBirthday);
		pd.put("NEXT_SOLAR_BRITHDAY", nextSolarBirthday);
		pd.put("NEXT_LB_DAYS", lunarBetween);
		pd.put("NEXT_SB_DAYS", solarBetween);
		pd.put("UPDARE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("DELETE_STATUS", 0);
		pd.put("ADVANCE_DATE_COUNT", 0);
		pd.put("REMIND_TYPE", 0);
		userbrithdayService.edit(pd);
		return "1";
	}


	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editUserImg")
	@ResponseBody
	public String editUserImg() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		userbrithdayService.edit(pd);
		return "success";
	}

	@RequestMapping(value="/addUserImg")
	public String addUserImg(HttpServletRequest request) throws Exception{
		Object user_id = Jurisdiction.getAppUserId();
		PageData pd = new PageData();
		pd = this.getPageData();
		userbrithdayService.save(pd);
		return "redirect:/lshapp/userbrithday/list.do";
	}




	/**
	 * 修改用户生日提醒
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editRemind")
	@ResponseBody
	public String editRemind() throws Exception{
		String sign="1";
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.get("BIRTHDAY_ID") != null && !"".equals(pd.get("BIRTHDAY_ID"))){
			pd.put("UPDATE_DATE", Tools.date2Str(new Date()));	//日期
			userbrithdayService.edit(pd);
		}else{
			pd.put("UPDATE_DATE", Tools.date2Str(new Date()));	//日期
			appuserService.edit(pd);
		}
		return sign;
	}


	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest request) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"列表UserBrithday");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		Integer user_id = (Integer)request.getSession().getAttribute(Const.SESSION_APP_USER_ID);
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_ID", user_id);
		List<PageData>	varList = userbrithdayService.listAll(pd);	//列出UserBrithday列表
		List<PageData> listAll = memorialdayService.listAll(pd); //纪念日列表
		mv.setViewName("lshapp/birthday_home");
		mv.addObject("varList", varList);
		mv.addObject("memoList", listAll);
		mv.addObject("pd", pd);
		return mv;
	}



	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/birthdayDetail")
	public ModelAndView birthdayDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = userbrithdayService.findById(pd);	//根据ID读取
		mv.setViewName("lshapp/edit_birthday");
		mv.addObject("pd", pd);
		return mv;
	}


	/**去设置生日提醒 页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goBirthdayRemind")
	public ModelAndView goBirthdayRemind()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		pd = userbrithdayService.findById(pd);
		String advance_date_count = pd.get("ADVANCE_DATE_COUNT").toString();
		String[] split = advance_date_count.split(",");

		for (int i = 0; i < split.length; i++) {
			if("0".equals(split[i])){
				pds.put("ad0", "9");
			}
			if("1".equals(split[i])){
				pds.put("ad1", "9");
			}
			if("3".equals(split[i])){
				pds.put("ad3", "9");
			}
			if("7".equals(split[i])){
				pds.put("ad7", "9");
			}
			if("30".equals(split[i])){
				pds.put("ad30", "9");
			}

		}
		mv.setViewName("lshapp/birthday_remind");
		mv.addObject("pd", pd);
		mv.addObject("pds", pds);
		return mv;
	}



	/**app用户生日提醒修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAppUserBirthdayRemind")
	public ModelAndView goAppUserBirthdayRemind()throws Exception{
		Integer user_id = Jurisdiction.getAppUserId();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		pd.put("USER_ID", user_id);
		pd = appuserService.findById(pd);
		String advance_date_count = pd.get("ADVANCE_DATE_COUNT").toString();
		String[] split = advance_date_count.split(",");

		for (int i = 0; i < split.length; i++) {
			if("0".equals(split[i])){
				pds.put("ad0", "9");
			}
			if("1".equals(split[i])){
				pds.put("ad1", "9");
			}
			if("3".equals(split[i])){
				pds.put("ad3", "9");
			}
			if("7".equals(split[i])){
				pds.put("ad7", "9");
			}
			if("30".equals(split[i])){
				pds.put("ad30", "9");
			}

		}
		mv.setViewName("lshapp/birthday_remind");
		mv.addObject("pd", pd);
		mv.addObject("pds", pds);
		return mv;
	}




	 /**
	  * 去领取蛋糕页面
	  * @param binder
	  */
	@RequestMapping(value="/go_get_cake")
	public ModelAndView go_get_cake()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd.put("GOODS_POSITION", 2);
		//FREE_CAKE_COUNT
		List<PageData> goodsList=goodsService.listAll(pd);
		pd.put("ZWWW", "QWE");
		List<PageData> cartList=cartService.listAllCartAndGoods(pd);
		List<PageData> sysList=sysconfigService.listAll(pd);
		//PageData pdUser= appuserService.findById(pd);
		Integer count=(Integer)sysList.get(0).get("FREE_CAKE_COUNT");
		if(cartList.size()<count){
			mv.addObject("count",0);//表是还有抽奖的机会
		}else{
			mv.addObject("count", 1);//表是没有
		}
		/*if("".equals(anObject)pdUser.get("ROLE")){

		}*/
		mv.setViewName("lshapp/get_cake");
		mv.addObject("pd", pd);
		mv.addObject("goodsList", goodsList);
		return mv;
	}

	/**保存领取的蛋糕
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save_cake")
	public void save_cake(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdGoodsn = new PageData();
		pdGoodsn.put("GOODS_ID", pd.get("GOODS_ID"));
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		pd=appuserService.findById(pd);
		PageData pdGoods=goodsService.findById(pdGoodsn);
		PageData pdCart = new PageData();
		List<PageData> sys=sysconfigService.listAll(pd);
		if("agent".equals(pd.get("ROLE").toString())||"partner".equals(pd.get("ROLE").toString())){

			pdCart.put("REAL_PAY_AMOUNT", sys.get(0).get("AWARD_POSTAGE"));
		}else{

			pdCart.put("REAL_PAY_AMOUNT", 0);
		}
		pdCart.put("USER_ID", user_id);
		pdCart.put("GOODS_ID", pdGoodsn.get("GOODS_ID"));
		pdCart.put("SPEC", null);
		pdCart.put("GOODS_CURRENT_PRICE", sys.get(0).get("AWARD_POSTAGE"));
		pdCart.put("AMOUNT", 1);
		pdCart.put("GOODS_AMOUNT", 0);
		pdCart.put("INTEGRATION_AMOUNT", 0);
		pdCart.put("DEDUCTION_MONEY", 0);
		pdCart.put("CREATE_DATE", Tools.date2Str(new Date()));
		pdCart.put("DELETE_STATUS", 0);
		pdCart.put("GOODS_ORIGINAL_PRICE", pdGoods.get("ORIGINAL_PRICE"));
		pdCart.put("ORDER_ID", null);
		pdCart.put("GOODS_POSITION", 2);
		pdCart.put("NEED_INTEGRATION", 0);
		pdCart.put("IS_COMMENT", null);
		pdCart.put("TYPE", 2);
		cartService.saveAward(pdCart);
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		response.sendRedirect(basePath + "lshapp/order/submit.do?ids="+pdCart.get("CART_ID"));
	}

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public ModelAndView index()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.setViewName("lshapp/index");
		mv.addObject("pd", pd);
		return mv;
	}
}
