package spiderman.util.digest;

import spiderman.util.base.PropertyUtil;

public class DigestUtil {
	
	/**
	 * md5 32位小写加密后再aes加密
	 * @param message
	 * @return
	 */
	public static String Md532minAndAES(String message){
		return AESUtil.aesEncode(Md5Util.Md5Digest(message));
	}
	/**
	 * aes加密后再md5 32位小写加密
	 * @param message
	 * @return
	 */
	public static String AESAndMd532MinEncode(String message){
		return Md5Util.Md5Digest(AESUtil.aesEncode(message));
	}
	/**
	 * base64解密
	 * @param message
	 * @return
	 */
	public static String base64Decode(String message){
		try {
			return new String(Base64Util.decodeBase64(message),PropertyUtil.getConfig("characterSet"));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 字节数组转16进制string
	 * @param b
	 * @return
	 */
	public static String byte2hex(byte[] b) {
		String re_md5;
		int i;
		StringBuffer buf = new StringBuffer();
		for (int offset = 0; offset < b.length; offset++) {
		    i = b[offset];
		    if (i < 0)
		        i += 256;
		    if (i < 16)
		        buf.append("0");
		    buf.append(Integer.toHexString(i));
		}
		re_md5 = buf.toString();
		return re_md5;
	}
}
