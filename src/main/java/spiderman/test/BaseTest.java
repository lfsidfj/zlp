package spiderman.test;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import spiderman.alipay.util.AlipayInterfaceInvokeUtil;
import spiderman.util.base.BaseUtil;
import spiderman.util.base.CommUtil;
import spiderman.util.base.OSSUtil;
import spiderman.util.digest.Base64;
import spiderman.wechat.config.WechatConfig;
import spiderman.wechat.domain.param.Article;
import spiderman.wechat.domain.param.ArticleList;
import spiderman.wechat.domain.param.Button;
import spiderman.wechat.domain.param.CompanyPayQuerySend;
import spiderman.wechat.domain.param.CompanyPaySend;
import spiderman.wechat.domain.param.CustomSend;
import spiderman.wechat.domain.param.GetBatchUserInfoSend;
import spiderman.wechat.domain.param.GetBatchUserInfoSend.User;
import spiderman.wechat.domain.param.KFAccount;
import spiderman.wechat.domain.param.MassSend;
import spiderman.wechat.domain.param.Menu;
import spiderman.wechat.domain.param.MideaListSend;
import spiderman.wechat.domain.param.RedPacketSend;
import spiderman.wechat.domain.param.RefundQuerySend;
import spiderman.wechat.domain.param.RefundSend;
import spiderman.wechat.domain.param.UnifiedOrderSend;
import spiderman.wechat.domain.param.UpdateNewsSend;
import spiderman.wechat.domain.result.AttachUploadResult;
import spiderman.wechat.domain.result.BaseWechatResult;
import spiderman.wechat.domain.result.CompanyPayQueryResult;
import spiderman.wechat.domain.result.CompanyPayResult;
import spiderman.wechat.domain.result.MassResult;
import spiderman.wechat.domain.result.MassSendStatusResult;
import spiderman.wechat.domain.result.MideaCountResult;
import spiderman.wechat.domain.result.MideaListResult;
import spiderman.wechat.domain.result.NewsListResult;
import spiderman.wechat.domain.result.PermanentAttachUploadResult;
import spiderman.wechat.domain.result.RedPacketResult;
import spiderman.wechat.domain.result.RefundQueryResult;
import spiderman.wechat.domain.result.RefundResult;
import spiderman.wechat.domain.result.UnifiedOrderResult;
import spiderman.wechat.domain.result.UserListResult;
import spiderman.wechat.domain.result.WechatUserListResult;
import spiderman.wechat.domain.result.WechatUserResult;
import spiderman.wechat.domain.send.Image;
import spiderman.wechat.domain.send.ImageMessage;
import spiderman.wechat.util.MessageUtil;
import spiderman.wechat.util.SignUtil;
import spiderman.wechat.util.WechatInterfaceInvokeUtil;

import com.alipay.api.AlipayApiException;
import com.szjm.util.Tools;
import com.szjm.util.lsh.BirthdayUtil;

public class BaseTest {
	@Test
	public void test1(){
		try {
			System.out.println(Base64.encode("spiderman".getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	public void test2(){
		AttachUploadResult result=WechatInterfaceInvokeUtil.uploadAttach("D://ttt.jpg",false);
		System.out.println(result.getMedia_id());
	}
	@Test
	public void test3(){
		String result=WechatInterfaceInvokeUtil.downLoadMidea("7XJqZ6peKr4qdWqXvn48bYqzJPIIdY0QyPVH8_EOFAie1aHO58g-TxbzPaS87n1P");
		System.out.println(result);
	}
	@Test
	public void test4(){
		PermanentAttachUploadResult result=WechatInterfaceInvokeUtil.uploadPermanentOthers("D://aaa.jpg");
		System.out.println(result.getMedia_id()+result.getUrl()+result.getErrmsg());
		/*ArticleList articles=new ArticleList();
		for(int i=0;i<5;i++){
			Article article=new Article();
			article.setTitle("");
			article
		}
		WechatInterfaceInvokeUtil.uploadNews(articleList);*/
	}
	@Test
	public void test5(){
		CompanyPaySend companyPaySend=new CompanyPaySend();
		companyPaySend.setPartner_trade_no("20170510000002");
		companyPaySend.setOpenid("omxe4s1e2Zc6NQKNULznI238eh0E");
		companyPaySend.setCheck_name("NO_CHECK");
		companyPaySend.setAmount(100);
		companyPaySend.setDesc("企业付款测试之1");
		companyPaySend.setSpbill_create_ip("127.0.0.1");
		CompanyPayResult result=WechatInterfaceInvokeUtil.companyPay(companyPaySend);
		System.out.println(result.isSuccess());
	}
	@Test
	public void test6(){
		RedPacketSend redPacketSend=new RedPacketSend();
		redPacketSend.setMch_billno("202837894");
		redPacketSend.setSend_name("Spiderman超市");
		redPacketSend.setRe_openid("omxe4s1e2Zc6NQKNULznI238eh0E");
		redPacketSend.setTotal_amount(100);
		redPacketSend.setTotal_num(1);
		redPacketSend.setWishing("祝早日脱单");
		redPacketSend.setClient_ip("127.0.0.1");
		redPacketSend.setAct_name("11.11");
		redPacketSend.setRemark("哈哈");
		RedPacketResult result=WechatInterfaceInvokeUtil.sendRedPacket(redPacketSend);
		System.out.println(result.isSuccess());
	}
	@Test
	public void test7(){
		Menu menu=WechatInterfaceInvokeUtil.getMenu();
		System.out.println(menu);
	}
	@Test
	public void test8(){
		System.out.println(SignUtil.checkSignature("297c64a19b616236f71aa234f6411181d1b8c183", "1494392084", "379610216", WechatConfig.token));
	}
	/**
	 * 上传临时文件
	 */
	@Test
	public void test9(){
		AttachUploadResult result=WechatInterfaceInvokeUtil.uploadAttach("D://horse.mp3",false);
		System.out.println("id："+result.getMedia_id()+"类型："+result.getType()+"tempid："+result.getThumb_media_id());
	}
	@Test
	public void test10(){
		ImageMessage respMessage=new ImageMessage();
        Image image=new Image();
        image.setMediaId("aXk2p0coo3bjQIU8GAwpETCYEMsUS-XIvkz_wdToX_grSOP4-h4erNRyC-T0_OYI");
        respMessage.setImage(image);
        respMessage.setCreateTime(System.currentTimeMillis());

        String result=MessageUtil.toXml(respMessage);
        System.out.println(result);
	}
	@Test
	public void test11(){
		WechatInterfaceInvokeUtil.downLoadMidea("tAkdUPRgd2vsBGxjsXV0JYbJLhiy0S0Uq7CGwVCL2s8bXa2rXSVRFUL8kggwBeSg");
	}
	@Test
	public void test12(){
		PermanentAttachUploadResult result=WechatInterfaceInvokeUtil.uploadPermanentOthers("D://ttt.jpg");
		System.out.println("id："+result.getMedia_id()+"类型："+result.getUrl());
	}
	@Test
	public void test13(){
		List<Button> buttonList=new ArrayList<Button>();

		Button button=new Button();
		button.setType("scancode_waitmsg");
		button.setName("扫码带提示");
		button.setKey("1");

		Button button2=new Button();
		button2.setType("scancode_push");
		button2.setName("扫码推事件");
		button2.setKey("2");
		buttonList.add(button);
		buttonList.add(button2);
		Menu menu=new Menu();
		menu.setButton(buttonList);
		BaseWechatResult result=WechatInterfaceInvokeUtil.setMenu(menu);
		System.out.println(result.isSuccess());
	}
	@Test
	public void test14(){
		KFAccount account=new KFAccount();
		account.setKf_account("xiaomei@szjiemai");
		account.setNickname("xiaomei");
		account.setPassword("123456");
		WechatInterfaceInvokeUtil.createKFAccount(account);
	}
	/**
	 * 客服文本
	 */
	@Test
	public void test15(){
		CustomSend content=new CustomSend();
		content.setTouser("omxe4s1e2Zc6NQKNULznI238eh0E");
		CustomSend.Text text=content.new Text();
		text.setContent("你真的好帅");
		content.setText(text);
		WechatInterfaceInvokeUtil.coustomSend(content);
	}
	/**
	 * 客服图片
	 */
	@Test
	public void test16(){
		CustomSend content=new CustomSend();
		content.setTouser("omxe4s1e2Zc6NQKNULznI238eh0E");
		CustomSend.Image image=content.new Image();
		image.setMedia_id("aXk2p0coo3bjQIU8GAwpETCYEMsUS-XIvkz_wdToX_grSOP4-h4erNRyC-T0_OYI");
		content.setImage(image);
		WechatInterfaceInvokeUtil.coustomSend(content);
	}
	/**
	 * 客服音频
	 */
	@Test
	public void test17(){
		CustomSend content=new CustomSend();
		content.setTouser("omxe4s1e2Zc6NQKNULznI238eh0E");
		CustomSend.Voice voice=content.new Voice();
		voice.setMedia_id("w2_D_5Mz4klb_GtWDGPjeJexicJh9mvUzq1W4h_n-SUTZgx3POzxWzJdRdCoaj80");
		content.setVoice(voice);
		WechatInterfaceInvokeUtil.coustomSend(content);
	}
	/**
	 * 客服视频
	 */
	@Test
	public void test18(){
		CustomSend content=new CustomSend();
		content.setTouser("omxe4s1e2Zc6NQKNULznI238eh0E");
		CustomSend.Video video=content.new Video();
		video.setMedia_id("Lk0bZflmkKosJS558uZ6-uaxqRb3QLFxa-2FVxisrcvX5xUOLNzEAT5FK4VKNo_1");
		video.setDescription("神奇");
		video.setTitle("动物世界");
		content.setVideo(video);
		WechatInterfaceInvokeUtil.coustomSend(content);
	}
	/**
	 * 发送图文
	 */
	@Test
	public void test19(){
		CustomSend content=new CustomSend();
		content.setTouser("omxe4s1e2Zc6NQKNULznI238eh0E");
		List<CustomSend.Article> articleList=new ArrayList<CustomSend.Article>();
		for(int i=0;i<1;i++){
			CustomSend.Article article=content.new Article();
			article.setTitle("有大事件发生");
			article.setPicurl("http://img0.imgtn.bdimg.com/it/u=4195805644,827754888&fm=23&gp=0.jpg");
			article.setDescription("这是描述，我就不多说了");
			article.setUrl("http://baike.baidu.com/link?url=esr5D6inycwHgB_UCkJjZhFA635adKG59j4_Mhn13cXVPiAVAsz7Kvpd2Xw8taq9G0g-76sdFIEWq8aWCtBOcJRYuw-v-NJfQ-XZSNQGPS3");
			articleList.add(article);
		}
		CustomSend.News news=content.new News();
		news.setArticles(articleList);
		content.setNews(news);
		WechatInterfaceInvokeUtil.coustomSend(content);
	}
	/**
	 * 退款
	 */
	@Test
	public void test20(){
		RefundSend send=new RefundSend();
		send.setOut_trade_no("20170602000001");
		send.setOut_refund_no("20170601000014");
		send.setTotal_fee(1);
		send.setRefund_fee(1);
		RefundResult result=WechatInterfaceInvokeUtil.refund(send);
		if(result.isSuccess()){
			System.out.println("SUCCESS");
		}else{
			System.out.println("FAILSE");
		}
	}
	@Test
	public void test21(){
		RefundQuerySend send=new RefundQuerySend();
		send.setOut_refund_no("20170601000014");
		RefundQueryResult result=WechatInterfaceInvokeUtil.refundQuery(send);
		if(result.isSuccess()){
			System.out.println("SUCCESS");
		}else{
			System.out.println("FAILSE");
		}
	}
	@Test
	public void test22(){
		CompanyPayQuerySend send=new CompanyPayQuerySend();
		send.setPartner_trade_no("20170325000007");
		CompanyPayQueryResult result=WechatInterfaceInvokeUtil.companyPayQuery(send);
		if(result.isSuccess()){
			System.out.println("SUCCESS");
		}else{
			System.out.println("FAILSE");
		}
	}
	/**
	 * 上传图文消息
	 *author:Spiderman
	 */
	@Test
	public void test23(){
		ArticleList articleList=new ArticleList();
		List<Article> articles=new ArrayList<Article>();
		Article article=new Article();
		article.setAuthor("xx");
		article.setContent("党的十八大以来，短短5年，在我军90年光辉历程中如此厚重、极不平凡——党在新形势下的强军目标鲜明确立，政治建军深入推进，练兵备战紧锣密鼓，改革攻坚大刀阔斧，正风肃纪雷霆万钧……习主席领导和指引人民军队全面重塑、浴火重生，在强军兴军征程上迈出历史性步伐。");
		article.setContent_source_url("https://www.baidu.com/index.php?tn=monline_3_dg");
		article.setDigest("bdsfd");
		article.setShow_cover_pic("0");
		article.setThumb_media_id("ww2E5UxkP8-vK-_cBZQKlxzH2m8zn6tvz2Kq-injOAM");
		article.setTitle("加格达奇");
		articles.add(article);
		articles.add(article);
		articles.add(article);
		articles.add(article);
		articles.add(article);
		articles.add(article);
		articles.add(article);
		articles.add(article);
		articleList.setArticles(articles);
		System.out.println(WechatInterfaceInvokeUtil.uploadPermanentNews(articleList));
	}
	@Test
	public void test24(){
		WechatInterfaceInvokeUtil.downLoadPermanentMidea("ww2E5UxkP8-vK-_cBZQKl2chfe68EXLR1WjWOQ6fAEY");
	}
	/**
	 * 删除永入素材
	 *author:Spiderman
	 */
	@Test
	public void test25(){
		WechatInterfaceInvokeUtil.deletePermanentMidea("ww2E5UxkP8-vK-_cBZQKl2chfe68EXLR1WjWOQ6fAEY");
	}
	/**
	 * 修改永久图文素材
	 *author:Spiderman
	 */
	@Test
	public void test26(){
		UpdateNewsSend news=new UpdateNewsSend();
		Article article=new Article();
		article.setAuthor("xx");
		article.setContent("mmmmmmmmmm党的十八大以来，短短5年，在我军90年光辉历程中如此厚重、极不平凡——党在新形势下的强军目标鲜明确立，政治建军深入推进，练兵备战紧锣密鼓，改革攻坚大刀阔斧，正风肃纪雷霆万钧……习主席领导和指引人民军队全面重塑、浴火重生，在强军兴军征程上迈出历史性步伐。");
		article.setContent_source_url("https://www.baidu.com/index.php?tn=monline_3_dg");
		article.setDigest("bdsfd");
		article.setShow_cover_pic("0");
		article.setThumb_media_id("ww2E5UxkP8-vK-_cBZQKlxzH2m8zn6tvz2Kq-injOAM");
		article.setTitle("5555555加格达奇");
		news.setArticles(article);
		news.setIndex("1");
		news.setMedia_id("ww2E5UxkP8-vK-_cBZQKl0cAiI07tyVTfqeffcViV2U");
		WechatInterfaceInvokeUtil.updatePermanentMidea(news);
	}
	/**
	 * 获取永久素材总数
	 *author:Spiderman
	 */
	@Test
	public void test27(){
		MideaCountResult result=WechatInterfaceInvokeUtil.getPermanentMideaCount();
		BaseUtil.outJson(result);
	}
	/**
	 * 获取永久素材总数
	 *author:Spiderman
	 */
	@Test
	public void test28(){
		MideaListSend send=new MideaListSend();
		send.setType("news");
		send.setOffset(0);
		send.setCount(5);
		MideaListResult result=WechatInterfaceInvokeUtil.getPermanentMideaList(send);
		BaseUtil.outJson(result);
	}
	/**
	 * 上传图文消息内的图片
	 *author:Spiderman
	 */
	@Test
	public void test29(){
		Map<String,Object> result=WechatInterfaceInvokeUtil.uploadNewsImg("D://aaa.jpg");
		BaseUtil.outJson(result);
	}
	/**
	 * 下载图文
	 *author:Spiderman
	 */
	@Test
	public void test30(){
		NewsListResult result=WechatInterfaceInvokeUtil.downLoadPermanentNews("ww2E5UxkP8-vK-_cBZQKlxptJHnxuzMRD-vU2kit7wI");
		BaseUtil.outJson(result);
	}
	/**
	 * 获取微信列表
	 *author:Spiderman
	 */
	@Test
	public void test31(){
		UserListResult result=WechatInterfaceInvokeUtil.getUserList("");
		BaseUtil.outJson(result);
	}
	/**
	 * 获取单个微信用户信息
	 *author:Spiderman
	 */
	@Test
	public void test32(){
		WechatUserResult result=WechatInterfaceInvokeUtil.getUserInfo("oi5mvwdFbYwPU_HFzSA6DDsa4MEQ");
		BaseUtil.outJson(result);
	}
	/**
	 * 获得批量用户信息
	 *author:Spiderman
	 */
	@Test
	public void test33(){
		GetBatchUserInfoSend send=new GetBatchUserInfoSend();
		List<User> user_list=new ArrayList<User>();
		GetBatchUserInfoSend.User user=send.new User();
		user.setOpenid("oi5mvwdFbYwPU_HFzSA6DDsa4MEQ");
		user_list.add(user);
		send.setUser_list(user_list);
		WechatUserListResult result=WechatInterfaceInvokeUtil.getBatchUserInfo(send);
		BaseUtil.outJson(result);
	}
	@Test
	public void test34(){
		Map<String,Object> media_id=new HashMap<String,Object>();
		media_id.put("media_id", "ww2E5UxkP8-vK-_cBZQKl5PhaXtpr1csEhiHiER9N1w");
		Map<String,Object> send=new HashMap<String,Object>();
		send.put("mpnews", media_id);
		send.put("touser", "oi5mvwdFbYwPU_HFzSA6DDsa4MEQ");
		send.put("msgtype", "mpnews");
		BaseWechatResult result=WechatInterfaceInvokeUtil.messagePreview(send);
		BaseUtil.outJson(result);
	}
	/**
	 * 群发
	 *author:Spiderman
	 */
	@Test
	public void test35(){
		MassSend send=new MassSend();
		List<String> touser=new ArrayList<String>();
		touser.add("oi5mvwQ82qWpGvkAygrqW4hZ3sZQ");
		touser.add("oi5mvwRYF41wpRVFI5Z5E1ExCPEA");
		send.setTouser(touser);
		MassSend.Mpnews mpnews=send.new Mpnews();
		mpnews.setMedia_id("ww2E5UxkP8-vK-_cBZQKl5PhaXtpr1csEhiHiER9N1w");
		send.setMpnews(mpnews);
		send.setClientmsgid("xxcc");
		MassResult result=WechatInterfaceInvokeUtil.massSend(send);
		BaseUtil.outJson(result);
	}
	/**
	 * 群发状态查询
	 *author:Spiderman
	 */
	@Test
	public void test36(){
		MassSendStatusResult result=WechatInterfaceInvokeUtil.getMassSendStatus("3147483658");
		BaseUtil.outJson(result);
	}
	/**
	 * 创建会话
	 *author:Spiderman
	 */
	@Test
	public void test37(){
		BaseWechatResult result=WechatInterfaceInvokeUtil.kfCreateSession("xiaomei@szjiemai", "oi5mvwQ82qWpGvkAygrqW4hZ3sZQ");
		BaseUtil.outJson(result);
	}
	/**
	 * 关闭会话
	 *author:Spiderman
	 */
	@Test
	public void test38(){
		BaseWechatResult result=WechatInterfaceInvokeUtil.kfCloseSession("xiaomei@szjiemai", "oi5mvwQ82qWpGvkAygrqW4hZ3sZQ");
		BaseUtil.outJson(result);
	}
	@Test
	public void test39(){
		UnifiedOrderSend send=new UnifiedOrderSend();
		send.setBody("xfd");
		send.setOpenid("x");
		send.setOut_trade_no("201705000111");
		send.setTotal_fee(1);
		send.setSpbill_create_ip("127.0.0.1");
		send.setNotify_url("http:xxxx");
		send.setTrade_type("JSAPI");
		UnifiedOrderResult result=WechatInterfaceInvokeUtil.unifiedOrder(send);//kfCloseSession("xiaomei@szjiemai", "oi5mvwQ82qWpGvkAygrqW4hZ3sZQ");
		BaseUtil.outJson(result);
	}
	@Test
	public void test40(){
		//OSSUtil.uploadFile("FDF/2331.txt", new File("D:\\231.txt"));
		System.out.println(OSSUtil.getFileUrl("FDF/2331.txt"));
	}
	@Test
	public void test41(){
		//OSSUtil.uploadFile("FDF/2331.txt", new File("D:\\231.txt"));
		try {
			//System.out.println(AlipayInterfaceInvokeUtil.AlipayFundTransToaccountTransfer("201807201552", "ALIPAY_LOGONID", "13790445950", "0.01", "有限公司", "陈", "转账"));
			System.out.println(AlipayInterfaceInvokeUtil.AlipayTradeRefund("2018072010032004520297375244", "2018072010032004520297375244", "0.01", "作图", "201807201621"));
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	public void test42(){
		//OSSUtil.uploadFile("FDF/2331.txt", new File("D:\\231.txt"));
		BigDecimal decimal = new BigDecimal("1.12345");
        System.out.println(decimal);
        BigDecimal setScale = decimal.setScale(4,BigDecimal.ROUND_HALF_DOWN);
        System.out.println(setScale);

        BigDecimal setScale1 = decimal.setScale(4,BigDecimal.ROUND_HALF_UP);
        System.out.println(setScale1);

        BigDecimal setScale2 = decimal.setScale(4,BigDecimal.ROUND_UP);
        System.out.println(setScale2);
	}
	@Test
	public void test43(){
		try {
			String solar_birthday = "2018-08-25";//"1980-04-03";//选择的新历生日
			String lunarBirthday = BirthdayUtil.getLunarBirthday(solar_birthday);//通过新历生日获取农历生日
			System.out.println("农历生日"+lunarBirthday);
			String nextSolarBirthday;
			nextSolarBirthday = BirthdayUtil.getNextSolarBirthday(solar_birthday);//下一次新历日期
			System.out.println("下一次新历日期"+nextSolarBirthday);
			String nextLunarBirthday = BirthdayUtil.getNextLunarBirthday(solar_birthday);//下一次农历新历日期
			System.out.println("下一次农历新历日期"+nextLunarBirthday);
			int solarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextSolarBirthday);//下一次新历生日天数
			System.out.println("下一次新历生日天数"+solarBetween);
			int lunarBetween = BirthdayUtil.daysBetween(Tools.date2Str(new Date()),nextLunarBirthday);//下一次农历生日
			System.out.println("下一次农历历生日天数"+lunarBetween);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
