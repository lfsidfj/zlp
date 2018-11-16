package spiderman.wechat.domain.send;

import java.util.List;

public class NewsMessage extends BaseMessage {
	private int ArticleCount;
	private List<Article> Articles;
	public NewsMessage() {
		super();
		setMsgType("news");
		// TODO Auto-generated constructor stub
	}
	public int getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}
	public List<Article> getArticles() {
		return Articles;
	}
	public void setArticles(List<Article> articles) {
		Articles = articles;
	}
	
}
