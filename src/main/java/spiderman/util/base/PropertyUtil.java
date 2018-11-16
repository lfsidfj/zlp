package spiderman.util.base;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import spiderman.exception.runtime.BaseRuntimeException;
import spiderman.util.reflect.ReflectUtil;

public class PropertyUtil {
	private static Map<String, Properties> propertiesMap = new HashMap<String, Properties>();
//	/**
//	 * 配置是否每次都重新加载properties文件，上线后一般要改为false
//	 */
//	private static boolean reload = true;
	
	public static final String configProperties = "config.properties";
	
	private PropertyUtil(){
		
	}
	
	public static boolean getBoolean(String key){
		return Boolean.parseBoolean(getConfig(key));
	}
	public static Integer getInteger(String key){
		return Integer.parseInt(getConfig(key));
	}
	
	public static String getConfig(String key){
		return getProperties(configProperties).getProperty(key);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static <T> T getConfig(String key,Class baseType){
		return (T) ReflectUtil.string2BaseID(baseType, getConfig(key));
	}
/*	public static <T> T getConstant(String key,Class<T> t){
		return (T) ReflectUtil.string2BaseID(t, getProperties("constant.properties").getProperty(key));
	}*/
	/*public static String getConstant(String key){
		return getProperties("constant.properties").getProperty(key);
	}*/
	@SuppressWarnings("rawtypes")
	public static void putAllConfig(Map map){
		putAllProperties(map,configProperties);
	}
	/**
	 * 保存设置
	 */
	public static void saveConfig(){
		saveProperties(configProperties);
	}
	/**
	 * 保存properties，若想要持久化则要调用saveProperties(String relativePath)
	 * @param map
	 * @param relativePath
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void putAllProperties(Map map,String relativePath){
		getProperties(relativePath).putAll(map);
	}
	/**
	 * 把缓存中的properties持久化
	 * @param relativePath
	 */
	public static void saveProperties(String relativePath){
		FileOutputStream out;
		try {
			out = new FileOutputStream(PathUtil.getClassesPath()+"properties/" +relativePath);
			getProperties(relativePath).store(out, null);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取config.properties中所有以prefix.为开头的键
	 * @param prefix
	 * @return
	 */
	public static List<String> getAllKey(String prefix){
		List<String> list = new ArrayList<String>();
		Properties properties = getProperties(configProperties);
		Set<Object> entrySet = properties.keySet();
		String temp;
		for (Object e:entrySet) {
			temp = (String) e;
			if (temp.startsWith(prefix)) {
				list.add(temp);
			}
		}
		return list;
	}
	
	/**
	 * 获取相对于classes目录的properties文件
	 * @param relativePath
	 * @return
	 */
	public static Properties getProperties(String relativePath){
		Properties temp = propertiesMap.get(relativePath);
		if (temp != null) {
			return temp;
		}
		Properties properties = new Properties();
		String classesPath = PathUtil.getClassesPath();
		String path = classesPath+"properties/" +relativePath;
		try {
			FileInputStream in = new FileInputStream(path);
			properties.load(in);
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new BaseRuntimeException("文件"+path+"不存在",e);
		} catch (IOException e) {
			e.printStackTrace();
		}
		/*if () {
			
		}*/
		propertiesMap.put(relativePath, properties);
		return properties;
	}
}
