package spiderman.wechat.domain.result;
/**
 * 上传永久素材返回结果
 * @author spiderman
 * 2017年5月9日上午10:09:55
 */
public class PermanentNewsUploadResult extends BaseWechatResult {
	
	private String media_id;

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	
}
