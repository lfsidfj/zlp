package spiderman.util.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
/**
 * 基础工具类，拥有许多基础方法
 * @author 战马
 *
 */
public class BaseUtil {
	private static final Gson gson = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	private static final Logger log = LoggerFactory.getLogger(BaseUtil.class);
	/**
	 * 判断对象是否为空，集合为空时也会返回true
	 * @param obj
	 * @return 是否为空
	 */
	public static boolean isObjEmpty(Object obj){
		if (obj == null) {
			return true;
		}
		if (CollectionsUtil.isObjCollections(obj)) {
			return CollectionsUtil.isCollectionsEmpty(obj);
		}
		if (obj instanceof String) {
			return StringUtil.isStringEmpty((String)obj);
		}
		return null == obj;
	}
	/**
	 * 打印 prefix + "------>" + String.valueOf(o)
	 * @param o
	 * @param prefix 前缀
	 * @return prefix + "------>" + String.valueOf(o)
	 */
	public static String out(String prefix,Object o){
		String x = prefix + "------>" + o;
		System.out.println(x);
		return x;
	}
	/**
	 * 所有方法共用一个gson
	 * @return
	 */
	public static String getJson(Object obj){
		return gson.toJson(obj);
	}
	public static <T> T parseJson(String json,Class<T> t){
		return gson.fromJson(json, t);
	}
	
	/**
	 * 打印String.valueOf(o)
	 * @param o
	 */
	public static String out(Object o){
		return out("",o);
	}
	/**
	 * 打印 "------------------------"+o+"------------------------"
	 * @param o
	 */
	public static void outLine(Object o){
		String line = "------------------------"+o+"------------------------";
		out(line);
	}
	public static void outJson(Object o){
		out(getJson(o));
	}
	public static void outJson(Object o,String prefix){
		out(getJson(o),prefix);
	}
	public static void outJsonIncludeNullField(Object o){
		out(new GsonBuilder().serializeNulls().create().toJson(o));
	}
	
	public static Logger getLogger(){
		return log;
	}
	
	/**
	 * 比较相同实体类对象字段是否相等，必须是相同的实体类
	 * @param obj
	 * @param obj2
	 * @return
	 */
	public static boolean objectEquals(Object obj,Object obj2){
		if (obj == null) {
			return obj2 == null;
		}
		if (obj2 == null) {
			return false;
		}
		return obj.equals(obj2);
	}
	
	
}
