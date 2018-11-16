package com.szjm.controller.zlpapp;

import com.szjm.controller.base.BaseController;
import com.szjm.service.zlp.finance.FinanceManager;
import com.szjm.service.zlp.integrationrecord.IntegrationRecordManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.order.OrderManager;
import com.szjm.service.zlp.smsrecord.SmsRecordManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 说明：用户管理
 * 创建人：
 * 创建时间：2018-07-11
 */
@Controller
@RequestMapping(value="/lshapp/user")
public class AppUserController extends BaseController {

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
	/**
	 * 用户登陆
	 */
	@RequestMapping(value="/user_login")
	@ResponseBody
	public String user_login(HttpServletRequest request) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData userP=lshuserService.findById(pd);
		String result="";
		if(userP==null){
			result="success";
		}else{
			result="false";
		}
		return result;
	}
	/**
	 * 新用户去注册页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/go_user_regisrer")
	public ModelAndView go_user_regisrer()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("lshapp/user_register");
		return mv;
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
		if(userP==null){
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
		pd.put("PHONE_NUMBER", PHONE_NUMBER);
		PageData userP=lshuserService.findById(pd);
		String result="";
		if(userP==null){
			result="success";
		}else{
			result="false";
		}
		return result;
	}
	/**
	 * 发短信
	 */
	@RequestMapping(value="/sendMsg")
	@ResponseBody
	public String sendMsg(HttpServletRequest request,String PHONE_NUMBER) throws Exception{
		PageData pd = new PageData();
		pd.put("PHONE_NUMBER", PHONE_NUMBER);
		PageData userP=lshuserService.findById(pd);
		String result="";
		/*if(userP==null){
			Integer code  = (int)((Math.random()*9+1)*100000);
			PageData pdCode = new PageData();
			//SendSmsResponse response=SmsUtil.sendSms(PHONE_NUMBER,code+"");
			if(response.getCode() != null && response.getCode().equals("OK")){
					pdCode.put("OPENID", user.getOpenid());
					PageData codeP=codeService.findById(pdCode);
					pdCode.put("CODE", code);
					pdCode.put("CREATE_DATE",Tools.date2Str(new Date()));
					if(codeP!=null){
						codeService.edit(pdCode);
					}else{
						codeService.save(pdCode);
					}
				result="success";
			}else{
				result="false";
			}
		}else{//手机号已经存在
			result="false1";
		}*/
		result="success";
		return result;
	}
	//验证码判断
	@RequestMapping(value="/sendJudge")
	@ResponseBody
	public String sendJudge(HttpServletRequest request,String PHONE_NUMBER,String code ) throws Exception{
		PageData pd = new PageData();
		//pd.put("OPENID", user.getOpenid());
		//PageData codePd=codeService.findById(pd);
		String result="";
		/*String add_time=codePd.get("CREATE_DATE").toString();//验证码添加时间
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowDate = new Date();//当前时间
		Date afterDate = new Date(nowDate .getTime() - 300000);//5分钟有效期
		String nowNew=sf.format(afterDate);
		Integer i=add_time.compareTo(nowNew);
		if(i>0){
			if(code.equals(codePd.get("CODE").toString())){
				result="success";
			}else{
				result="error";
			}
		}else{
			result="error1";
		}*/
		result="success";
		return result;
	}
		/**
		 * 保存新用户注册信息
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/save")
		public ModelAndView save()throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			pd.remove("USER_ID");	//主键
			pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
			pd.put("CREATE_USER", Jurisdiction.getUsername());	//创建人
			pd.put("DELETE_STATUS", 0);	//删除状态
			if(pd.get("INVITE_CODE")!=null){
				
			}
			lshuserService.save(pd);
			mv.setViewName("lshapp/user_register");
			return mv;
		}
}
