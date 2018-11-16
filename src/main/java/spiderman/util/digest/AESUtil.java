package spiderman.util.digest;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import spiderman.exception.runtime.system.FrameworkException;
import spiderman.util.base.BaseUtil;
import spiderman.util.base.PropertyUtil;
import spiderman.util.base.StringUtil;

public class AESUtil {
	/**
	 * 加密
	 * 
	 * @param content
	 *            需要加密的内容
	 * @param password
	 *            加密密码
	 * @return
	 */
	public static byte[] encrypt(byte[] byteContent) {
		return encrypt(byteContent, getSystemKey());
	}

	/**
	 * 加密
	 * 
	 * @param content
	 *            需要加密的内容
	 * @param password
	 *            加密密码
	 * @return
	 */
	public static byte[] encrypt(byte[] byteContent, String key) {
		try {
			byte[] enCodeFormat = getSecretKey(key).getEncoded();
			SecretKeySpec kee = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");// 创建密码器
			cipher.init(Cipher.ENCRYPT_MODE, kee);// 初始化
			return cipher.doFinal(byteContent);
		} catch (NoSuchAlgorithmException
				| NoSuchPaddingException 
				| BadPaddingException
				| IllegalBlockSizeException
				| InvalidKeyException e) {
			e.printStackTrace();
			BaseUtil.getLogger().error("aes加密失败!");
		} 
		return null;
	}

	/**
	 * 解密
	 * 
	 * @param content
	 *            待解密内容
	 * @param password
	 *            解密密钥
	 * @return
	 */
	public static byte[] decrypt(byte[] content) {
		return decrypt(content, getSystemKey());
	}

	/**
	 * 解密
	 * 
	 * @param content
	 *            待解密内容
	 * @param password
	 *            解密密钥
	 * @return
	 */
	public static byte[] decrypt(byte[] content, String key) {
		try {
			byte[] enCodeFormat = getSecretKey(key).getEncoded();
			SecretKeySpec kee = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");// 创建密码器
			cipher.init(Cipher.DECRYPT_MODE, kee);// 初始化
			return cipher.doFinal(content);
		}  catch (NoSuchAlgorithmException
				| NoSuchPaddingException 
				| BadPaddingException
				| IllegalBlockSizeException
				| InvalidKeyException e) {
			e.printStackTrace();
			BaseUtil.getLogger().error("aes解密失败!");
		} 
		return null;
	}

	private static String getSystemKey() {
		return PropertyUtil.getConfig("aesKey");
	}

	private static SecretKey getSecretKey(String key) {
		KeyGenerator kgen;
		try {
			kgen = KeyGenerator.getInstance("AES");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new FrameworkException(e);
		}
		kgen.init(128,
				new SecureRandom(StringUtil.getSystemCharacterSetBytes(key)));
		return kgen.generateKey();
	}

	/**
	 * aes解密
	 * 
	 * @param message
	 * @return
	 */
	public static byte[] aesDecodeByte(String message) {
		return decrypt(Base64Util.base64DecodeByte(message));
	}

	/**
	 * aes加密
	 * 
	 * @param message
	 * @return
	 */
	public static byte[] aesEncode1(String message,String key) {
		try {
			return encrypt(message.getBytes(PropertyUtil
					.getConfig("characterSet")),key);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * aes加密
	 * 
	 * @param message
	 * @return
	 */
	public static byte[] aesEncode1(String message) {
		try {
			return encrypt(message.getBytes(PropertyUtil
					.getConfig("characterSet")),getSystemKey());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * aes加密
	 * 
	 * @param message
	 * @return
	 */
	public static byte[] aesEncodeByte1(byte[] message) {
		return encrypt(message);
	}

	/**
	 * aes加密
	 * 
	 * @param message
	 * @return
	 */
	public static String aesEncodeByte(byte[] message) {
		return Base64Util.base64EncodeByte(aesEncodeByte1(message));
	}

	/**
	 * aes解密
	 * 
	 * @param message
	 * @return
	 */
	public static String aesDecode(String message) {
		return StringUtil.getSystemCharacterSetString(decrypt(Base64Util
				.base64DecodeByte(message)));
	}

	/**
	 * aes加密
	 * 
	 * @param message
	 * @return
	 */
	public static String aesEncode(String message) {
		return Base64Util.base64EncodeByte(aesEncode1(message));
	}

	/**
	 * aes加密
	 * 
	 * @param message
	 * @return
	 */
	public static String aesEncode(String message, String key) {
		return Base64Util.base64EncodeByte(aesEncode1(message,key));
	}

}