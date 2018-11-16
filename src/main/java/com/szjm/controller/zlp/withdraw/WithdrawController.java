package com.szjm.controller.zlp.withdraw;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spiderman.alipay.util.AlipayInterfaceInvokeUtil;
import spiderman.wechat.domain.param.CompanyPaySend;
import spiderman.wechat.domain.result.CompanyPayResult;
import spiderman.wechat.util.AppWechatInterfaceInvokeUtil;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.util.Jurisdiction;
import com.szjm.util.Tools;
import com.szjm.service.zlp.finance.FinanceManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.withdraw.WithdrawManager;

/**
 * 说明：用户提现
 * 创建人：
 * 创建时间：2018-08-09
 */
@Controller
@RequestMapping(value="/withdraw")
public class WithdrawController extends BaseController {

	String menuUrl = "withdraw/list.do"; //菜单地址(权限用)
	@Resource(name="withdrawService")
	private WithdrawManager withdrawService;

	@Resource(name="lshuserService")
	private LshUserManager lshuserService;//用户

	@Resource(name = "financeService")
	private FinanceManager financeService;// 收入支出明细

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Withdraw");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("WITHDRAW_ID", this.get32UUID());	//主键
		withdrawService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Withdraw");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		withdrawService.delete(pd);
		out.write("success");
		out.close();
	}

	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/audit")
	@ResponseBody
	public String audit(HttpServletRequest request) throws Exception{
		CompanyPaySend companyPaySend = new CompanyPaySend();
		PageData pd = new PageData();
		pd = this.getPageData();
		String withdraw_id = pd.get("WITHDRAW_ID").toString();//订单号
		String status = pd.get("STATUS").toString();
		PageData findById = lshuserService.findById(pd);
		String alpay = findById.get("ALIPAY").toString();//支付宝账户
		String alipayName = findById.get("ALIPAYNAME").toString();//支付昵称
		Double money = Double.parseDouble(findById.get("MONEY").toString());//取出用户的当前金额
		if("1".equals(status)){
			String amount = pd.get("AMOUNT").toString();//提现金额
			if(money >= Double.parseDouble(amount)){ //如果用户余额小于等于提现金额
				String account_type = pd.get("ACCOUNT_TYPE").toString();//提现方式
				if ("alipay".equals(account_type)){
					boolean withdrawStatus = AlipayInterfaceInvokeUtil.AlipayFundTransToaccountTransfer(withdraw_id, "ALIPAY_LOGONID", alpay, amount, "礼尚汇", alipayName, "");
					if(withdrawStatus){
						Double newMoney = money-Double.parseDouble(amount);//提现后的金额
						pd.put("MONEY",newMoney);
						lshuserService.edit(pd);//修改用户金额
						pd.put("FINANCE_TYPE",1);
						pd.put("INCOME_REASON", 3);
						pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
						pd.put("DELETE_STSTUS", 0);
						financeService.save(pd);
						pd.remove("CREATE_DATE");
						withdrawService.edit(pd);
						return "1";
					}
				}else{
					//companyPaySend.setAmount(amount) （这里是微信提现）
					companyPaySend.setPartner_trade_no(withdraw_id);
					companyPaySend.setOpenid(pd.get("OPENID").toString());
					companyPaySend.setCheck_name("NO_CHECK");
					companyPaySend.setAmount((int)Double.parseDouble(amount)*100);
					companyPaySend.setDesc("微信提现");
					companyPaySend.setSpbill_create_ip(request.getRemoteAddr());
					CompanyPayResult result=AppWechatInterfaceInvokeUtil.companyPay(companyPaySend);
					if(result.isSuccess()){
						Double newMoney = money-Double.parseDouble(amount);//提现后的金额
						pd.put("MONEY",newMoney);
						lshuserService.edit(pd);//修改用户金额
						pd.put("FINANCE_TYPE",1);
						pd.put("INCOME_REASON", 3);
						pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建日期
						pd.put("DELETE_STSTUS", 0);
						financeService.save(pd);
						pd.remove("CREATE_DATE");
						withdrawService.edit(pd);
						return "1";
					}
					System.out.println((result.isSuccess()));
				}
			}else{
				return "0";
			}
		}else{
			withdrawService.edit(pd);//（这里是拒绝提现）
			return "2";
		}
		return null;
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Withdraw");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = withdrawService.list(page);	//列出Withdraw列表
		mv.setViewName("lsh/withdraw/withdraw_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}







	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
