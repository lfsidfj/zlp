package com.szjm.controller.fhdb.timingbackup;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;

import com.szjm.util.QuartzManager;
/**
 * spring启器启动后立即执行
 * @author HP
 *
 */
public class Starting implements InitializingBean{

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		//项目启动后执行
        try {
            final Map<String,Object> parameter=new HashMap<String,Object>();

            QuartzManager.removeJob("myjob", "myjob", "myjob", "myjob");
            QuartzManager.addJob("myjob","myjob", "myjob", "myjob", MyQuartzJob.class, "0 0 0 * * ?" ,parameter);

            QuartzManager.removeJob("myjob1", "myjob1", "myjob1", "myjob1");
           // QuartzManager.addJob("myjob1","myjob1", "myjob1", "myjob1", BirthdayRemindQuartzJob.class, "0 0 8 * * ?" ,parameter);
        } catch (Exception e) {
			// TODO: handle exception
		}
	}
}
