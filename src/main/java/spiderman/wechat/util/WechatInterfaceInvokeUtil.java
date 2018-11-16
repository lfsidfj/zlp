package spiderman.wechat.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import spiderman.util.base.BaseUtil;
import spiderman.util.base.StringUtil;
import spiderman.util.digest.Md5Util;
import spiderman.util.file.FileUtil;
import spiderman.util.http.HttpUtil;
import spiderman.util.task.DataCacheUtil;
import spiderman.wechat.config.WechatConfig;
import spiderman.wechat.config.WechatConstantParamter;
import spiderman.wechat.domain.param.ArticleList;
import spiderman.wechat.domain.param.CompanyPayQuerySend;
import spiderman.wechat.domain.param.CompanyPaySend;
import spiderman.wechat.domain.param.CustomSend;
import spiderman.wechat.domain.param.GetBatchUserInfoSend;
import spiderman.wechat.domain.param.KFAccount;
import spiderman.wechat.domain.param.MassSend;
import spiderman.wechat.domain.param.Menu;
import spiderman.wechat.domain.param.MideaListSend;
import spiderman.wechat.domain.param.OrderQueryParam;
import spiderman.wechat.domain.param.RedPacketSend;
import spiderman.wechat.domain.param.RefundQuerySend;
import spiderman.wechat.domain.param.RefundSend;
import spiderman.wechat.domain.param.SetIndustrySend;
import spiderman.wechat.domain.param.TemplateMessageSend;
import spiderman.wechat.domain.param.UnifiedOrderSend;
import spiderman.wechat.domain.param.UpdateNewsSend;
import spiderman.wechat.domain.result.AccessToken;
import spiderman.wechat.domain.result.AttachUploadResult;
import spiderman.wechat.domain.result.BaseWechatResult;
import spiderman.wechat.domain.result.CompanyPayQueryResult;
import spiderman.wechat.domain.result.CompanyPayResult;
import spiderman.wechat.domain.result.GetTemplateIdResult;
import spiderman.wechat.domain.result.JsApiTicket;
import spiderman.wechat.domain.result.MassResult;
import spiderman.wechat.domain.result.MassSendStatusResult;
import spiderman.wechat.domain.result.MenuResult;
import spiderman.wechat.domain.result.MideaCountResult;
import spiderman.wechat.domain.result.MideaListResult;
import spiderman.wechat.domain.result.NewsListResult;
import spiderman.wechat.domain.result.OrderQueryResult;
import spiderman.wechat.domain.result.PageAccessToken;
import spiderman.wechat.domain.result.PermanentAttachUploadResult;
import spiderman.wechat.domain.result.PermanentNewsUploadResult;
import spiderman.wechat.domain.result.QrcodeResult;
import spiderman.wechat.domain.result.RedPacketResult;
import spiderman.wechat.domain.result.RefundQueryResult;
import spiderman.wechat.domain.result.RefundResult;
import spiderman.wechat.domain.result.ShortcutUrlResult;
import spiderman.wechat.domain.result.TemplateList;
import spiderman.wechat.domain.result.TemplateMessageResult;
import spiderman.wechat.domain.result.UnifiedOrderResult;
import spiderman.wechat.domain.result.UserListResult;
import spiderman.wechat.domain.result.WechatResult;
import spiderman.wechat.domain.result.WechatUser;
import spiderman.wechat.domain.result.WechatUserListResult;
import spiderman.wechat.domain.result.WechatUserResult;

import com.google.gson.Gson;

/**
 * 微信接口调用工具类
 * @author 战马
 *
 */
@SuppressWarnings("deprecation")
public class WechatInterfaceInvokeUtil {
	private static final Logger log = LoggerFactory.getLogger(WechatInterfaceInvokeUtil.class);

	/**
	 * 把AppID，AppSecret,ACCESS_TOKEN装配到url
	 * @param url
	 * @return
	 */
	public static String fitParam2Url(String url){
		String temp = url.replaceAll("#APPID#", WechatConfig.appID);
		if (temp.contains("#ACCESS_TOKEN#")) {
			temp = temp.replaceAll("#ACCESS_TOKEN#", AccessTokenUtil.getAccessToken().getAccess_token());
		}
		return temp.replaceAll("#APPSECRET#", WechatConfig.appSecret);
	}

	/**
	 * 从微信服务器获取accessToken,不会缓存accessToken，
	 * 请调用steed.util.wechat.AccessTokenUtil
	 * @see steed.util.wechat.AccessTokenUtil
	 */
	public static AccessToken getAccessToken(){
		String url = WechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.getAccessTokenUrl);
		String json = HttpUtil.getRequestString(HttpUtil.http_get, url, null, null);
		AccessToken data = new Gson().fromJson(json, AccessToken.class);
		data.setAccess_token_getTime(new Date().getTime());
		log.debug("accessToken----->"+data.getAccess_token());
		return data;
	}

	public static JsApiTicket getJsApiTicket(){
		String url = WechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.getJsapiTicketUrl);
		String json = HttpUtil.getRequestString(HttpUtil.http_get, url, null, null);
		JsApiTicket data = new Gson().fromJson(json, JsApiTicket.class);
		data.setTicket_getTime(new Date().getTime());
		log.debug("jsApiTicket----->"+data.getTicket());
		return data;
	}

	/*************************\微信网页授权******************************/
	public static void getUserInformation(HttpServletResponse response, HttpServletRequest request,boolean getAllInformation,boolean login){
		try {
			String goUrl = "http://" + request.getServerName() //服务器地址
            + ":"
            + request.getServerPort()           //端口号
            + request.getContextPath()      //项目名称
            + request.getServletPath()      //请求页面或其他地址
        + "?" + (request.getQueryString()); //参数
			response.sendRedirect(getUserSNSUrl(getAllInformation, login, goUrl));
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	/**
	 * 获取用于拉取用户信息重定向的url
	 * @param getAllInformation 是否获取用户除openID外的其他信息
	 * @param goUrl 获取用户信息成功后跳转的url
	 * @return
	 */
	public static String getUserSNSUrl(boolean getAllInformation,boolean login,String goUrl){
		String fitParam2Url = WechatConstantParamter.getAuthorCodeUrl;
		fitParam2Url=fitParam2Url.replaceFirst("#APPID#", WechatConfig.appID);
		String scope = "snsapi_base";
		if (getAllInformation) {
			scope = "snsapi_userinfo";
		}
		String state = new Date().getTime()+""+new Random().nextInt();
		fitParam2Url = fitParam2Url.replaceFirst("#SCOPE#", scope)
				.replaceFirst("#STATE#", state)
				//.replaceFirst("#REDIRECT_URI#", StringUtil.encodeUrl("http://demo.app88.cn/123jkpt/appwechatwechatUserInformation.do"));
				.replaceFirst("#REDIRECT_URI#", StringUtil.encodeUrl(WechatConfig.OAuthBackUrl));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goUrl", goUrl);
		map.put("login", login);
		map.put("getAllInformation", getAllInformation);
		//这里保存重定向的地址和应用授权作用域信息
		DataCacheUtil.setData(state, "wechatSNSSate", map);
		return fitParam2Url;
	}
	/**
	 * 拉取用户信息
	 * @param access_token
	 * @param openid
	 * @param lang 语言 一般传'zh_CN'
	 * @return
	 */
	public static WechatUser pullUserInformation(String access_token,String openid,String lang){
		String url = WechatConstantParamter.pullUserInformationUrl
			.replaceFirst("#PAGE_ACCESS_TOKEN#", access_token)
			.replaceFirst("#OPENID#", openid).replaceFirst("#LANG#", lang);
		String requestString = HttpUtil.getRequestString(HttpUtil.http_get, url, null, null, null);
		log.debug("拉取到的用户信息--->{}",requestString);
		return BaseUtil.parseJson(requestString, WechatUser.class);
	}
	/**
	 * 根据code拉取用户信息
	 */
	public static WechatUser pullUserInformation(String code){
		PageAccessToken pageAccessToken = getPageAccessToken(code);
		return pullUserInformation(pageAccessToken.getAccess_token(), pageAccessToken.getOpenid(), "zh_CN");
	}

	/**
	 * 用code兑换PageAccessToken
	 * @param code
	 * @return
	 */
	public static PageAccessToken getPageAccessToken(String code){
		String url = WechatConstantParamter.getAuthorAssessTokenUrl
				.replaceAll("#APPID#", WechatConfig.appID)
				.replaceAll("#APPSECRET#", WechatConfig.appSecret)
				.replaceAll("#CODE#", code);
		String requestString = HttpUtil.getRequestString(HttpUtil.http_post, url, null, null, null);
		return BaseUtil.parseJson(requestString, PageAccessToken.class);
	}
	/*************************#微信网页授权******************************/

	/*************************\菜单接口******************************/
	/**
	 * 设置菜单接口
	 * @param articles
	 * @return
	 */
	public static BaseWechatResult setMenu(Menu menu){
//		return invokeWechatInterface(menu, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.setMenuUrl));
		return BaseUtil.parseJson(HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(WechatConstantParamter.setMenuUrl), null, null, BaseUtil.getJson(menu)), BaseWechatResult.class);
	}
	public static BaseWechatResult setMenu(String json){
//		return invokeWechatInterface(menu, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.setMenuUrl));
		return BaseUtil.parseJson(HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(WechatConstantParamter.setMenuUrl), null, null, json), BaseWechatResult.class);
	}
	/**
	 * 获取菜单接口
	 * @param articles
	 * @return
	 */
	public static Menu getMenu(){
		return BaseUtil.parseJson(HttpUtil.getRequestString(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.getMenuUrl), null, null, null),MenuResult.class).getMenu();
	}
	/**
	 * 删除菜单接口
	 * @return
	 */
	public static boolean deleteMenu(){
		return BaseUtil.parseJson(HttpUtil.getRequestString(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.deleteMenuUrl), null, null, null),BaseWechatResult.class).isSuccess();
	}
	/*************************#菜单接口******************************/

	/*************************\模板消息******************************/
	/**
	 * 设置模板消息所属行业
	 * @param send
	 */
	public static BaseWechatResult setIndustry(SetIndustrySend send){
		return invokeWechatInterface(send, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.setIndustryUrl));
	}
	/**
	 * 获取模板ID
	 * @param template_id_short
	 * @return
	 */
	public static GetTemplateIdResult getTemplateId(String template_id_short){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("template_id_short", template_id_short);
		return invokeWechatInterface(map, GetTemplateIdResult.class, fitParam2Url(WechatConstantParamter.getTemplateIdUrl));
	}
	/**
	 * 发送模板消息
	 * @param send
	 * @return
	 */
	public static TemplateMessageResult sendTemplateMessage(TemplateMessageSend send){
		return invokeWechatInterface(send, TemplateMessageResult.class, fitParam2Url(WechatConstantParamter.sendTemplateMessageUrl));
	}
	/**
	 * 删除模版消息
	 * @param template_id
	 * @return
	 */
	public static BaseWechatResult deleteTemplateMessage(String template_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("template_id", template_id);
		return invokeWechatInterface(map, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.deleteTemplateMessageUrl));
	}
	/**
	 * 获取模版列表
	 * @param send
	 * @return
	 */
	public static TemplateList getAllTemplateMessage(TemplateMessageSend send){
		return BaseUtil.parseJson(HttpUtil.getRequestString(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.deleteTemplateMessageUrl), null, null, null),TemplateList.class);
	}
	/*************************#模板消息******************************/
	/**
	 * 获取临时二维码
	 * expire_seconds 	该二维码有效时间，以秒为单位。 最大不超过2592000（即30天），此字段如果不填(传null)，则默认有效期为30天。
		scene_id 	场景值ID，临时二维码时为32位非0整型，永久二维码时最大值为100000（目前参数只支持1--100000）
	 * @return
	 */
	public static QrcodeResult getTempQrcode(Long expire_seconds,int scene_id){
		Map<String, Object> map = new HashMap<String, Object>();
		if (expire_seconds == null) {
			expire_seconds = 2592000L;
		}
		map.put("expire_seconds",expire_seconds);
		Map<String, Object> action_info = new HashMap<String, Object>();
		Map<String, Object> scene = new HashMap<String, Object>();
		scene.put("scene_id", scene_id);
		action_info.put("scene", scene);
		map.put("action_info",action_info);
		map.put("action_name","QR_SCENE");
		String requestString = HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(WechatConstantParamter.getQrcodeUrl), null, null, BaseUtil.getJson(map));
		return BaseUtil.parseJson(requestString, QrcodeResult.class);
	}

	/**
	 * 获取参数二维码scene_str == null时为临时二维码,否则是获取永久二维码
	action_name 	二维码类型，QR_SCENE为临时,QR_LIMIT_SCENE为永久,QR_LIMIT_STR_SCENE为永久的字符串参数值
	action_info 	二维码详细信息
	scene_id 	场景值ID，临时二维码时为32位非0整型，永久二维码时最大值为100000（目前参数只支持1--100000）
	scene_str 	场景值ID（字符串形式的ID），字符串类型，长度限制为1到64，仅永久二维码支持此字段
	 * @return
	 */
	public static QrcodeResult getPermanentQrcode(String scene_str,Integer scene_id){
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> action_info = new HashMap<String, Object>();
		Map<String, Object> scene = new HashMap<String, Object>();
		scene.put("scene_id", scene_id);
		scene.put("scene_str", scene_str);
		action_info.put("scene", scene);
		map.put("action_info",action_info);
		if (scene_str != null) {
			map.put("action_name","QR_LIMIT_STR_SCENE");
		}else {
			map.put("action_name","QR_SCENE");
			map.put("expire_seconds",2592000);
		}
		String requestString = HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(WechatConstantParamter.getQrcodeUrl), null, null, BaseUtil.getJson(map));
		return BaseUtil.parseJson(requestString, QrcodeResult.class);
	}
	/**
	 * 长链接转短连接
	 * @param long_url
	 * @return 短链接
	 */
	public static ShortcutUrlResult shorturl(String long_url){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("action", "long2short");
		map.put("long_url", long_url);
		return invokeWechatInterface(map, ShortcutUrlResult.class, WechatConstantParamter.getShortUrl);
	}

	/***************************\素材管理********************/
	/**
	 * 上传临时素材接口
	 * @param filePath
	 * @param isthumb 是否是缩略图
	 * @return
	 */
	public static AttachUploadResult uploadAttach(String filePath,boolean isthumb) {
		 CloseableHttpClient httpclient = HttpClients.createDefault();
	        try {
	        	String url = WechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.uploadAttachUrl);
	        	String attachType;
	        	if (isthumb) {
					attachType = "thumb";
				}else {
					attachType = getAttachType(FileUtil.getFileSuffix(filePath));
				}
				url = url.replaceAll("#TYPE#", attachType);

	            HttpPost httppost = new HttpPost(url);
	            FileBody img = new FileBody(new File(filePath));
	            StringBody filename = new StringBody(img.getFilename(), ContentType.TEXT_PLAIN);
	            HttpEntity reqEntity = MultipartEntityBuilder.create()
	                    .addPart("media", img)
	                    .addPart("filename", filename)
	                    .build();
	            httppost.setEntity(reqEntity);
	            CloseableHttpResponse response = httpclient.execute(httppost);
	            try {
	                HttpEntity resEntity = response.getEntity();
                    AttachUploadResult attachUploadResult = new Gson().fromJson(EntityUtils.toString(resEntity), AttachUploadResult.class);
	                EntityUtils.consume(resEntity);
	                return attachUploadResult;
	            } finally {
	                response.close();
	            }
	        }catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}  finally {
	            try {
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
	}
	/**
	 * 上传永久图文素材接口
	 * @param articleList
	 * @return
	 */
	public static PermanentNewsUploadResult uploadPermanentNews(ArticleList articleList){
		return invokeWechatInterface(articleList, PermanentNewsUploadResult.class, WechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.uploadPermanentAttachUrl1));
	}
	/**
	 * 上传其他类型永久素材接口
	 * @param filePath
	 * @return
	 */
	public static PermanentAttachUploadResult uploadPermanentOthers(String filePath){
		CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
        	String url = WechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.uploadPermanentAttachUrl2);
        	String attachType;
//        	if (isthumb) {
//				attachType = "thumb";
//			}else {
				attachType = getAttachType(FileUtil.getFileSuffix(filePath));
//			}
			url = url.replaceAll("#TYPE#", attachType);

            HttpPost httppost = new HttpPost(url);
            FileBody img = new FileBody(new File(filePath));
            StringBody filename = new StringBody(img.getFilename(), ContentType.TEXT_PLAIN);
            HttpEntity reqEntity = MultipartEntityBuilder.create()
                    .addPart("media", img)
                    .addPart("filename", filename)
                    .build();
            httppost.setEntity(reqEntity);
            CloseableHttpResponse response = httpclient.execute(httppost);
            try {
                HttpEntity resEntity = response.getEntity();
                PermanentAttachUploadResult attachUploadResult = new Gson().fromJson(EntityUtils.toString(resEntity), PermanentAttachUploadResult.class);
                EntityUtils.consume(resEntity);
                return attachUploadResult;
            } finally {
                response.close();
            }
        }catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}  finally {
            try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
	}
	/**
	 * 上传图文消息内的图片
	 *author:Spiderman
	 * @param filePath
	 * @return
	 */
	public static Map<String,Object> uploadNewsImg(String filePath) {
		 CloseableHttpClient httpclient = HttpClients.createDefault();
	        try {
	        	String url = WechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.uploadNewsImgUrl);
	        	String attachType;
	        	attachType = getAttachType(FileUtil.getFileSuffix(filePath));
				url = url.replaceAll("#TYPE#", attachType);

	            HttpPost httppost = new HttpPost(url);
	            FileBody img = new FileBody(new File(filePath));
	            StringBody filename = new StringBody(img.getFilename(), ContentType.TEXT_PLAIN);
	            HttpEntity reqEntity = MultipartEntityBuilder.create()
	                    .addPart("media", img)
	                    .addPart("filename", filename)
	                    .build();
	            httppost.setEntity(reqEntity);
	            CloseableHttpResponse response = httpclient.execute(httppost);
	            try {
	                HttpEntity resEntity = response.getEntity();
	                Map<String,Object> attachUploadResult = new Gson().fromJson(EntityUtils.toString(resEntity), Map.class);
	                EntityUtils.consume(resEntity);
	                return attachUploadResult;
	            } finally {
	                response.close();
	            }
	        }catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}  finally {
	            try {
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
	}
	/**
	 * 删除永久素材
	 *author:Spiderman
	 * @param media_id
	 * @return
	 */
	public static BaseWechatResult deletePermanentMidea(String media_id){
		Map<String,Object> media=new HashMap<String, Object>();
		media.put("media_id", media_id);
		return invokeWechatInterface(media, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.deletePermanentMediaUrl));
	}
	/**
	 * 更新永久素材
	 *author:Spiderman
	 * @param news
	 * @return
	 */
	public static BaseWechatResult updatePermanentMidea(UpdateNewsSend news){
		return invokeWechatInterface(news, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.updatePermanentMediaUrl));
	}
	/**
	 * 获取永久素材总数
	 *author:Spiderman
	 * @return
	 */
	public static MideaCountResult getPermanentMideaCount(){
		String json = HttpUtil.getRequestString(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.getPermanentMediaCountUrl), null, null);
		return BaseUtil.parseJson(json, MideaCountResult.class);
	}
	/**
	 * 获取永久素材列表
	 */
	public static MideaListResult getPermanentMideaList(MideaListSend send){
		return invokeWechatInterface(send, MideaListResult.class, fitParam2Url(WechatConstantParamter.getPermanentMediaListUrl));
	}
	/**
	 * 下载临时素材接口
	 * @param mediaID 媒体素材ID
	 * @return 浏览器能访问到的相对路径
	 */
	public static String downLoadMidea(String mediaID){
		CloseableHttpResponse response = null;
		try {
			HttpRequestBase buildRequest = HttpUtil.buildRequest(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.getMediaUrl).replaceAll("#MEDIA_ID#", mediaID), null, null);
			response = HttpClients.createDefault().execute(buildRequest);

			String fileName = response.getFirstHeader("Content-disposition").getValue();
			fileName = fileName.substring("attachment; filename=\"".length(), fileName.length()-1);

			HttpEntity entity = response.getEntity();
			byte[] bit = EntityUtils.toByteArray(entity);
			String path="D:\\wechatmedia\\"+fileName;
			File file = new File(path);
			file.mkdirs();
			file.delete();
			FileOutputStream fileOutputStream = new FileOutputStream(file);
			fileOutputStream.write(bit);
			fileOutputStream.flush();
			fileOutputStream.close();
			return path;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	/**
	 * 下载永久素材接口
	 * @param mediaID 媒体素材ID
	 * @return 浏览器能访问到的相对路径
	 */
	public static String downLoadPermanentMidea(String mediaID){
		CloseableHttpResponse response = null;
		try {
			HttpRequestBase buildRequest = HttpUtil.buildRequest(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.getPermanentMediaUrl).replaceAll("#MEDIA_ID#", mediaID), null, null);
			response = HttpClients.createDefault().execute(buildRequest);

			String fileName = response.getFirstHeader("Content-disposition").getValue();
			fileName = fileName.substring("attachment; filename=\"".length(), fileName.length()-1);

			HttpEntity entity = response.getEntity();
			byte[] bit = EntityUtils.toByteArray(entity);
			String path="D:\\wechatmedia\\"+fileName;
			File file = new File(path);
			file.mkdirs();
			file.delete();
			FileOutputStream fileOutputStream = new FileOutputStream(file);
			fileOutputStream.write(bit);
			fileOutputStream.flush();
			fileOutputStream.close();
			return path;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	/**
	 * 下载永久图文素材
	 *author:Spiderman
	 * @param mediaId
	 * @return
	 */
	public static NewsListResult downLoadPermanentNews(String mediaId){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("media_id", mediaId);
		return invokeWechatInterface(map, NewsListResult.class, WechatInterfaceInvokeUtil.fitParam2Url(WechatConstantParamter.getPermanentMediaUrl));
	}
	/***************************#素材管理********************/

	/**
	 * 统一下单接口
	 * @return
	 */
	public static UnifiedOrderResult unifiedOrder(UnifiedOrderSend unifiedOrderSend){
		unifiedOrderSend.setAppid(WechatConfig.appID);
		unifiedOrderSend.setMch_id(WechatConfig.mchId);
		unifiedOrderSend.setNotify_url(WechatConfig.notifyUrl);
		SignUtil.signUnifiedOrderSend(unifiedOrderSend);
		String redPacketSendMessageToXml = MessageUtil.toXml(unifiedOrderSend);
		String xml=HttpUtil.getRequestString(HttpUtil.http_post,WechatConstantParamter.unifiedOrderUrl, null, null, redPacketSendMessageToXml);
		UnifiedOrderResult result=MessageUtil.fromXml(xml, UnifiedOrderResult.class);
		return result;
	}
	/**
	 * 订单查询接口
	 * @return
	 */
	public static OrderQueryResult queryOrder(OrderQueryParam orderQuerySend){
		orderQuerySend.setMch_id(WechatConfig.mchId);
		orderQuerySend.setAppid(WechatConfig.appID);
		orderQuerySend.setNonce_str(Md5Util.Md5Digest(new Date().getTime()+""+new Random().nextInt()));
		orderQuerySend.setSign(null);
		orderQuerySend.setSign(SignUtil.signObj(orderQuerySend, "MD5", true).toUpperCase());
		String orderQuerySendToXml = MessageUtil.toXml(orderQuerySend);
		log.debug("查询订单接口，发送数据----->{}",new Object[]{orderQuerySendToXml});
		try {
			return MessageUtil.fromXml(HttpUtil.getRequestString(HttpUtil.http_post,WechatConstantParamter.queryOrderUrl, null, null, orderQuerySendToXml),OrderQueryResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 退款接口
	 * @return
	 */
	public static RefundResult refund(RefundSend refundSend){
		refundSend.setAppid(WechatConfig.appID);
		refundSend.setMch_id(WechatConfig.mchId);
		refundSend.setOp_user_id(WechatConfig.mchId);
		refundSend.setNonce_str(Md5Util.Md5Digest(new Date().getTime()+""+new Random().nextInt()));
		refundSend.setSign(null);
		refundSend.setSign(SignUtil.signObj(refundSend, "MD5", true));
		String redPacketSendMessageToXml = MessageUtil.toXml(refundSend);
		try {
			return MessageUtil.fromXml(HttpUtil.getRequestString(fitParam2Url(WechatConstantParamter.refundtUrl), null, null, redPacketSendMessageToXml, WechatConfig.certPath, WechatConfig.mchId),RefundResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 退款查询
	 * @param refundQuerySend
	 * @return
	 */
	public static RefundQueryResult refundQuery(RefundQuerySend refundQuerySend){
		refundQuerySend.setMch_id(WechatConfig.mchId);
		refundQuerySend.setAppid(WechatConfig.appID);
		refundQuerySend.setNonce_str(Md5Util.Md5Digest(new Date().getTime()+""+new Random().nextInt()));
		refundQuerySend.setSign(null);
		refundQuerySend.setSign(SignUtil.signObj(refundQuerySend, "MD5", true).toUpperCase());
		String refundQuerySendToXml = MessageUtil.toXml(refundQuerySend);
		log.debug("查询订单接口，发送数据----->{}",new Object[]{refundQuerySendToXml});
		try {
			return MessageUtil.fromXml(HttpUtil.getRequestString(HttpUtil.http_post,WechatConstantParamter.refundQuerytUrl, null, null, refundQuerySendToXml),RefundQueryResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 红包发放接口
	 * @return
	 */
	public static RedPacketResult sendRedPacket(RedPacketSend redPacketSend){
		redPacketSend.setMch_id(WechatConfig.mchId);
		if (StringUtil.isStringEmpty(redPacketSend.getSign())) {
			SignUtil.signRedPacketSend(redPacketSend);
		}
		String redPacketSendMessageToXml = MessageUtil.toXml(redPacketSend);
		try {
			String result=HttpUtil.getRequestString(fitParam2Url(WechatConstantParamter.sendRedPacketUrl), null, null, redPacketSendMessageToXml, WechatConfig.certPath, WechatConfig.mchId);
			return MessageUtil.fromXml(result, RedPacketResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 企业付款
	 * @param companyPaySend
	 * @return
	 */
	public static CompanyPayResult companyPay(CompanyPaySend companyPaySend){
		companyPaySend.setMch_appid(WechatConfig.appID);
		companyPaySend.setMchid(WechatConfig.mchId);
		SignUtil.signCompanyPaySend(companyPaySend);
		String companyPaySendMessageToXml = MessageUtil.toXml(companyPaySend);
		try {
			String result=HttpUtil.getRequestString(fitParam2Url(WechatConstantParamter.companyPayUrl), null, null, companyPaySendMessageToXml, WechatConfig.certPath, WechatConfig.mchId);
			return MessageUtil.fromXml(result, CompanyPayResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 企业付款查询
	 * @param companyPayQuerySend
	 * @return
	 */
	public static CompanyPayQueryResult companyPayQuery(CompanyPayQuerySend companyPayQuerySend){
		companyPayQuerySend.setAppid(WechatConfig.appID);
		companyPayQuerySend.setMch_id(WechatConfig.mchId);
		SignUtil.signCompanyPayQuerySend(companyPayQuerySend);
		String companyPayQuerySendMessageToXml = MessageUtil.toXml(companyPayQuerySend);
		try {
			String result=HttpUtil.getRequestString(fitParam2Url(WechatConstantParamter.companyPayQueryUrl), null, null, companyPayQuerySendMessageToXml, WechatConfig.certPath, WechatConfig.mchId);
			return MessageUtil.fromXml(result, CompanyPayQueryResult.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 添加客户账号
	 * @param account
	 * @return
	 */
	public static BaseWechatResult createKFAccount(KFAccount account){
		String result=HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(WechatConstantParamter.createKFAcountUrl), null, null, BaseUtil.getJson(account));
		return BaseUtil.parseJson(result, BaseWechatResult.class);
	}
	public static BaseWechatResult coustomSend(CustomSend content){
		String result=HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(WechatConstantParamter.kfSendUrl), null, null, BaseUtil.getJson(content));
		return BaseUtil.parseJson(result, BaseWechatResult.class);
	}

	/*************************\微信用户信息******************************/
	/**
	 * 获取微信用户列表
	 *author:Spiderman
	 * @return
	 */
	public static UserListResult getUserList(String NEXT_OPENID){
		String json = HttpUtil.getRequestString(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.getUserListUrl).replaceAll("#NEXT_OPENID#", NEXT_OPENID), null, null);
		return BaseUtil.parseJson(json, UserListResult.class);
	}
	/**
	 * 获取单个微信用户信息
	 *author:Spiderman
	 * @param openid
	 * @return
	 */
	public static WechatUserResult getUserInfo(String openid){
		String json = HttpUtil.getRequestString(HttpUtil.http_get, fitParam2Url(WechatConstantParamter.getUserInfoUrl).replaceAll("#OPENID#", openid), null, null);
		return BaseUtil.parseJson(json, WechatUserResult.class);
	}
	/**
	 * 获取批量微信用户信息
	 *author:Spiderman
	 * @param userList
	 * @return
	 */
	public static WechatUserListResult getBatchUserInfo(GetBatchUserInfoSend userList){
		return invokeWechatInterface(userList, WechatUserListResult.class, fitParam2Url(WechatConstantParamter.getBatchUserInfoUrl));
	}
	/*************************#微信用户信息******************************/

	/***************************\群发********************/
	/**
	 * 群发预览
	 *author:Spiderman
	 * @param send
	 * @return
	 */
	public static BaseWechatResult messagePreview(Map<String,Object> send){
		return invokeWechatInterface(send, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.messagePreviewUrl));
	}
	/**
	 * 群发
	 *author:Spiderman
	 * @param send
	 * @return
	 */
	public static MassResult massSend(MassSend send){
		if(send.getTouser()!=null){
			return invokeWechatInterface(send, MassResult.class, fitParam2Url(WechatConstantParamter.sendMessageByOpenIdUrl));
		}else{
			return invokeWechatInterface(send, MassResult.class, fitParam2Url(WechatConstantParamter.sendMessageByGroupPreviewUrl));
		}

	}
	/**
	 * 查询群发消息发送状态
	 *author:Spiderman
	 * @param msg_id
	 * @return
	 */
	public static MassSendStatusResult getMassSendStatus(String msg_id){
		Map<String,Object> send=new HashMap<String,Object>();
		send.put("msg_id", msg_id);
		return invokeWechatInterface(send, MassSendStatusResult.class, fitParam2Url(WechatConstantParamter.getMassSendUrl));
	}
	/***************************#群发********************/
	/***************************\新版客服********************/
	/**
	 * 创建会话
	 *author:Spiderman
	 * @param kf_account	完整客服帐号，格式为：帐号前缀@公众号微信号
	 * @param openid	粉丝的openid
	 * @return
	 */
	public static BaseWechatResult kfCreateSession(String kf_account,String openid){
		Map<String,Object> send=new HashMap<String,Object>();
		send.put("kf_account", kf_account);
		send.put("openid", openid);
		return invokeWechatInterface(send, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.kfCreateSessionUrl));
	}
	/**
	 * 关闭会话
	 *author:Spiderman
	 * @param kf_account	完整客服帐号，格式为：帐号前缀@公众号微信号
	 * @param openid	粉丝的openid
	 * @return
	 */
	public static BaseWechatResult kfCloseSession(String kf_account,String openid){
		Map<String,Object> send=new HashMap<String,Object>();
		send.put("kf_account", kf_account);
		send.put("openid", openid);
		return invokeWechatInterface(send, BaseWechatResult.class, fitParam2Url(WechatConstantParamter.kfCloseSessionUrl));
	}
	/***************************#新版客服********************/


	/***************************\私有方法********************/

	/**
	 *
	 * @param objSend
	 * @param clazz
	 * @param url
	 * @return
	 */
	private static <T extends WechatResult> T invokeWechatInterface(Object objSend,Class<T> clazz,String url){
		String requestString = HttpUtil.getRequestString(HttpUtil.http_post, fitParam2Url(url), null, null, BaseUtil.getJson(objSend));
		return BaseUtil.parseJson(requestString, clazz);
	}
	public static String getAttachType(String suffix){
		String lowerCase = suffix.toLowerCase();
		//我***，为兼容jdk1.6,不能用switch
		if (".jpg".equals(lowerCase)
				|| ".jpeg".equals(lowerCase)
				|| ".png".equals(lowerCase)
				|| ".gif".equals(lowerCase)) {
			return "image";
		}else if(".mp4".equals(lowerCase)){
			return "video";
		}else if(".mp3".equals(lowerCase)
				|| ".wma".equals(lowerCase)
				|| ".wav".equals(lowerCase)
				|| ".arm".equals(lowerCase)){
			return "voice";
		}else {
			throw new RuntimeException("暂时不支持上传"+suffix+"格式的素材！！");
		}
	}
}
