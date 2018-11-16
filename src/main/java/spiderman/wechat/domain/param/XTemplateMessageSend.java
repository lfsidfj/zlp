package spiderman.wechat.domain.param;

import java.util.HashMap;
import java.util.Map;

/**
 * 小程序模版消息
 * @author root
 *
 */
public class XTemplateMessageSend extends BaseWechatSend{
	private String touser;

	private String template_id;

	private String page;

	private String form_id;
	
	private String emphasis_keyword;

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


	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getForm_id() {
		return form_id;
	}

	public void setForm_id(String form_id) {
		this.form_id = form_id;
	}

	public String getEmphasis_keyword() {
		return emphasis_keyword;
	}

	public void setEmphasis_keyword(String emphasis_keyword) {
		this.emphasis_keyword = emphasis_keyword;
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
