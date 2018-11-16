package spiderman.wechat.domain.receive;
/**
 * 视频消息
 * @author spiderman
 * 2017年5月7日下午11:33:57
 */
public class VideoMessage extends BaseMessage {
	
	private String ThumbMediaId;//视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。

	public String getThumbMediaId() {
		return ThumbMediaId;
	}

	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}
	
}
