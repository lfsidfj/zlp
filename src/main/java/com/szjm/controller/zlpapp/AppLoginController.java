package com.szjm.controller.zlpapp;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.szjm.controller.base.BaseController;
import com.szjm.service.system.wechat.wechatuser.WechatUserManager;
import com.szjm.service.zlp.finance.FinanceManager;
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.order.OrderManager;
import com.szjm.service.zlp.smsrecord.SmsRecordManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.util.Const;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import spiderman.util.base.SmsUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 说明：用户管理
 * 创建人：
 * 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value="/lshapp/appLogin")
public class AppLoginController extends BaseController {

	String menuUrl = "lshuser/list.do"; //菜单地址(权限用)
	@Resource(name="lshuserService")
	private LshUserManager lshuserService;//用户

	@Resource(name="sysconfigService")
	private SysConfigManager sysconfigService;//系统参数

	@Resource(name="financeService")
	private FinanceManager financeService;//收入支出明细

	@Resource(name="integrationrecordService")
	private IntegrationRecordManager integrationrecordService;//礼豆明细

	@Resource(name="orderService")
	private OrderManager orderService;//订单
	@Resource(name="smsrecordService")
	private SmsRecordManager smsrecordService;//短信记录

	@Resource(name="wechatuserService")
	private WechatUserManager wechatuserService;


	/**
	 * 用户登陆
	 */
	@RequestMapping(value="/user_login")
	@ResponseBody
	public String user_login(HttpServletRequest request,String PHONE_NUMBER,String PASSWORD) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PHONE_NUMBER", PHONE_NUMBER);
		pd.put("PASSWORD", PASSWORD);
		String result="";
		if((pd.get("PHONE_NUMBER")!=null&&!pd.get("PHONE_NUMBER").toString().equals(""))&&(pd.get("PASSWORD")!=null&&!pd.get("PHONE_NUMBER").toString().equals(""))){
			PASSWORD = new SimpleHash("SHA-1",PASSWORD).toString();	//密码加密
			pd.put("PASSWORD", PASSWORD);
			PageData userP=lshuserService.findById(pd);
			if(userP!=null){
				request.getSession().setAttribute(Const.SESSION_APP_USER_ID, userP.get("USER_ID"));
				request.getSession().setAttribute(Const.SESSION_APP_USER_ROLE, userP.get("ROLE"));
				result="success";
			}else{
				result="false";
			}
		}else{
			result="false";
		}
		return result;
	}
	/**
	 * 新用户去的登陆页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/go_user_login")
	public ModelAndView go_user_login()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("lshapp/user_login");
		return mv;
	}
	/**
	 * 新用户去注册页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/go_user_regisrer")
	public ModelAndView go_user_regisrer()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("lshapp/user_register");
		mv.addObject("pd",pd);
		return mv;
	}
	/**
	 * 去找回密码页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/go_find_password")
	public ModelAndView go_find_password()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("lshapp/find_password");
		return mv;
	}
	/**
	 * 保存修改密码
	 */
	@RequestMapping(value="/update_password")
	@ResponseBody
	public String update_password(HttpServletRequest request,String PASSWORD)throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		PASSWORD = new SimpleHash("SHA-1",PASSWORD).toString();	//密码加密
		pd.put("PASSWORD", PASSWORD);
		lshuserService.updatePassword(pd);
		return "success";
	}
	/**
	 *查询推荐码
	 */
	@RequestMapping(value="/judgeInviteCode")
	@ResponseBody
	public String judgeInviteCode(HttpServletRequest request,String INVITE_CODE) throws Exception{
		PageData pd = new PageData();
		pd.put("INVITE_CODE", INVITE_CODE);
		PageData userP=lshuserService.findById(pd);
		String result="";
		if(userP!=null){
			result="success";
		}else{
			result="false";
		}
		return result;
	}
	/**
	 *验证手机号
	 */
	@RequestMapping(value="/judgePhone")
	@ResponseBody
	public String judgePhone(HttpServletRequest request,String PHONE_NUMBER) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData userP=new PageData();
		String result="";
		if("save".equals(pd.get("type").toString())){//用户注册获取验证码
			userP=lshuserService.findById(pd);
			if(userP==null){
				result="success";
			}else{
				result="false";
			}
		}else{
			Integer user_id = Jurisdiction.getAppUserId();
			pd.put("USER_ID", user_id);
			userP=lshuserService.findById(pd);
			if(userP==null){
				result="falseQ";
			}else{
				result="success";
			}
		}
		return result;
	}
	/**
	 * 注册时 发短信
	 */
	@RequestMapping(value="/sendMsg")
	@ResponseBody
	public String sendMsg(HttpServletRequest request,String type) throws Exception{
		PageData pd = new PageData();
		//pd.put("PHONE_NUMBER", PHONE_NUMBER);
		pd = this.getPageData();
		Integer code  = (int)((Math.random()*9+1)*100000);
		PageData pdCode = new PageData();
		String PHONE_NUMBER=pd.get("PHONE_NUMBER").toString();
		pdCode.remove("SMSRECORD_ID");
		pdCode.put("PHONE_NUMBER",PHONE_NUMBER);
		pdCode.put("CODE", code);
		pdCode.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pdCode.put("DELETE_STATUS", 0);	//删除状态
		String result="";
		SendSmsResponse response=SmsUtil.sendSms(PHONE_NUMBER,code+"");
		if(response.getCode() != null && response.getCode().equals("OK")){
			pdCode.put("SEND_STATUS", 1);	//发送状态
			smsrecordService.save(pdCode);
			result="success";
		}else{
			pdCode.put("SEND_STATUS", 0);	//发送状态
			smsrecordService.save(pdCode);
			result="false";
		}
		return result;
	}
	//验证码判断
	@RequestMapping(value="/sendJudge")
	@ResponseBody
	public String sendJudge(HttpServletRequest request) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SEND_STATUS", 1);
		String code =pd.get("code").toString();
		pd= smsrecordService.findByNew(pd);
		//pd.put("OPENID", user.getOpenid());
		//PageData codePd=codeService.findById(pd);
		String result="";
		String add_time=pd.get("CREATE_DATE").toString();//验证码添加时间
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowDate = new Date();//当前时间
		Date afterDate = new Date(nowDate .getTime() - 900000);//5分钟有效期
		String nowNew=sf.format(afterDate);
		Integer i=add_time.compareTo(nowNew);
		if(code.equals(pd.get("CODE").toString())){
			if(i>0){
				result="success";
			}else{
				result="false";
			}
		}else{
			result="false1";
		}
		return result;
	}
	/**
	 * 保存新用户注册信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public String save(HttpServletResponse response)throws Exception{
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		String PASSWORD = new SimpleHash("SHA-1",pd.get("PASSWORD").toString()).toString();	//密码加密
		pd.put("PASSWORD", PASSWORD);
		Object INVITE_CODE=pd.get("INVITE_CODE");
		pd.remove("USER_ID");	//主键
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
		pd.put("DELETE_STATUS", 0);	//删除状态
		pd.put("ROLE", "common");	//新注册用户的角色
		pd.put("INTEGRATION", 0);	//礼豆0
		pd.put("MONEY", 0);	//金额0
		int code=(int)((Math.random()*9+1)*100000);
		pd.put("INVITE_CODE", code);	//金额0
		//判断新用户有无推荐码
		if(INVITE_CODE!= null && !"".equals(INVITE_CODE.toString())){
			PageData pdUser=new PageData();
			pdUser.put("INVITE_CODE",INVITE_CODE);
			pdUser=lshuserService.findById(pdUser);
			double integration=(Integer)pdUser.get("INTEGRATION");
			if("agent".equals(pdUser.get("ROLE").toString())||"partner".equals(pdUser.get("ROLE").toString())){
				 List<PageData> sys=	sysconfigService.listAll(pdUser);
				 PageData pdRecord = new PageData();
				 for (PageData pageData : sys) {
					 if("agent".equals(pdUser.get("ROLE").toString())){
						 integration=integration+integration*Double.parseDouble(pageData.get("AGENT_INVITE_RATE").toString());
						 pdRecord.put("AMOUNT", integration*Double.parseDouble(pageData.get("AGENT_INVITE_RATE").toString()));	//类型

					 }
					 if("partner".equals(pdUser.get("ROLE").toString())){
						 integration=integration+integration*Double.parseDouble(pageData.get("PARTNER_INVITE_RATE").toString());
						 pdRecord.put("AMOUNT", integration*Double.parseDouble(pageData.get("PARTNER_INVITE_RATE").toString()));	//类型
					 }
				 }
				 int i=(int)integration;
				 pdUser.put("INTEGRATION", i);
				 lshuserService.edit(pdUser);

				 pdRecord.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
				 pdRecord.put("RECORD_TYPE", 0);	//类型
				 pdRecord.put("DELETE_STATUS", 0);	//删除状态
				 pdRecord.put("USER_ID", pdUser.get("USER_ID"));
				 pdRecord.put("INCOME_REASON", 6);//来源
				 integrationrecordService.save(pdRecord);

			}
			pd.put("PARENT_ID", pdUser.get("USER_ID"));	//
			PageData pdUserJN=new PageData();
			PageData pdUserJNP=new PageData();
			if(pdUser.get("PARTNER_USER_ID")!=null&&!"".equals(pdUser.get("PARTNER_USER_ID").toString())){
				pdUserJN.put("USER_ID", pdUser.get("PARTNER_USER_ID"));
				pdUserJNP=lshuserService.findById(pdUserJN);
				if(pdUserJNP!=null){
					pd.put("PARTNER_USER_ID", pdUser.get("PARTNER_USER_ID"));	//
				}else{
					pd.put("PARTNER_USER_ID", null);	//
				}
			}else{
				pd.put("PARTNER_USER_ID", null);	//
			}

		}
//		String solar_birthday = pd.get("SOLAR_BIRTHDAY").toString();//选择的新历生日
//		String lunarBirthday = BirthdayUtil.getLunarBirthday(solar_birthday);//通过新历生日获取农历生日
//		System.out.println("农历生日"+lunarBirthday);
//		String nextSolarBirthday = BirthdayUtil.getNextSolarBirthday(solar_birthday);//下一次新历日期
//		System.out.println("下一次新历日期"+nextSolarBirthday);
//		String nextLunarBirthday = BirthdayUtil.getNextLunarBirthday(solar_birthday);//下一次农历新历日期
//		System.out.println("下一次农历新历日期"+nextLunarBirthday);
//		int solarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextSolarBirthday);//下一次新历生日天数
//		System.out.println("下一次新历生日天数"+solarBetween);
//		int lunarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextLunarBirthday);//下一次农历生日
//		System.out.println("下一次农历历生日天数"+lunarBetween);
//		pd.put("LUNAR_BRITHDAY", lunarBirthday);
//		pd.put("NEXT_LUNAR_BRITHDAY", nextLunarBirthday);
//		pd.put("NEXT_SOLAR_BRITHDAY", nextSolarBirthday);
//		pd.put("NEXT_LB_DAYS", lunarBetween);
//		pd.put("NEXT_SB_DAYS", solarBetween);
		pd.put("TOKEN",this.get32UUID());	//Token
		pd.put("REMIND_TYPE", 2);// 默认双历提醒
		pd.put("ADVANCE_DATE_COUNT", 0);//默认当天提醒
		if(pd.get("OPENID") != null&&!"".equals(pd.get("OPENID").toString())){
			pds.put("OPENID", pd.get("OPENID"));
			//PageData wxFindById = wechatuserService.findById(pd);
			PageData userFindById = lshuserService.findById(pds);
			if(userFindById != null){
				return "0";
			}else{
				lshuserService.save(pd);
				pds.put("USER_ID", pd.get("USER_ID"));
				pds.put("OPENID", pd.get("OPENID"));
				wechatuserService.edit(pds);
				return "1";
			}
		}else{
			lshuserService.save(pd);
			return "1";
		}
	}
	@RequestMapping(value="/dateSelector")
	public ModelAndView dateSelector()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("lshapp/date_selector");//保存成功后跳转登陆界面
		return mv;
	}
	@RequestMapping(value="/dateSelector1")
	public ModelAndView dateSelector1()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.get("ymd")!=null&&!"".equals(pd.get("ymd").toString())){
			try {
				mv.addObject("y", pd.get("ymd").toString().substring(0, 4));
				mv.addObject("m", pd.get("ymd").toString().substring(5, 7));
				mv.addObject("d", pd.get("ymd").toString().substring(8, 10));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		mv.setViewName("lshapp/date_selector1");//保存成功后跳转登陆界面
		return mv;
	}
}
