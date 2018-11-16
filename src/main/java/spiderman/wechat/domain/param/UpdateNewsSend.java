package spiderman.wechat.domain.param;

/**
 * 修改永久图文素材
 * @author root
 *
 */
public class UpdateNewsSend extends BaseWechatSend {
	private String media_id;
	private String index;
	private Article articles;
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public Article getArticles() {
		return articles;
	}
	public void setArticles(Article articles) {
		this.articles = articles;
	}
	
}
