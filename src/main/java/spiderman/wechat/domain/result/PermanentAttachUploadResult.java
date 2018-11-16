package spiderman.wechat.domain.result;
/**
 * 新增其他类型永久素材返回结果
 * @author spiderman
 * 2017年5月9日上午10:20:37
 */
public class PermanentAttachUploadResult extends BaseWechatResult{
	
	private String media_id;
	private String url;
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
