package spiderman.wechat.util;

import spiderman.util.digest.Sha1Util;
import spiderman.util.task.DataCacheUtil;
import spiderman.wechat.domain.param.XSessionKeyResult;

/**
 * 小程序sessin工具
 * @author HP
 *
 */
public class XSessionUtil {
	/**
	 * 保存用户数据
	 * @param code
	 * @return
	 */
	public static String saveUserData(String code){
		XSessionKeyResult session=XWechatInterfaceInvokeUtil.getSessionKey(code);
		String token=Sha1Util.sha1Digest(session.getSession_key());
		DataCacheUtil.setData(token, "sessionKey", session);
		return token;
	}
	/**
	 * 获取用户数据
	 * @param token
	 * @return
	 */
	public static XSessionKeyResult getUserData(String token){
		Object session=DataCacheUtil.getData(token, "sessionKey");
		return session!=null?(XSessionKeyResult) session:null;
	}
}
