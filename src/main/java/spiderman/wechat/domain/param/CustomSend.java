package spiderman.wechat.domain.param;

import java.util.List;

public class CustomSend {
	private String touser;
	private String msgtype;
	private Text text;
	private Image image;
	private Voice voice;
	private Video video;
	private Music music;
	private News news;
	private Mpnews mpnews;
	
	/********文本消息***********/
	public class Text{
		String content;

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}
		
	}
	/**
	 * 图片消息
	 * @author spiderman
	 * 2017年5月14日上午11:15:33
	 */
	public class Image{
		String media_id;

		public String getMedia_id() {
			return media_id;
		}

		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
		
	}
	/**
	 * 语音消息
	 * @author spiderman
	 * 2017年5月14日上午11:16:10
	 */
	public class Voice{
		String media_id;

		public String getMedia_id() {
			return media_id;
		}

		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
		
	}
	/**
	 * 视频消息
	 * @author spiderman
	 * 2017年5月14日上午11:17:14
	 */
	public class Video{
		String media_id;
		String thumb_media_id;
		String title;
		String description;
		public String getMedia_id() {
			return media_id;
		}
		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
		public String getThumb_media_id() {
			return thumb_media_id;
		}
		public void setThumb_media_id(String thumb_media_id) {
			this.thumb_media_id = thumb_media_id;
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
		
	}
	/**
	 * 音乐消息
	 * @author spiderman
	 * 2017年5月14日上午11:19:01
	 */
	public class Music{
		String title;
		String description;
		String musicurl;
		String hqmusicurl;
		String thumb_media_id;
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
		public String getMusicurl() {
			return musicurl;
		}
		public void setMusicurl(String musicurl) {
			this.musicurl = musicurl;
		}
		public String getHqmusicurl() {
			return hqmusicurl;
		}
		public void setHqmusicurl(String hqmusicurl) {
			this.hqmusicurl = hqmusicurl;
		}
		public String getThumb_media_id() {
			return thumb_media_id;
		}
		public void setThumb_media_id(String thumb_media_id) {
			this.thumb_media_id = thumb_media_id;
		}
		
	}
	public class Article{
		String title;
		String description;
		String url;
		String picurl;
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
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getPicurl() {
			return picurl;
		}
		public void setPicurl(String picurl) {
			this.picurl = picurl;
		}
		
	}
	/**
	 * 图文消息 点击跳转到外链
	 * @author spiderman
	 * 2017年5月14日上午11:29:43
	 */
	public class News{
		List<Article> articles;

		public List<Article> getArticles() {
			return articles;
		}

		public void setArticles(List<Article> articles) {
			this.articles = articles;
		}
		
	}
	/**
	 * 图文消息 点击跳转到图文消息页面
	 * @author spiderman
	 * 2017年5月14日上午11:29:24
	 */
	public class Mpnews{
		String media_id;

		public String getMedia_id() {
			return media_id;
		}

		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
		
	}
	public String getTouser() {
		return touser;
	}

	public void setTouser(String touser) {
		this.touser = touser;
	}

	public String getMsgtype() {
		return msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}

	public Text getText() {
		return text;
	}

	public void setText(Text text) {
		this.text = text;
		this.setMsgtype("text");
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
		this.msgtype="image";
	}

	public Voice getVoice() {
		return voice;
	}

	public void setVoice(Voice voice) {
		this.voice = voice;
		this.msgtype="voice";
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
		this.msgtype="video";
	}

	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
		this.msgtype="music";
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
		this.msgtype="news";
	}

	public Mpnews getMpnews() {
		return mpnews;
	}

	public void setMpnews(Mpnews mpnews) {
		this.mpnews = mpnews;
		this.msgtype="mpnews";
	}
	
}
