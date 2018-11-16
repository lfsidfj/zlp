package spiderman.wechat.domain.result;

import java.util.List;

/**
 * 获取用户列表
 * @author root
 *
 */
public class UserListResult extends BaseWechatResult{
	private Integer total;//关注该公众账号的总用户数
	private Integer count;//拉取的OPENID个数，最大值为10000
	private Data data;//列表数据，OPENID的列表
	private String next_openid;//拉取列表的最后一个用户的OPENID
	
	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public String getNext_openid() {
		return next_openid;
	}

	public void setNext_openid(String next_openid) {
		this.next_openid = next_openid;
	}

	public class Data{
		private List<String> openid;

		public List<String> getOpenid() {
			return openid;
		}

		public void setOpenid(List<String> openid) {
			this.openid = openid;
		}
		
	}
}
