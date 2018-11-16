package spiderman.util.reflect;

import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import spiderman.util.base.BaseUtil;
import spiderman.util.base.PropertyUtil;
import spiderman.util.base.StringUtil;

public class ReflectUtil {
	@SuppressWarnings("unchecked")
	public static <T> T getInstanceFromProperties(String key,String propertiesFile){
		String className = PropertyUtil.getProperties(propertiesFile).getProperty(key);
		if (StringUtil.isStringEmpty(className)) {
			BaseUtil.getLogger().warn("找不到{}文件下配置的{}!",propertiesFile,key);
			return null;
		}
		try {
			return (T) Class.forName(className).newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			BaseUtil.getLogger().warn("实例化"+className+"失败",e);
		}
		return null;
	}
	
	public static void copySameField(Object copy,Object copyed){
		List<Field> fields = getAllFields(copyed);
		for (Field f:fields) {
			try {
				if (!"serialVersionUID".equals(f.getName())) {
					f.setAccessible(true);
					Object value = f.get(copyed);
					if (value == null) {
						continue;
					}
					try {
						Field declaredField = copy.getClass().getDeclaredField(f.getName());
						declaredField.setAccessible(true);
						declaredField.set(copy, value);
					} catch (NoSuchFieldException e) {
						e.printStackTrace();
					} catch (SecurityException e) {
						e.printStackTrace();
					}
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				BaseUtil.getLogger().debug("copyDomainSameField", e);
			} 
		}
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T copyObj(T copyed){
		Class<?> clazz = copyed.getClass();
		T domain;
		try {
			domain = (T) clazz.newInstance();
			for (Field f:getAllFields(copyed)) {
				f.setAccessible(true);
				try {
					Object value = f.get(copyed);
					f.set(domain, value);
				} catch (IllegalAccessException e) {
					BaseUtil.getLogger().debug("copyObj", e);
				} 
			}
			return domain;
		} catch (InstantiationException | IllegalAccessException e) {
			BaseUtil.getLogger().error("复制"+copyed.getClass().getName() + "失败!!",e);
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 把string转换成基本ID类型
	 * @param baseType
	 * @param str
	 * @return
	 */
	public static Serializable string2BaseID(Class<?> baseType,String str){
		if (baseType == String.class) {
			return str;
		}
		if (baseType == Integer.class || baseType == int.class) {
			return Integer.parseInt(str);
		}
		if (baseType == Long.class || baseType == long.class) {
			return Long.parseLong(str);
		}
		if (baseType == Double.class || baseType == double.class) {
			return Double.parseDouble(str);
		}
		if (baseType == Float.class || baseType == float.class) {
			return Float.parseFloat(str);
		}
		if (baseType == Short.class || baseType == short.class) {
			return Short.parseShort(str);
		}
		if (baseType == Boolean.class || baseType == boolean.class) {
			return Boolean.parseBoolean(str);
		}
		throw new RuntimeException(baseType.getName()+"不是基本ID类型");
	}
	public static boolean isClassBaseID(Class<?> clazz){
		return clazz == String.class || 
				clazz == Short.class ||
				clazz == Integer.class||
				clazz == Float.class ||
				clazz == Long.class ||
				clazz == Character.class ||
				clazz == Double.class;
	}
	public static boolean isClassBaseType(Class<?> clazz){
		return clazz == Byte.class || 
				clazz == Short.class ||
				clazz == Integer.class||
				clazz == Float.class ||
				clazz == Boolean.class ||
				clazz == Character.class ||
				clazz == Double.class ||
				clazz == Long.class;
	}
	
	public static boolean isObjBaseType(Object obj){
		return obj instanceof Byte || 
				obj instanceof Short ||
				obj instanceof Integer||
				obj instanceof Float ||
				obj instanceof Boolean ||
				obj instanceof Character ||
				obj instanceof Long ||
				obj instanceof Double;
	}
	
	
	public static boolean isFieldFinal(Field field){
		return (field.getModifiers()&Modifier.FINAL)==Modifier.FINAL;
	}
	public static Map<String, Object> field2Map(Object obj){
		Map<String, Object> map = new HashMap<String, Object>();
		return field2Map(0,obj, map);
	}
	public static Map<String, Object> field2Map(int classDdeep,Object obj,Map<String, Object> map){
		Class<?> tempClass = obj.getClass();
		for (int i = 0; i < classDdeep; i++) {
			tempClass = tempClass.getSuperclass();
		}
		if (tempClass == Object.class) {
			return map;
		}
		for (Field temp:tempClass.getDeclaredFields()) {
			temp.setAccessible(true);
			try {
				Object obj2 = temp.get(obj);
				if (!BaseUtil.isObjEmpty(obj2)) {
					map.put(temp.getName(), obj2);
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		return field2Map(++classDdeep, obj, map);
	}
	
	
	public static void setValue(String fieldName,Object obj,Object value){
		try {
			Field declaredField = getDeclaredField(obj, fieldName);
			if (value instanceof String) {
				value = ReflectUtil.string2BaseID(declaredField.getType(), (String) value);
			}
			declaredField.setAccessible(true);
			declaredField.set(obj, value);
			return;
		} catch (SecurityException | IllegalArgumentException | IllegalAccessException e) {
			BaseUtil.getLogger().warn("把"+value+"设置到"+obj.getClass().getName()+"的"+fieldName+"字段失败", e);
		}
	}
	
	public static Object getValue(String fieldName,Object obj){
		try {
			Field declaredField = getDeclaredField(obj, fieldName);
			declaredField.setAccessible(true);
			return declaredField.get(obj);
		} catch (SecurityException | IllegalArgumentException | IllegalAccessException e) {
			BaseUtil.getLogger().warn("获取"+obj.getClass().getName()+"的"+fieldName+"字段失败", e);
		}
		return null;
	}
	
	public static Object newInstance(String className){
		try {
			return Class.forName(className).newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			BaseUtil.getLogger().error(className+"实例化失败！！",e);
			throw new RuntimeException(className+"实例化失败！！",e);
		} 
	}
	
	public static <T extends Annotation> T getAnnotation(Class<T> annotationClass,
			Class<? extends Object> objClass,Field field){
		T annotation = field.getAnnotation(annotationClass);
		if (annotation != null) {
			return annotation;
		}
		
		String name = field.getName();
		String fieldGetterName = StringUtil.getFieldGetterName(name);
		try {
			Method declaredMethod = objClass.getDeclaredMethod(fieldGetterName);
			T annotation2 = declaredMethod.getAnnotation(annotationClass);
			if (annotation2 != null) {
				return annotation2;
			}
		} catch (NoSuchMethodException | SecurityException e) {
		} 
		
		String fieldIsMethodName = StringUtil.getFieldIsMethodName(name);
		try {
			Method declaredMethod3 = objClass.getDeclaredMethod(fieldIsMethodName);
			T annotation3 = declaredMethod3.getAnnotation(annotationClass);
			if (annotation3 != null) {
				return annotation3;
			}
		} catch (NoSuchMethodException | SecurityException e) {
		}
		return null;
		
	}
	public static List<Annotation> getAnnotations(Class<? extends Object> objClass,Field field){
		List<Annotation> list = new ArrayList<>();
		Collections.addAll(list, field.getDeclaredAnnotations());
		String name = field.getName();
		String fieldGetterName = StringUtil.getFieldGetterName(name);
		try {
			Method declaredMethod = objClass.getDeclaredMethod(fieldGetterName);
			Collections.addAll(list, declaredMethod.getAnnotations());
		} catch (NoSuchMethodException | SecurityException e) {
		}
		
		String fieldIsMethodName = StringUtil.getFieldIsMethodName(name);
		try {
			Method declaredMethod3 = objClass.getDeclaredMethod(fieldIsMethodName);
			Collections.addAll(list, declaredMethod3.getAnnotations());
		} catch (NoSuchMethodException | SecurityException e) {
		}
		return list;
		
	}
	
	
	public static Class<?> getGenericType(Field f) {
		try {
	        Type mapMainType = f.getGenericType();
	        if (mapMainType instanceof ParameterizedType) {   
	            ParameterizedType parameterizedType = (ParameterizedType)mapMainType;   
	            // 获取泛型类型的泛型参数   
	            Type[] types = parameterizedType.getActualTypeArguments();   
	            return (Class<?>) types[0];
	        } else {   
	          throw new RuntimeException(String.format("在%s字段找不到泛型信息！！", f.getName())); 
	        }   
		}  catch (SecurityException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static List<Field> getNotFinalFiles(Object object){
		List<Field> fieldList = getAllFields(object);
		Iterator<Field> iterator = fieldList.iterator();
		while (iterator.hasNext()) {
			if (isFieldFinal(iterator.next())) {
				iterator.remove();
			}
		}
		return fieldList;
	}
	public static List<Field> getAllFields(Object object){
		List<Field> fieldList = new ArrayList<>();
		Class<? extends Object> class1 = object.getClass();
		if (object instanceof Class) {
			class1 = (Class<? extends Object>) object;
		}
		while (class1 != Object.class) {
			Collections.addAll(fieldList, class1.getDeclaredFields());
			class1 = class1.getSuperclass();
		}
		return fieldList;
	}
	public static Field getField(Object object,String fieldName){
		Class<? extends Object> class1 = object.getClass();
		while (class1 != Object.class) {
			try {
				return class1.getField(fieldName);
			} catch (NoSuchFieldException e) {
				class1 = class1.getSuperclass();
				if (class1.equals(Object.class)) {
					BaseUtil.getLogger().warn(object.getClass().getName()+"中找不到public权限的"+fieldName+"字段", e);
				}
			} catch (SecurityException e) {
				BaseUtil.getLogger().warn("获取"+object.getClass().getName()+"中的"+fieldName+"字段失败",e);
			}
		}
		return null;
	}
	
	public static Field getDeclaredField(Object object,String fieldName){
		Class<? extends Object> class1 = object.getClass();
		while (class1 != Object.class) {
			try {
				return class1.getDeclaredField(fieldName);
			} catch (NoSuchFieldException e) {
				class1 = class1.getSuperclass();
				if (class1.equals(Object.class)) {
					BaseUtil.getLogger().warn(object.getClass().getName()+"中找不到"+fieldName+"字段", e);
				}
			} catch (SecurityException e) {
				BaseUtil.getLogger().warn("获取"+object.getClass().getName()+"中的"+fieldName+"字段失败",e);
			}
		}
		return null;
	}
	
	public static Method getDeclaredMethod(Class<?> clazz,String name, Class<?>... parameterTypes){
		while (clazz != Object.class) {
			try {
				return clazz.getDeclaredMethod(name, parameterTypes);
			} catch (NoSuchMethodException | SecurityException e) {
				clazz = clazz.getSuperclass();
			}
		}
		return null;
	}
	
	
	/**
	 * 判断该类型是否是数据库基本数据类型
	 * @param obj
	 * @return
	 */
	public static boolean isObjBaseData(Object obj){
		return isClassBaseData(obj.getClass());
	}
	/**
	 * 判断该类型是否是数据库基本数据类型
	 * @param obj
	 * @return
	 */
	public static boolean isClassBaseData(Class<?> clazz){
		return isClassBaseType(clazz) || clazz == String.class || Date.class.isAssignableFrom(clazz);
	}
}
