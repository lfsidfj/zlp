package spiderman.wechat.domain.param;

import java.util.HashMap;
import java.util.Map;

public class TemplateMessageSend extends BaseWechatSend{
	private String touser;

	private String template_id;

	private String url;

	private String topcolor;

	private Map<String, TemplateNode> data = new HashMap<String, TemplateNode>();
	
	public String getTouser() {
		return touser;
	}

	public void setTouser(String touser) {
		this.touser = touser;
	}
	
	public void addData(String key,String color,String value){
		data.put(key, new TemplateNode(value, color));
	}

	public String getTemplate_id() {
		return template_id;
	}

	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTopcolor() {
		return topcolor;
	}


	public void setTopcolor(String topcolor) {
		this.topcolor = topcolor;
	}


	public Map<String, TemplateNode> getData() {
		return data;
	}
	public void setData(Map<String, TemplateNode> data) {
		this.data = data;
	}

	public class TemplateNode{
		private String value;
		private String color;
		
		public TemplateNode() {
			super();
		}
		public TemplateNode(String value, String color) {
			super();
			this.value = value;
			this.color = color;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
	}
}
