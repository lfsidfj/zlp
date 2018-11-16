package spiderman.wechat.domain.result;


public class BaseWechatResult implements WechatResult{
	protected Integer errcode = 0;
	protected String errmsg;
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}

	public String getErrmsg() {
		return this.errmsg;
	}
	
	
	public String getMessage(){
		int temp = errcode == null ? 0:errcode;
		String chineseMessage = getChineseMessage(temp);
		if (chineseMessage == null) {
			return getErrmsg();
		}
		return chineseMessage;
	}
	public String getChineseMessage(int errcode){
		//TODO 更多错误码待加入
		String message = "";//PropertyUtil.getProperties("wechatFrameworkConfig.properties").getProperty("wechatErrcode."+errcode);
		/*switch (errcode) {
		case 45028:
			message = "本月群发配额已用完！";
			break;
		case 0:
			message = "成功！";
			break;
		case 40103:
			message = "行业ID不合法！";
			break;

		default:
			message = "";
			break;
		}*/
		return message;
	}
	@Override
	public boolean isSuccess() {
		return errcode == 0;
	}

	public Integer getErrcode() {
		return errcode;
	}

	public void setErrcode(Integer errcode) {
		this.errcode = errcode;
	}
	
}
