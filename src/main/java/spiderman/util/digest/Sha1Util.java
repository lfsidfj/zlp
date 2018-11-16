package spiderman.util.digest;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Sha1Util {
	public static String sha1Digest(String data){
		try {
			return Base64.encode(sha1Digest(data.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(String.format("不支持%s编码!!", "UTF-8"));
		}
	}
	
	public static byte[] sha1Digest(byte[] data){
		   MessageDigest sha1;
		try {
			sha1 = MessageDigest.getInstance("SHA-1");
			return sha1.digest(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new RuntimeException("获取SHA-1加密实例失败!!!");
		}        
	}
}
