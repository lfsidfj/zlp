package spiderman.wechat.domain.param;

import java.util.List;
/**
 * 批量获取用户基本信息
 * @author root
 *
 */
public class GetBatchUserInfoSend extends BaseWechatSend {
	
	private List<User> user_list;
	
	public List<User> getUser_list() {
		return user_list;
	}

	public void setUser_list(List<User> user_list) {
		this.user_list = user_list;
	}

	public class User{
		private String openid;//用户的标识，对当前公众号唯一

		public String getOpenid() {
			return openid;
		}

		public void setOpenid(String openid) {
			this.openid = openid;
		}
		
	}
}
