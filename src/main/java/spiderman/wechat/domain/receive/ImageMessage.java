package spiderman.wechat.domain.receive;
/**
 * 图片消息
 * @author spiderman
 * 2017年5月7日下午11:32:51
 */
public class ImageMessage extends BaseMessage {
	
	private String PicUrl;//图片链接（由系统生成）

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	
}
