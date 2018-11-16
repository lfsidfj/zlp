package com.szjm.controller.weixin.weixinmsg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spiderman.util.base.BaseUtil;
import spiderman.wechat.domain.receive.MessageReceive;
import spiderman.wechat.domain.send.Article;
import spiderman.wechat.domain.send.BaseMessage;
import spiderman.wechat.domain.send.Image;
import spiderman.wechat.domain.send.ImageMessage;
import spiderman.wechat.domain.send.Music;
import spiderman.wechat.domain.send.MusicMessage;
import spiderman.wechat.domain.send.NewsMessage;
import spiderman.wechat.domain.send.TextMessage;
import spiderman.wechat.domain.send.Video;
import spiderman.wechat.domain.send.VideoMessage;
import spiderman.wechat.domain.send.Voice;
import spiderman.wechat.domain.send.VoiceMessage;
import spiderman.wechat.util.MessageUtil;
import spiderman.wechat.util.SignUtil;

import com.szjm.controller.base.BaseController;
/**
 * 接收微信消息
 * @author spiderman
 * 2017年5月12日下午2:12:10
 */
@Controller
@RequestMapping(value="/weixin")
public class WeixinReceiverController extends BaseController {

	@RequestMapping(value="index1")
	public void index(
			 PrintWriter out,
			 HttpServletRequest request,
			 HttpServletResponse response) throws IOException{
        String echostr = request.getParameter("echostr");
        System.out.println(this.getPageData());
        if(echostr!=null){/*处理微信认证*/
            if (SignUtil.checkSignature(request)) {
                out.print(echostr);
                System.out.println("验证成功");
            }else{
            	out.print(echostr);
            	System.out.println("验证失败");
            }
            out.flush();
            out.close();
        }else{/*处理用户的数据*/
        	// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
        	System.out.println("处理用户的数据");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            // 调用核心业务类接收消息、处理消息
            MessageReceive messageReceive = MessageUtil.getMessageRecive(request);
            System.out.println("收到-》"+BaseUtil.getJson(messageReceive));
            String result="";
            if(messageReceive.getMsgType().equals("text")){
            	if("图文".equals(messageReceive.getContent())){
            		List<Article> articles=new ArrayList<Article>();
                    for(int i=0;i<6;i++){
                        Article article=new Article();
                        article.setTitle("有大事件发生"+i);
                        article.setPicUrl("http://img0.imgtn.bdimg.com/it/u=4195805644,827754888&fm=23&gp=0.jpg");
                        article.setUrl("http://baike.baidu.com/link?url=esr5D6inycwHgB_UCkJjZhFA635adKG59j4_Mhn13cXVPiAVAsz7Kvpd2Xw8taq9G0g-76sdFIEWq8aWCtBOcJRYuw-v-NJfQ-XZSNQGPS3");
                        article.setDescription("这是描述，我就不多说了");
                        articles.add(article);
                    }
                    NewsMessage respMessage=new NewsMessage();
                    respMessage.setArticles(articles);
                    respMessage.setArticleCount(articles.size());
                    respMessage.setFromUserName(messageReceive.getToUserName());
                    respMessage.setToUserName(messageReceive.getFromUserName());
                    respMessage.setCreateTime(System.currentTimeMillis());
                    result=MessageUtil.newsMessageToXml(respMessage);
            	}else if("音乐".equals(messageReceive.getContent())){
            		Music music=new Music();
            		//music.setTitle("水手");
            		//music.setDescription("这是水手歌曲");
            		//music.setMusicUrl("http://www.w3school.com.cn/i/horse.mp3");
            		music.setThumbMediaId("tAkdUPRgd2vsBGxjsXV0JYbJLhiy0S0Uq7CGwVCL2s8bXa2rXSVRFUL8kggwBeSg");
            		MusicMessage respMessage=new MusicMessage();
            		respMessage.setMusic(music);
                    respMessage.setFromUserName(messageReceive.getToUserName());
                    respMessage.setToUserName(messageReceive.getFromUserName());
                    respMessage.setCreateTime(System.currentTimeMillis());
                    result=MessageUtil.musicMessageToXml(respMessage);
            	}else if("我要找小美".equals(messageReceive.getContent())){
            		BaseMessage respMessage=new BaseMessage();
            		respMessage.setCreateTime(System.currentTimeMillis());
            		respMessage.setFromUserName(messageReceive.getToUserName());
            		respMessage.setToUserName(messageReceive.getFromUserName());
            		respMessage.setMsgType("transfer_customer_service");
                    result=MessageUtil.toXml(respMessage);
            	}else{
                	TextMessage respMessage=new TextMessage();
                    respMessage.setContent("hello world!");
                    respMessage.setFromUserName(messageReceive.getToUserName());
                    respMessage.setToUserName(messageReceive.getFromUserName());
                    respMessage.setCreateTime(System.currentTimeMillis());
                    result=MessageUtil.toXml(respMessage);
            	}
            }else if(messageReceive.getMsgType().equals("image")){
            	ImageMessage respMessage=new ImageMessage();
                Image image=new Image();
                image.setMediaId("aXk2p0coo3bjQIU8GAwpETCYEMsUS-XIvkz_wdToX_grSOP4-h4erNRyC-T0_OYI");
                respMessage.setImage(image);
                respMessage.setFromUserName(messageReceive.getToUserName());
                respMessage.setToUserName(messageReceive.getFromUserName());
                respMessage.setCreateTime(System.currentTimeMillis());
                result=MessageUtil.toXml(respMessage);
            }else if(messageReceive.getMsgType().equals("voice")){
            	VoiceMessage respMessage=new VoiceMessage();
                Voice voice=new Voice();
                voice.setMediaId("w2_D_5Mz4klb_GtWDGPjeJexicJh9mvUzq1W4h_n-SUTZgx3POzxWzJdRdCoaj80");
                respMessage.setVoice(voice);
                respMessage.setFromUserName(messageReceive.getToUserName());
                respMessage.setToUserName(messageReceive.getFromUserName());
                respMessage.setCreateTime(System.currentTimeMillis());
                result=MessageUtil.toXml(respMessage);
            }else if(messageReceive.getMsgType().equals("video")||messageReceive.getMsgType().equals("shortvideo")){
            	Video video=new Video();
                video.setTitle("动物世界");
                video.setMediaId("Lk0bZflmkKosJS558uZ6-uaxqRb3QLFxa-2FVxisrcvX5xUOLNzEAT5FK4VKNo_1");
                video.setDescription("就这么神奇");
                VideoMessage respMessage=new VideoMessage();
                respMessage.setVideo(video);
                respMessage.setFromUserName(messageReceive.getToUserName());
                respMessage.setToUserName(messageReceive.getFromUserName());
                respMessage.setCreateTime(System.currentTimeMillis());
                result=MessageUtil.toXml(respMessage);
            }else if(messageReceive.getMsgType().equals("location")){
            	TextMessage respMessage=new TextMessage();
                respMessage.setContent("经度："+messageReceive.getLocation_Y()+"，纬度："+messageReceive.getLocation_X());
                respMessage.setFromUserName(messageReceive.getToUserName());
                respMessage.setToUserName(messageReceive.getFromUserName());
                respMessage.setCreateTime(System.currentTimeMillis());
                result=MessageUtil.toXml(respMessage);
            }else if(messageReceive.getMsgType().equals("link")){
            	TextMessage respMessage=new TextMessage();
                respMessage.setContent("标题："+messageReceive.getTitle()+"，描述："+messageReceive.getDescription()+"，链接："+messageReceive.getUrl());
                respMessage.setFromUserName(messageReceive.getToUserName());
                respMessage.setToUserName(messageReceive.getFromUserName());
                respMessage.setCreateTime(System.currentTimeMillis());
                result=MessageUtil.toXml(respMessage);
            }else if(messageReceive.getMsgType().equals("event")){
            	TextMessage respMessage=new TextMessage();
                respMessage.setFromUserName(messageReceive.getToUserName());
                respMessage.setToUserName(messageReceive.getFromUserName());
                respMessage.setCreateTime(System.currentTimeMillis());
            	if(messageReceive.getEvent().equals("subscribe")){
                    respMessage.setContent("欢迎"+messageReceive.getFromUserName()+"关注");
            	}else if(messageReceive.getEvent().equals("unsubscribe")){
            		respMessage.setContent("欢迎"+messageReceive.getFromUserName()+"取消关注");
            	}else if(messageReceive.getEvent().equals("SCAN")){
            		respMessage.setContent(messageReceive.getEventKey());
            	}else if(messageReceive.getEvent().equals("LOCATION")){
            		respMessage.setContent("纬度："+messageReceive.getLatitude()+"，经度："+messageReceive.getLongitude());
            	}else{
            		respMessage.setContent(BaseUtil.getJson(messageReceive));
            	}
                result=MessageUtil.toXml(respMessage);
            }
            /*********************文本*****************************/
            /*TextMessage respMessage=new TextMessage();
            respMessage.setContent("hello world!");*/

            /*********************图文*****************************/
            /*List<Article> articles=new ArrayList<Article>();
            for(int i=0;i<6;i++){
                Article article=new Article();
                article.setTitle("有大事件发生"+i);
                article.setPicUrl("http://img0.imgtn.bdimg.com/it/u=4195805644,827754888&fm=23&gp=0.jpg");
                article.setUrl("http://baike.baidu.com/link?url=esr5D6inycwHgB_UCkJjZhFA635adKG59j4_Mhn13cXVPiAVAsz7Kvpd2Xw8taq9G0g-76sdFIEWq8aWCtBOcJRYuw-v-NJfQ-XZSNQGPS3");
                article.setDescription("这是描述，我就不多说了");
                articles.add(article);
            }
            NewsMessage respMessage=new NewsMessage();
            respMessage.setArticles(articles);
            respMessage.setArticleCount(articles.size());*/

            /*********************回复图片消息*****************************/
            /*ImageMessage respMessage=new ImageMessage();
            Image image=new Image();
            image.setMediaId("aXk2p0coo3bjQIU8GAwpETCYEMsUS-XIvkz_wdToX_grSOP4-h4erNRyC-T0_OYI");
            respMessage.setImage(image);*/

            /*********************回复语音消息*****************************/
            /*VoiceMessage respMessage=new VoiceMessage();
            Voice voice=new Voice();
            voice.setMediaId("w2_D_5Mz4klb_GtWDGPjeJexicJh9mvUzq1W4h_n-SUTZgx3POzxWzJdRdCoaj80");
            respMessage.setVoice(voice);*/

            /*********************回复视频消息*****************************/

            /*Video video=new Video();
            video.setTitle("动物世界");
            video.setMediaId("Lk0bZflmkKosJS558uZ6-uaxqRb3QLFxa-2FVxisrcvX5xUOLNzEAT5FK4VKNo_1");
            video.setDescription("就这么神奇");
            VideoMessage respMessage=new VideoMessage();
            respMessage.setVideo(video);*/

            /*respMessage.setFromUserName(messageReceive.getToUserName());
            respMessage.setToUserName(messageReceive.getFromUserName());
            respMessage.setCreateTime(System.currentTimeMillis());*/

            //String result=MessageUtil.toXml(respMessage);
            System.out.println("返回-》"+result);
            out.print(result);
            out.flush();
            out.close();
        }
	}
}
