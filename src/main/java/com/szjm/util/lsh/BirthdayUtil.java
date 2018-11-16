package com.szjm.util.lsh;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.szjm.util.FxLunar;

public class BirthdayUtil {
	/**
	 * 通过新历生日获取农历生日
	 * @param solarBrithday
	 * @return
	 */
	public static String getLunarBirthday(String solarBrithday){
		FxLunar lunar = new FxLunar();
		return lunar.solarTolunar(solarBrithday);
	}
	/**
	 * 获取新历下次生日的新历日期
	 * @param solarBirthday
	 * @return
	 * @throws Exception
	 */
	public static String getNextSolarBirthday(String solarBirthday) throws Exception{
		Calendar calendar=Calendar.getInstance();
		//下次生日年份
		int nextYear=calendar.get(Calendar.YEAR);
		//今年以来第一个有效的生日
		String nextBirthday=nextYear+solarBirthday.substring(4);
		if(!isvalid(nextBirthday)){
			nextBirthday=next29year(nextYear)+solarBirthday.substring(4);
		}
		if(compareToday(nextBirthday)<0){//如果今年的生日已经过去了
			nextBirthday=(nextYear+1)+solarBirthday.substring(4);
			if(!isvalid(nextBirthday)){
				nextBirthday=next29year(nextYear+1)+solarBirthday.substring(4);
			}
		}
		return nextBirthday;
	}
	/**
	 * 获取农历下次生日的新历日期
	 * @param lunarBirthday
	 * @return
	 * @throws Exception
	 */
	public static String getNextLunarBirthday(String solarBirthday) throws Exception{
		solarBirthday=solarBirthday.replaceAll("-", "");
		String lunarBirthday=CalendarUtil.solarToLunar(solarBirthday).replaceAll("年", "")
				.replaceAll("月", "")
				.replaceAll("日", "")
				.replaceAll("闰", "");
		lunarBirthday=lunarBirthday.replaceAll("-", "");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		String today=CalendarUtil.solarToLunar(sdf.format(new Date()));
		//今年以来第一个有效的生日
		String nextBirthday=getValidLunar(Integer.valueOf(today.substring(0, 4)), lunarBirthday);
		if(lunarToSolar(nextBirthday).compareTo(sdf.format(new Date()))<0){
			nextBirthday=getValidLunar(Integer.valueOf(today.substring(0, 4))+1, lunarBirthday);
		}
		return lunarToSolar(nextBirthday).substring(0, 4)+"-"+
				lunarToSolar(nextBirthday).substring(4, 6)+"-"+
				lunarToSolar(nextBirthday).substring(6, 8);
	}
	/**
	 * 判断农历是否存在
	 * @param lunarBirthday
	 * @return
	 */
	public static boolean isLunarValid(String lunarBirthday){
		String year=lunarBirthday.substring(0, 4);
		String month=lunarBirthday.substring(4, 6);
		String date=lunarBirthday.substring(6);
		try {
			/*CalendarUtil.checkLunarDate(Integer.valueOf(year),
					Integer.valueOf(month),
					Integer.valueOf(date),
					false);*/
			CalendarUtil.lunarToSolar(lunarBirthday, false);
		} catch (Exception e) {
			// TODO: handle exception
			try {/*
				CalendarUtil.checkLunarDate(Integer.valueOf(year),
						Integer.valueOf(month),
						Integer.valueOf(date),
						true);*/
				CalendarUtil.lunarToSolar(lunarBirthday, false);
			} catch (Exception e1) {
				// TODO: handle exception
				return false;
			}
		}
		return true;
	}
	/**
	 * 农历转新历
	 * @param lunarDate
	 * @return
	 * @throws Exception
	 */
	public static String lunarToSolar(String lunarDate) throws Exception{
		String ymd1=null;
		String ymd2=null;
		try {
			ymd1=CalendarUtil.lunarToSolar(lunarDate, false);
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			ymd2=CalendarUtil.lunarToSolar(lunarDate, true);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(ymd1!=null&&ymd2!=null){
			if(ymd2.compareTo(ymd1)>0){
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
				String date=sdf.format(new Date());
				if(date.compareTo(ymd1)>0){
					return ymd2;
				}else{
					return ymd1;
				}
			}else if(ymd1.compareTo(ymd2)>0){
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
				String date=sdf.format(new Date());
				if(date.compareTo(ymd2)>0){
					return ymd1;
				}else{
					return ymd2;
				}
			}else{
				return ymd1;
			}
		}else if(ymd1!=null){
			return ymd1;
		}else if(ymd2!=null){
			return ymd2;
		}else{
			return null;
		}
	}
	public static String getValidLunar(int year,String birthday) throws Exception{
		String ymd=null;
		for(int i=0;i<100;i++){
			ymd=year+birthday.substring(4);
			if(isLunarValid(ymd)){
				return ymd;
			}
			year++;
		}
		return null;
	}
	/**
	 * 日期相差天数串的日期格式的计算
	 * @param smdate
	 * @param bdate
	 * @return
	 * @throws ParseException
	 */
    public static int daysBetween(String smdate,String bdate) throws ParseException{
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setTime(sdf.parse(smdate));
        long time1 = cal.getTimeInMillis();
        cal.setTime(sdf.parse(bdate));
        long time2 = cal.getTimeInMillis();
        long between_days=(time2-time1)/(1000*3600*24);

       return Integer.parseInt(String.valueOf(between_days));
    }
	/**
	 * 日期是否有效
	 * @param date
	 * @return
	 */
	private static boolean isvalid(String date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
	    	  // 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
	          format.setLenient(false);
	          format.parse(date);
	          return true;
	       } catch (ParseException e) {
	          // e.printStackTrace();
	    	  // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
		      return false;
	       }
	}
	/**
	 * 与今天比较大小
	 * @param date
	 * @return
	 */
	private static int compareToday(String date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return date.compareTo(format.format(new Date()));
	}
    /**
     * 这次或下次二月份为29天的年份
     * @param year
     * @return
     * @throws Exception
     */
    public static int next29year(int year) throws Exception{
    	for(int i=0;i<10;i++){
    		if((year+i)%4==0){
    			return year+i;
    		}
    	}
    	return 0;
    }
}
