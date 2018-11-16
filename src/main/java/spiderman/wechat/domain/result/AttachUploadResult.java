package spiderman.wechat.domain.result;


public class AttachUploadResult extends BaseWechatResult {
	private String type;

	private String media_id;
	
	private String thumb_media_id;

	private Long created_at;

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return this.type;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}

	public String getMedia_id() {
		return this.media_id;
	}

	public Long getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Long created_at) {
		this.created_at = created_at;
	}

	public String getThumb_media_id() {
		return thumb_media_id;
	}

	public void setThumb_media_id(String thumb_media_id) {
		this.thumb_media_id = thumb_media_id;
	}
	
}
