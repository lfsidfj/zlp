package spiderman.util.digest;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import spiderman.util.base.StringUtil;


public class Md5Util {
	public static String Md5Digest(String data){
		return DigestUtil.byte2hex(Md5Digest(StringUtil.getSystemCharacterSetBytes(data)));
	}
	
	public static byte[] Md5Digest(byte[] data){
		   MessageDigest MD5;
		try {
			MD5 = MessageDigest.getInstance("MD5");
			return MD5.digest(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new RuntimeException("获取MD5加密实例失败!!!");
		}        
	}
}
