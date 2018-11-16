package spiderman.util.digest;

import java.lang.reflect.Method;

import spiderman.util.base.StringUtil;


public class Base64Util {
    /*** 
     * encode by Base64 
     */  
    public static String encodeBase64(byte[]input){  
        Class<?> clazz;
		try {
			clazz = Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");
			Method mainMethod= clazz.getMethod("encode", byte[].class);  
			mainMethod.setAccessible(true);  
			Object retObj=mainMethod.invoke(null, new Object[]{input});  
			return (String)retObj;  
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("反射获取com.sun.org.apache.xerces.internal.impl.dv.util.Base64失败!!!");
		}  
    }  
    /*** 
     * decode by Base64 
     */  
    public static byte[] decodeBase64(String input){  
        Class<?> clazz;
		try {
			clazz = Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");
			Method mainMethod= clazz.getMethod("decode", String.class);  
			mainMethod.setAccessible(true);  
			Object retObj=mainMethod.invoke(null, input);  
			return (byte[])retObj;  
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("反射获取com.sun.org.apache.xerces.internal.impl.dv.util.Base64失败!!!");
		}  
    }
	/**
	 * base64加密
	 * @param message
	 * @return
	 */
	public static String base64EncodeByte(byte[] bytes){
		return encodeBase64(bytes);
	}
	/**
	 * base64加密
	 * @param message
	 * @return
	 */
	public static String base64Encode(String message){
		return encodeBase64(StringUtil.getSystemCharacterSetBytes(message));
	}
	/**
	 * base64加密
	 * @param message
	 * @return
	 */
	public static String base64Decode(String message){
		return StringUtil.getSystemCharacterSetString(base64DecodeByte(message));
	}
	/**
	 * base64解密
	 * @param message
	 * @return
	 */
	public static byte[] base64DecodeByte(String message){
		return decodeBase64(message);
	}  
}
