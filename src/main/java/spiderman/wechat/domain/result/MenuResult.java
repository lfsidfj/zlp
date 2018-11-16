package spiderman.wechat.domain.result;

import spiderman.wechat.domain.param.Menu;

public class MenuResult extends BaseWechatResult{
	private Menu menu;

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

}
