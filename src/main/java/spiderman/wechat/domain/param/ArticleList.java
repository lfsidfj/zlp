package spiderman.wechat.domain.param;

import java.util.List;

public class ArticleList extends BaseWechatSend {
	
	private List<Article> articles;

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
}
