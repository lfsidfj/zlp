package spiderman.wechat.domain.receive;

public class MessageReceive {
	
	//=====================通用===============================================
	private String ToUserName;//开发者微信号
	private String FromUserName;//发送方帐号（一个OpenID）
	private Long CreateTime;//消息创建时间 （整型）
	private String MsgType;//信息类型
	
	//=====================普通消息===============================================
	
	
	private String MsgId;//消息id，64位整型
	
	//=====================文本消息===============================================
	private String Content;//文本消息内容
	
	//=====================图片消息、语音消息、视频消息、小视频消息===============================================
	private String MediaId;//图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
	
	//=====================图片消息===============================================
	private String PicUrl;//图片链接（由系统生成）
	
	//=====================语音消息===============================================
	private String Format;//语音格式，如amr，speex等
	private String Recognition;//语音识别结果，UTF8编码
	
	//=====================视频消息、小视频消息===============================================
	private String ThumbMediaId;//视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
	
	//=====================地理位置消息===============================================
	private String Location_X;//地理位置纬度
	private String Location_Y;//地理位置经度
	private String Scale;//地图缩放大小
	private String Label;//地理位置信息
	
	//=====================链接消息===============================================
	private String Title;//消息标题
	private String Description;//消息描述
	private String Url;//消息链接
	
	
	
	
	
	
	//=====================事件推送===============================================
	
	//======关注/取消关注事件、扫描带参数二维码事件、上报地理位置事件、自定义菜单事件===============
	private String Event;//事件类型
	
	//=====================上报地理位置事件===============================================
	private String Latitude;//地理位置纬度
	private String Longitude;//地理位置经度
	private String Precision;//地理位置精度
	
	//=====================扫描带参数二维码事件、自定义菜单事件===============================================
	private String EventKey;//事件KEY值
	
	//=====================扫描带参数二维码事件===============================================
	private String Ticket;//二维码的ticket，可用来换取二维码图片
	
	
	//=====================自定义菜单事件推送========================================
	private String MenuId;//指菜单ID，如果是个性化菜单，则可以通过这个字段，知道是哪个规则的菜单被点击了。
	private ScanCodeInfo ScanCodeInfo;//扫描信息
	private SendLocationInfo SendLocationInfo;//发送的位置信息
	
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}
	public Long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(Long createTime) {
		CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public String getMsgId() {
		return MsgId;
	}
	public void setMsgId(String msgId) {
		MsgId = msgId;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getMediaId() {
		return MediaId;
	}
	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	public String getPicUrl() {
		return PicUrl;
	}
	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	public String getFormat() {
		return Format;
	}
	public void setFormat(String format) {
		Format = format;
	}
	public String getRecognition() {
		return Recognition;
	}
	public void setRecognition(String recognition) {
		Recognition = recognition;
	}
	public String getThumbMediaId() {
		return ThumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}
	public String getLocation_X() {
		return Location_X;
	}
	public void setLocation_X(String location_X) {
		Location_X = location_X;
	}
	public String getLocation_Y() {
		return Location_Y;
	}
	public void setLocation_Y(String location_Y) {
		Location_Y = location_Y;
	}
	public String getScale() {
		return Scale;
	}
	public void setScale(String scale) {
		Scale = scale;
	}
	public String getLabel() {
		return Label;
	}
	public void setLabel(String label) {
		Label = label;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
	public String getEvent() {
		return Event;
	}
	public void setEvent(String event) {
		Event = event;
	}
	public String getLatitude() {
		return Latitude;
	}
	public void setLatitude(String latitude) {
		Latitude = latitude;
	}
	public String getLongitude() {
		return Longitude;
	}
	public void setLongitude(String longitude) {
		Longitude = longitude;
	}
	public String getPrecision() {
		return Precision;
	}
	public void setPrecision(String precision) {
		Precision = precision;
	}
	public String getEventKey() {
		return EventKey;
	}
	public void setEventKey(String eventKey) {
		EventKey = eventKey;
	}
	public String getTicket() {
		return Ticket;
	}
	public void setTicket(String ticket) {
		Ticket = ticket;
	}
	public String getMenuId() {
		return MenuId;
	}
	public void setMenuId(String menuId) {
		MenuId = menuId;
	}
	public ScanCodeInfo getScanCodeInfo() {
		return ScanCodeInfo;
	}
	public void setScanCodeInfo(ScanCodeInfo scanCodeInfo) {
		ScanCodeInfo = scanCodeInfo;
	}
	public SendLocationInfo getSendLocationInfo() {
		return SendLocationInfo;
	}
	public void setSendLocationInfo(SendLocationInfo sendLocationInfo) {
		SendLocationInfo = sendLocationInfo;
	}
	
}
