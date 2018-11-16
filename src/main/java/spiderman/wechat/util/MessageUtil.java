package spiderman.wechat.util;
  
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import com.thoughtworks.xstream.io.xml.XppDriver;

import spiderman.wechat.domain.receive.MessageReceive;
import spiderman.wechat.domain.receive.ScanCodeInfo;
import spiderman.wechat.domain.receive.SendLocationInfo;
import spiderman.wechat.domain.send.Article;
import spiderman.wechat.domain.send.BaseMessage;
import spiderman.wechat.domain.send.MusicMessage;
import spiderman.wechat.domain.send.NewsMessage;
import spiderman.wechat.domain.send.TextMessage;
  
/** 
 * 消息工具类 
 *  
 * @author 战马 
 */  
public class MessageUtil {  
  
    /** 
     * 返回消息类型：文本 
     */  
    public static final String RESP_MESSAGE_TYPE_TEXT = "text";  
  
    /** 
     * 返回消息类型：音乐 
     */  
    public static final String RESP_MESSAGE_TYPE_MUSIC = "music";  
  
    /** 
     * 返回消息类型：图文 
     */  
    public static final String RESP_MESSAGE_TYPE_NEWS = "news";  
  
    /** 
     * 请求消息类型：文本 
     */  
    public static final String REQ_MESSAGE_TYPE_TEXT = "text";  
  
    /** 
     * 请求消息类型：图片 
     */  
    public static final String REQ_MESSAGE_TYPE_IMAGE = "image";  
  
    /** 
     * 请求消息类型：链接 
     */  
    public static final String REQ_MESSAGE_TYPE_LINK = "link";  
  
    /** 
     * 请求消息类型：地理位置 
     */  
    public static final String REQ_MESSAGE_TYPE_LOCATION = "location";  
  
    /** 
     * 请求消息类型：音频 
     */  
    public static final String REQ_MESSAGE_TYPE_VOICE = "voice";  
  
    /** 
     * 请求消息类型：推送 
     */  
    public static final String REQ_MESSAGE_TYPE_EVENT = "event";  
  
    /** 
     * 事件类型：subscribe(订阅) 
     */  
    public static final String EVENT_TYPE_SUBSCRIBE = "subscribe";  
  
    /** 
     * 事件类型：unsubscribe(取消订阅) 
     */  
    public static final String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";  
  
    /** 
     * 事件类型：CLICK(自定义菜单点击事件) 
     */  
    public static final String EVENT_TYPE_CLICK = "CLICK"; 
    
    private static final XStream messageReciveXStream = getXStream();
    private static final XStream xstream = getXStream();
    static{
    	messageReciveXStream.alias("xml", MessageReceive.class); 
    	messageReciveXStream.alias("ScanCodeInfo", ScanCodeInfo.class);
    	messageReciveXStream.alias("ScanCodeInfo", SendLocationInfo.class);
    }
  
    /** 
     * 解析微信发来的请求（XML） 
     * 过时且获取不到二维码扫描内容，请用getMessageRecive
     * @param request 
     * @return 
     * @throws Exception 
     */  
    @SuppressWarnings("unchecked")  
    @Deprecated
    public static Map<String, String> parseXml(HttpServletRequest request) throws Exception {  
        Map<String, String> map = new HashMap<String, String>();  
        InputStream inputStream = request.getInputStream();  
        SAXReader reader = new SAXReader();  
        Document document = reader.read(inputStream);  
        Element root = document.getRootElement();  
        List<Element> elementList = root.elements();  
        for (Element e : elementList) {
            map.put(e.getName(), e.getText());  
        }
        inputStream.close();  
        inputStream = null;  
  
        return map;  
    }  
    /** 
     * 解析微信发来的请求（XML） 
     *  
     * @param request 
     * @return 
     * @throws IOException 
     * @throws Exception 
     */  
    public static MessageReceive getMessageRecive(HttpServletRequest request) throws IOException{  
    	return (MessageReceive) messageReciveXStream.fromXML(request.getInputStream());
    }  
    
    public static MessageReceive getMessageRecive(String xml) throws IOException{  
    	return (MessageReceive) messageReciveXStream.fromXML(xml);
    }  
      
    /** 
     * 文本消息对象转换成xml 
     *  
     * @param textMessage 文本消息对象 
     * @return xml 
     */  
    public static String textMessageToXml(TextMessage textMessage) {  
        xstream.alias("xml", textMessage.getClass());  
        return xstream.toXML(textMessage);  
    }  
  
    /** 
     * 音乐消息对象转换成xml 
     *  
     * @param musicMessage 音乐消息对象 
     * @return xml 
     */  
    public static String musicMessageToXml(MusicMessage musicMessage) {  
        xstream.alias("xml", musicMessage.getClass());
        return xstream.toXML(musicMessage);
    }  
  
    /** 
     * 图文消息对象转换成xml 
     *  
     * @param newsMessage 图文消息对象 
     * @return xml 
     */  
    public static String newsMessageToXml(NewsMessage newsMessage) {  
        xstream.alias("xml", newsMessage.getClass());  
        xstream.alias("item", Article.class);  
        return xstream.toXML(newsMessage);  
    }  
    public static String toXml(Object obj) {  
    	xstream.alias("xml", obj.getClass()); 
//    	xstream.processAnnotations(obj.getClass()); 
    	return xstream.toXML(obj);
    }  
    
	@SuppressWarnings("unchecked")
	public static <T> T fromXml(String xml,Class<T> class1) { 
    	XStream temp = getXStream();
    	temp.alias("xml", class1);
    	return (T) temp.fromXML(xml);
    }  
    
	public static void fitMessage(MessageReceive messageReceive,BaseMessage baseMessage) {
		baseMessage.setToUserName(messageReceive.getFromUserName());
		baseMessage.setFromUserName(messageReceive.getToUserName());
		baseMessage.setCreateTime(new Date().getTime());
//		baseMessage.setFuncFlag(0);
	} 
	
	
	
	private static XStream getXStream(){
		XStream xStream2 = new XStream(new XppDriver() {  
	        public HierarchicalStreamWriter createWriter(Writer out) {  
	            return new PrettyPrintWriter(out,new XmlFriendlyNameCoder("-_", "_")) {  
	            	/*@Override
	                public void startNode(String name, Class clazz) {  
	                    super.startNode(name, clazz);  
	                }*/
	            	@Override
	                protected void writeText(QuickWriter writer, String text) {  
	                    writer.write("<![CDATA[");  
	                    writer.write(text);  
	                    writer.write("]]>");  
	                }  
	            };  
	        }  
	    });
		xStream2.autodetectAnnotations(true);
		return xStream2;
	}
	
	
}