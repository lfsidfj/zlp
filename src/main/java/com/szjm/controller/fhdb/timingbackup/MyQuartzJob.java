package com.szjm.controller.fhdb.timingbackup;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.web.context.WebApplicationContext;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.zlp.birthday.impl.BirthdayService;
import com.szjm.service.zlp.integrationrecord.impl.IntegrationRecordService;
import com.szjm.service.zlp.lshuser.impl.LshUserService;
import com.szjm.service.zlp.sysconfig.impl.SysConfigService;
import com.szjm.util.PageData;
import com.szjm.util.SpringUtil;
import com.szjm.util.Tools;
import com.szjm.util.lsh.BirthdayUtil;

/** quartz 定时任务调度 清理缓存
 * @author
 * @date 2018-06-04
 */
public class MyQuartzJob extends BaseController implements Job{

	@Override
	@SuppressWarnings("unchecked")
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// TODO Auto-generated method stub
		System.out.println("定时已启动........");
		auto_income("partner",100);
		auto_income("agent",100);
		updateUserBirthdayInfo(100);
		updateBirthdayInfo(100);
	}

	/**把定时备份任务状态改为关闭
	 * @param pd
	 * @param parameter
	 * @param webctx
	 */
	public void shutdownJob(JobExecutionContext context, PageData pd, Map<String,Object> parameter, WebApplicationContext webctx){
		try {
			context.getScheduler().shutdown();	//备份异常时关闭任务
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 礼豆自增
	 */
	private void auto_income(String role,int showCount){
		try {
			int currentPage=1;
			int totalPage=1;
			SysConfigService sysConfigService=(SysConfigService) SpringUtil.getObject("sysconfigService");
			LshUserService lshuserService=(LshUserService) SpringUtil.getObject("lshuserService");
			IntegrationRecordService integrationrecordService=(IntegrationRecordService) SpringUtil.getObject("integrationrecordService");
			PageData pd=new PageData();
			pd.put("CONFIG_ID", 1);
			//系统配置
			PageData config=sysConfigService.findById(pd);
			//合伙人每天礼豆自增率
			BigDecimal income_rate;
			if("partner".equals(role)){
				income_rate=(BigDecimal) config.get("PARTNER_INCOME_RATE");
			}else{
				income_rate=(BigDecimal) config.get("AGENT_INCOME_RATE");
			}
			for(;currentPage<=totalPage;currentPage++){
				Page page=new Page();
				pd.put("ROLE", role);
				page.setPd(pd);
				page.setCurrentPage(currentPage);
				page.setShowCount(showCount);
				List<PageData> userlist=lshuserService.list2(page);
				totalPage=page.getTotalPage();
				for(PageData temp:userlist){
					if(temp.get("INTEGRATION")!=null){
						Integer integration=Integer.valueOf(temp.get("INTEGRATION").toString());
						int income=(int) (integration*income_rate.doubleValue());
						if(income>0){
							temp.put("INTEGRATION", integration+income);
							lshuserService.edit(temp);
							//保存礼豆自增记录
							PageData ir=new PageData();
							ir.put("RECORD_TYPE", 0);
							ir.put("AMOUNT", income);
							ir.put("INCOME_REASON", 2);
							ir.put("USER_ID", temp.get("USER_ID"));
							ir.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建日期
							ir.put("DELETE_STATUS", 0);	//删除状态
							integrationrecordService.save(ir);
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 更新用户生日日期
	 */
	private void updateUserBirthdayInfo(int showCount){
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf.format(new Date());
			int currentPage=1;
			int totalPage=1;
			LshUserService lshuserService=(LshUserService) SpringUtil.getObject("lshuserService");
			PageData pd=new PageData();
			for(;currentPage<=totalPage;currentPage++){
				Page page=new Page();
				page.setPd(pd);
				page.setCurrentPage(currentPage);
				page.setShowCount(showCount);
				List<PageData> userlist=lshuserService.list2(page);
				totalPage=page.getTotalPage();
				for(PageData temp:userlist){
					try {
						//新历生日日期
						String solar_birthday=temp.get("SOLAR_BIRTHDAY").toString();
						//农历生日日期
						String lunar_brithday=temp.get("LUNAR_BRITHDAY").toString();
						//下次新历生日日期
						String nextSolarBirthday=BirthdayUtil.getNextSolarBirthday(solar_birthday);
						//下次农历生日日期
						String nextLunarBirthday=BirthdayUtil.getNextLunarBirthday(solar_birthday);
						//距离下次新历生日日期天数
						int next_sb_days=BirthdayUtil.daysBetween(today, nextSolarBirthday);
						//距离下次农历生日日期天数
						int next_lb_days=BirthdayUtil.daysBetween(today, nextLunarBirthday);
						temp.put("NEXT_SOLAR_BRITHDAY", nextSolarBirthday);
						temp.put("NEXT_LUNAR_BRITHDAY", nextLunarBirthday);
						temp.put("NEXT_SB_DAYS", next_sb_days);
						temp.put("NEXT_LB_DAYS", next_lb_days);
						lshuserService.edit(temp);
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 更新生日表的生日日期
	 */
	private void updateBirthdayInfo(int showCount){
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf.format(new Date());
			int currentPage=1;
			int totalPage=1;
			BirthdayService birthdayService=(BirthdayService) SpringUtil.getObject("birthdayService");
			PageData pd=new PageData();
			for(;currentPage<=totalPage;currentPage++){
				Page page=new Page();
				page.setPd(pd);
				page.setCurrentPage(currentPage);
				page.setShowCount(showCount);
				List<PageData> userlist=birthdayService.list2(page);
				totalPage=page.getTotalPage();
				for(PageData temp:userlist){
					try {
						//新历生日日期
						String solar_birthday=temp.get("SOLAR_BIRTHDAY").toString();
						//农历生日日期
						String lunar_brithday=temp.get("LUNAR_BRITHDAY").toString();
						//下次新历生日日期
						String nextSolarBirthday=BirthdayUtil.getNextSolarBirthday(solar_birthday);
						//下次农历生日日期
						String nextLunarBirthday=BirthdayUtil.getNextLunarBirthday(solar_birthday);
						//距离下次新历生日日期天数
						int next_sb_days=BirthdayUtil.daysBetween(today, nextSolarBirthday);
						//距离下次农历生日日期天数
						int next_lb_days=BirthdayUtil.daysBetween(today, nextLunarBirthday);
						temp.put("NEXT_SOLAR_BRITHDAY", nextSolarBirthday);
						temp.put("NEXT_LUNAR_BRITHDAY", nextLunarBirthday);
						temp.put("NEXT_SB_DAYS", next_sb_days);
						temp.put("NEXT_LB_DAYS", next_lb_days);
						birthdayService.edit(temp);
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
