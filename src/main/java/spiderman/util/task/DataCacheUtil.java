package spiderman.util.task;

import java.util.HashMap;
import java.util.Map;

public class DataCacheUtil {
	private static Map<String, Object> dataMap = new HashMap<String, Object>();
	public static Object getData(Object key,String prefix){
		String key2 = key.toString()+"_steed_dataCache_"+prefix;
		return dataMap.get(key2);
	}
	
	public static void setData(Object key,String prefix,Object value){
		String key2 = key.toString()+"_steed_dataCache_"+prefix;
		dataMap.put(key2, value);
	}
}
