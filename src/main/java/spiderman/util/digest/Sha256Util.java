package spiderman.util.digest;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import spiderman.util.base.StringUtil;

/**
 * 
 * @author 战马
 *
 */
public class Sha256Util{
	public static String sha256Digest(String data){
		return DigestUtil.byte2hex(sha256Digest(StringUtil.getSystemCharacterSetBytes(data)));
	}
	
	public static byte[] sha256Digest(byte[] data){
		   MessageDigest sha256;
		try {
			sha256 = MessageDigest.getInstance("SHA-256");
			return sha256.digest(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new RuntimeException("获取SHA-256加密实例失败!!!");
		}        
	}
}
