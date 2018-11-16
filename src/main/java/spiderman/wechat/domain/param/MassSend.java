package spiderman.wechat.domain.param;

import java.util.List;

/**
 * 群发
 * @author root
 *
 */
public class MassSend extends BaseWechatSend {
	public class Filter{
		private boolean is_to_all;
		private String tag_id;
		public boolean isIs_to_all() {
			return is_to_all;
		}
		public void setIs_to_all(boolean is_to_all) {
			this.is_to_all = is_to_all;
		}
		public String getTag_id() {
			return tag_id;
		}
		public void setTag_id(String tag_id) {
			this.tag_id = tag_id;
		}
		
	}
	public class Mpnews{
		private String media_id;

		public String getMedia_id() {
			return media_id;
		}

		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
		
	}
	public class Text{
		private String content;

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}
		
	}
	public class Voice{
		private String media_id;

		public String getMedia_id() {
			return media_id;
		}

		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
	}
	public class Image{
		private String media_id;

		public String getMedia_id() {
			return media_id;
		}

		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
	}
	public class Mpvideo{
		private String media_id;

		public String getMedia_id() {
			return media_id;
		}

		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
	}
	private List<String> touser;
	private String title;//标题
	private String description;//描述
	private String msgtype;//类型
	private String clientmsgid;//开发者侧群发msgid，长度限制64字节，如不填，则后台默认以群发范围和群发内容的摘要值做为clientmsgid
	private int send_ignore_reprint;//1为继续群发（转载），0为停止群发。该参数默认为0。
	private Filter filter;
	private Image image;
	private Mpnews mpnews;
	private Text text;
	private Voice voice;
	private Mpvideo mpvideo;
	public List<String> getTouser() {
		return touser;
	}
	public void setTouser(List<String> touser) {
		this.touser = touser;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMsgtype() {
		return msgtype;
	}
	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	public String getClientmsgid() {
		return clientmsgid;
	}
	public void setClientmsgid(String clientmsgid) {
		this.clientmsgid = clientmsgid;
	}
	public int getSend_ignore_reprint() {
		return send_ignore_reprint;
	}
	public void setSend_ignore_reprint(int send_ignore_reprint) {
		this.send_ignore_reprint = send_ignore_reprint;
	}
	public Filter getFilter() {
		return filter;
	}
	public void setFilter(Filter filter) {
		this.filter = filter;
	}
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		msgtype="image";
		this.image = image;
	}
	public Mpnews getMpnews() {
		return mpnews;
	}
	public void setMpnews(Mpnews mpnews) {
		msgtype="mpnews";
		this.mpnews = mpnews;
	}
	public Text getText() {
		return text;
	}
	public void setText(Text text) {
		msgtype="text";
		this.text = text;
	}
	public Voice getVoice() {
		return voice;
	}
	public void setVoice(Voice voice) {
		msgtype="voice";
		this.voice = voice;
	}
	public Mpvideo getMpvideo() {
		return mpvideo;
	}
	public void setMpvideo(Mpvideo mpvideo) {
		msgtype="mpvideo";
		this.mpvideo = mpvideo;
	}
	
}
