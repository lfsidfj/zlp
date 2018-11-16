package spiderman.wechat.domain.result;

import java.util.List;
/**
 * 微信用户列表
 * @author root
 *
 */
public class WechatUserListResult extends BaseWechatResult {
	
	private List<WechatUserResult> user_info_list;

	public List<WechatUserResult> getUser_info_list() {
		return user_info_list;
	}

	public void setUser_info_list(List<WechatUserResult> user_info_list) {
		this.user_info_list = user_info_list;
	}
	
}
