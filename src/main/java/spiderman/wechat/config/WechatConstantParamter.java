package spiderman.wechat.config;

/**
 * 微信所有常量存放类
 * @author 战马
 *
 */
public class WechatConstantParamter {
	/**
	 * 获取access_token的url
	 */
	public static final String getAccessTokenUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#APPID#&secret=#APPSECRET#";
	/**
	 * 临时素材上传url
	 */
	public static final String uploadAttachUrl = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=#ACCESS_TOKEN#&type=#TYPE#";
	/**
	 * 新增永久图文素材url
	 */
	public static final String uploadPermanentAttachUrl1 = "https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=#ACCESS_TOKEN#";
	/**
	 * 新增其他类型永久素材上传url
	 */
	public static final String uploadPermanentAttachUrl2 = "https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=#ACCESS_TOKEN#&type=#TYPE#";
	/**
	 * 图文消息上传url
	 */
	public static final String uploadNewsUrl = "https://api.weixin.qq.com/cgi-bin/media/uploadnews?access_token=#ACCESS_TOKEN#";
	
	/**
	 * 获取临时素材url
	 */
	public static final String getMediaUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=#ACCESS_TOKEN#&media_id=#MEDIA_ID#";
	/**
	 * 获取永久素材url
	 */
	public static final String getPermanentMediaUrl = "https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=#ACCESS_TOKEN#";
	/**
	 * 删除永久素材url
	 */
	public static final String deletePermanentMediaUrl = "https://api.weixin.qq.com/cgi-bin/material/del_material?access_token=#ACCESS_TOKEN#";
	/**
	 * 修改永久图文素材url
	 */
	public static final String updatePermanentMediaUrl = "https://api.weixin.qq.com/cgi-bin/material/update_news?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取永久素材总数
	 */
	public static final String getPermanentMediaCountUrl = "https://api.weixin.qq.com/cgi-bin/material/get_materialcount?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取永久素材列表
	 */
	public static final String getPermanentMediaListUrl = "https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=#ACCESS_TOKEN#";
	/**
	 * 上传图文消息内的图片获取URL
	 */
	public static final String uploadNewsImgUrl = "https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=#ACCESS_TOKEN#";
	
	
	/**
	 * 消息预览url
	 */
	public static final String messagePreviewUrl = "https://api.weixin.qq.com/cgi-bin/message/mass/preview?access_token=#ACCESS_TOKEN#";
	/**
	 * 根据标签进行群发url
	 */
	public static final String sendMessageByGroupPreviewUrl = "https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=#ACCESS_TOKEN#";
	/**
	 * 根据OpenID列表群发url
	 */
	public static final String sendMessageByOpenIdUrl = "https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=#ACCESS_TOKEN#";
	/**
	 * 查询群发消息发送状态url
	 */
	public static final String getMassSendUrl = "https://api.weixin.qq.com/cgi-bin/message/mass/get?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取微信参数二维码url
	 */
	public static final String getQrcodeUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=#ACCESS_TOKEN#";
	/**
	 * 设置菜单url
	 */
	public static final String setMenuUrl = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=#ACCESS_TOKEN#";
	/**
	 *获取菜单url
	 */
	public static final String getMenuUrl = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=#ACCESS_TOKEN#";
	/**
	 *删除菜单url
	 */
	public static final String deleteMenuUrl = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取图文群发每日数据url
	 */
	public static final String articleSummaryUrl = "https://api.weixin.qq.com/datacube/getarticlesummary?access_token=#ACCESS_TOKEN#";
	
	/**
	 * 获取图文群发总数据url
	 */
	public static final String getArticleTotalUrl = "https://api.weixin.qq.com/datacube/getarticletotal?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取图文统计数据url
	 */
	public static final String getUserReadUrl = "https://api.weixin.qq.com/datacube/getuserread?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取图文统计分时数据url
	 */
	public static final String getUserReadHourUrl = "https://api.weixin.qq.com/datacube/getuserreadhour?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取图文统计分时数据url
	 */
	public static final String getShortUrl = "https://api.weixin.qq.com/cgi-bin/shorturl?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取图文分享转发数据url
	 */
	public static final String getUserShareUrl = "https://api.weixin.qq.com/datacube/getusershare?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取图文分享转发分时数据url
	 */
	public static final String getUserShareHourUrl = "https://api.weixin.qq.com/datacube/getusersharehour?access_token=#ACCESS_TOKEN#";
	/**
	 * 发放红包url
	 */
	public static final String sendRedPacketUrl = "https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack";
	/**
	 * 企业付款url
	 */
	public static final String companyPayUrl = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
	/**
	 * 企业付款查询url
	 */
	public static final String companyPayQueryUrl = "https://api.mch.weixin.qq.com/mmpaymkttransfers/gettransferinfo";
	/**
	 * 退款url
	 */
	public static final String refundtUrl = "https://api.mch.weixin.qq.com/secapi/pay/refund";
	/**
	 * 退款查询url
	 */
	public static final String refundQuerytUrl = "https://api.mch.weixin.qq.com/pay/refundquery";
	/**
	 * 统一订单url
	 */
	public static final String unifiedOrderUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	/**
	 * 查询订单url
	 */
	public static final String queryOrderUrl = "https://api.mch.weixin.qq.com/pay/orderquery";
	/**
	 * 设置模板消息所属行业url
	 */
	public static final String setIndustryUrl = "https://api.weixin.qq.com/cgi-bin/template/api_set_industry?access_token=#ACCESS_TOKEN#";
	/**
	 * 根据订单状态/创建时间获取订单详情url
	 */
	public static final String getOrderByFilteUrl = "https://api.weixin.qq.com/merchant/order/getbyfilter?access_token=#ACCESS_TOKEN#";
	/**
	 * 6.4设置订单发货信息url
	 */
	public static final String setDeliveryUrl = "https://api.weixin.qq.com/merchant/order/setdelivery?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取模板消息id url
	 */
	public static final String getTemplateIdUrl = "https://api.weixin.qq.com/cgi-bin/template/api_add_template?access_token=#ACCESS_TOKEN#";
	/**
	 * 发送模板消息 url
	 */
	public static final String sendTemplateMessageUrl = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=#ACCESS_TOKEN#";
	/**
	 * 删除模板消息 url
	 */
	public static final String deleteTemplateMessageUrl = "https://api.weixin.qq.com/cgi-bin/template/del_private_template?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取模板列表 url
	 */
	public static final String getAllTemplateMessageUrl = "https://api.weixin.qq.com/cgi-bin/template/get_all_private_template?access_token=#ACCESS_TOKEN#";
	/**
	 * 用户同意授权，获取code url
	 */
	public static final String getAuthorCodeUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=#APPID#&redirect_uri=#REDIRECT_URI#&response_type=code&scope=#SCOPE#&state=#STATE##wechat_redirect";
	
	/**
	 * 通过code换取网页授权access_token url
	 */
	public static final String getAuthorAssessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#APPID#&secret=#APPSECRET#&code=#CODE#&grant_type=authorization_code";
	/**
	 * 通过code换取网页授权access_token url
	 */
	public static final String pullUserInformationUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=#PAGE_ACCESS_TOKEN#&openid=#OPENID#&lang=#LANG#";
	/**
	 * 获取jsapi_ticket url
	 */
	public static final String getJsapiTicketUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=#ACCESS_TOKEN#&type=jsapi";
	/**
	 * 添加客服帐号url
	 */
	public static final String createKFAcountUrl = "https://api.weixin.qq.com/customservice/kfaccount/add?access_token=#ACCESS_TOKEN#";
	/**
	 * 新版客服创建会话url
	 */
	public static final String kfCreateSessionUrl = "https://api.weixin.qq.com/customservice/kfsession/create?access_token=#ACCESS_TOKEN#";
	/**
	 * 新版客服关闭会话url
	 */
	public static final String kfCloseSessionUrl = "https://api.weixin.qq.com/customservice/kfsession/close?access_token=#ACCESS_TOKEN#";
	/**
	 * 客服发消息url
	 */
	public static final String kfSendUrl = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=#ACCESS_TOKEN#";
	/**
	 * 获取用户列表url
	 */
	public static final String getUserListUrl = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=#ACCESS_TOKEN#&next_openid=#NEXT_OPENID#";
	/**
	 * 获取单个用户基本信息url
	 */
	public static final String getUserInfoUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=#ACCESS_TOKEN#&openid=#OPENID#";
	/**
	 * 批量获取用户基本信息url
	 */
	public static final String getBatchUserInfoUrl = "https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token=#ACCESS_TOKEN#";
	
	/********************小程序***********************/
	
	/**
	 * 获取sessionkey url
	 */
	public static final String getSessionKeyUrl = "https://api.weixin.qq.com/sns/jscode2session?appid=#APPID#&secret=#SECRET#&js_code=#JSCODE#&grant_type=authorization_code";
	
	public class messageType{
		public static final String msgtype_news = "mpnews";
		public static final String msgtype_voice = "voice";
	}
	
}
