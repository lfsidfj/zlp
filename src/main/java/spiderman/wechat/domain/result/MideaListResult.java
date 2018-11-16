package spiderman.wechat.domain.result;

import java.util.List;
/**
 * 获取素材列表
 * @author root
 *
 */
public class MideaListResult extends BaseWechatResult {
	private Integer total_count;
	private Integer item_count;
	private List<Item> item;
	
	public Integer getTotal_count() {
		return total_count;
	}

	public void setTotal_count(Integer total_count) {
		this.total_count = total_count;
	}

	public Integer getItem_count() {
		return item_count;
	}

	public void setItem_count(Integer item_count) {
		this.item_count = item_count;
	}

	public List<Item> getItem() {
		return item;
	}

	public void setItem(List<Item> item) {
		this.item = item;
	}

	public class Item{
		private String media_id;
		private String update_time;
		//图文特有
		private Content content;
		//其他类型特有
		private String name;
		//其他类型特有
		private String url;
		public String getMedia_id() {
			return media_id;
		}
		public void setMedia_id(String media_id) {
			this.media_id = media_id;
		}
		public String getUpdate_time() {
			return update_time;
		}
		public void setUpdate_time(String update_time) {
			this.update_time = update_time;
		}
		public Content getContent() {
			return content;
		}
		public void setContent(Content content) {
			this.content = content;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		
	}
	
	public class Content{
		private List<NewsItem> news_item;

		public List<NewsItem> getNews_item() {
			return news_item;
		}

		public void setNews_item(List<NewsItem> news_item) {
			this.news_item = news_item;
		}
		
	}
	
	public class NewsItem{
		private String title;
		private String thumb_media_id;
		private String show_cover_pic;
		private String author;
		private String digest;
		private String content;
		private String url;
		private String content_source_url;
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getThumb_media_id() {
			return thumb_media_id;
		}
		public void setThumb_media_id(String thumb_media_id) {
			this.thumb_media_id = thumb_media_id;
		}
		public String getShow_cover_pic() {
			return show_cover_pic;
		}
		public void setShow_cover_pic(String show_cover_pic) {
			this.show_cover_pic = show_cover_pic;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getDigest() {
			return digest;
		}
		public void setDigest(String digest) {
			this.digest = digest;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getContent_source_url() {
			return content_source_url;
		}
		public void setContent_source_url(String content_source_url) {
			this.content_source_url = content_source_url;
		}
		
	}
}
