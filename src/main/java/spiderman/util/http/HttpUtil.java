package spiderman.util.http;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.SSLContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

import spiderman.util.base.StringUtil;

public class HttpUtil {
	public static final int http_get = 0;
	public static final int http_post = 1;
	private static final Logger log = LoggerFactory.getLogger(HttpUtil.class);
	
	
	public static void writeJson(HttpServletResponse response, Object obj){
		ServletOutputStream outputStream;
		try {
			outputStream = response.getOutputStream();
			outputStream.write(StringUtil.getSystemCharacterSetBytes(new Gson().toJson(obj)));
			outputStream.flush();
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	/**
	 * 发送请求,并获取字符串
	 * @param requestType steed.util.http.HttpUtil.http_get(0)或者steed.util.http.HttpUtil.http_post(1)，
	 * 			如为get方式则param应为null
	 * @param url
	 * @param param 可以为null
	 * @param header 可以为null
	 * @return
	 */
	public static byte[] getRequestBytes(int requestType,String url,Map<String, String> param,Map<String, String> header){
		return getRequestBytes(requestType, url, param, header,null);
//		return getRequestString(buildRequest(requestType, url, param, header));
	}
	/**
	 * 发送请求,并获取字符串
	 * @param requestType steed.util.http.HttpUtil.http_get(0)或者steed.util.http.HttpUtil.http_post(1)，
	 * 			如为get方式则param应为null
	 * @param url
	 * @param param 可以为null
	 * @param header 可以为null
	 * @return
	 */
	public static String getRequestString(int requestType,String url,Map<String, String> param,Map<String, String> header){
		return getRequestString(requestType, url, param, header,null);
//		return getRequestString(buildRequest(requestType, url, param, header));
	}
	/**
	 * 发送请求带证书的请求,并获取字符串
	 * @param url
	 * @param param 可以为null
	 * @param header 可以为null
	 * @param certificatePath 证书路径
	 * @return
	 */
	public static String getRequestString(String url,Map<String, String> param,Map<String, String> header,
			String outPutString,String certificatePath,String certificatePassword){
		HttpPost post = (HttpPost) buildRequest(http_post, url, param, header);
		if (outPutString != null) {
			StringEntity entity = new StringEntity(outPutString,StringUtil.getCharacterSet());//解决中文乱码问题    
            entity.setContentEncoding(StringUtil.getCharacterSet());    
            post.setEntity(entity); 
		}
		try {
			return getRequestString(post, getHttpClient(certificatePath, certificatePassword));
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (UnrecoverableKeyException e) {
			e.printStackTrace();
		} catch (KeyStoreException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (CertificateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		throw new RuntimeException("创建带证书https请求出错！！");
	}
	/**
	 * 发送请求,并获取字符串
	 * @param requestType steed.util.http.HttpUtil.http_get(0)或者steed.util.http.HttpUtil.http_post(1)，
	 * 			如为get方式则param,outPutString应为null
	 * @param url
	 * @param param 可以为null
	 * @param header 可以为null
	 * @param outPutString 可以为null
	 * @return
	 */
	public static String getRequestString(int requestType,String url,Map<String, String> param,
			Map<String, String> header,String outPutString){
		HttpRequestBase buildRequest = buildRequest(requestType, url, param, header);
		//TODO 两个entity冲突BUG待修复
		if (outPutString != null) {
			HttpPost post = (HttpPost) buildRequest;
			StringEntity entity = new StringEntity(outPutString,StringUtil.getCharacterSet());//解决中文乱码问题    
            entity.setContentEncoding(StringUtil.getCharacterSet());    
            post.setEntity(entity);
		}
		return getRequestString(buildRequest);
	}
	/**
	 * 发送请求,并获取响应
	 * @param requestType steed.util.http.HttpUtil.http_get(0)或者steed.util.http.HttpUtil.http_post(1)，
	 * 			如为get方式则param,outPutString应为null
	 * @param url
	 * @param param 可以为null
	 * @param header 可以为null
	 * @param outPutString 可以为null
	 * @return
	 */
	public static byte[] getRequestBytes(int requestType,String url,Map<String, String> param,
			Map<String, String> header,String outPutString){
		HttpRequestBase buildRequest = buildRequest(requestType, url, param, header);
		//TODO 两个entity冲突BUG待修复
		if (outPutString != null) {
			HttpPost post = (HttpPost) buildRequest;
			StringEntity entity = new StringEntity(outPutString,StringUtil.getCharacterSet());//解决中文乱码问题    
			entity.setContentEncoding(StringUtil.getCharacterSet());    
			post.setEntity(entity);
		}
		return getRequestBytes(buildRequest);
	}
	/***************post方法开始********************/

	
	
	/***************post方法结束********************/
	
	
	
	/**************get方法开始*************/

	
	/**************get方法结束*************/
	
	
	/*************************私有方法开始********************************************/
	/**
	 * 设置header绕过防盗链
	 * @param requestBase
	 */
	private static void setHotlinkingHeader(HttpRequestBase requestBase){
		URI uri = requestBase.getURI();
		requestBase.setHeader("Host", uri.getHost());
		requestBase.setHeader("Referer",uri.getPath());
	}
	/**
	 * 创建带证书的ssl链接
	 * @param certificatePath 证书路径
	 * @param certificatePassword 证书密码
	 * @return
	 * @throws KeyStoreException
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 * @throws CertificateException
	 * @throws KeyManagementException
	 * @throws UnrecoverableKeyException
	 */
	private static CloseableHttpClient getHttpClient(String certificatePath,String certificatePassword)
			throws KeyStoreException, FileNotFoundException, IOException,
			NoSuchAlgorithmException, CertificateException,
			KeyManagementException, UnrecoverableKeyException {
		KeyStore keyStore  = KeyStore.getInstance("PKCS12");
        FileInputStream instream = new FileInputStream(new File(certificatePath));
        try {
            keyStore.load(instream, certificatePassword.toCharArray());
        } finally {
            instream.close();
        }

        // Trust own CA and all self-signed certs
        SSLContext sslcontext = SSLContexts.custom()
                .loadKeyMaterial(keyStore, certificatePassword.toCharArray())
                .build();
        // Allow TLSv1 protocol only
        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
                sslcontext,
                new String[] { "TLSv1" },
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
        CloseableHttpClient httpclient = HttpClients.custom()
                .setSSLSocketFactory(sslsf)
                .build();
		return httpclient;
	}
	
	
	private static String getRequestString(HttpRequestBase requestBase,CloseableHttpClient httpClient) {
		try {
			CloseableHttpResponse response = httpClient.execute(requestBase);
			HttpEntity entity = response.getEntity();
			String string = EntityUtils.toString(entity, StringUtil.getCharacterSet());
			log.debug("requestString---->{}", new Object[]{string});
			return string;
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	private static byte[] getRequestBytes(HttpRequestBase requestBase,CloseableHttpClient httpClient) {
		try {
			CloseableHttpResponse response = httpClient.execute(requestBase);
			HttpEntity entity = response.getEntity();
			return EntityUtils.toByteArray(entity);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	private static String getRequestString(HttpRequestBase requestBase) {
		return getRequestString(requestBase, HttpClients.createDefault());
	}
	private static byte[] getRequestBytes(HttpRequestBase requestBase) {
		return getRequestBytes(requestBase, HttpClients.createDefault());
	}
	
	private static void setHeader(HttpRequestBase requestBase,Map<String, String> header){
		for(Entry<String, String> e:header.entrySet()){
			requestBase.setHeader(e.getKey(), e.getValue());
		}
	}
	private static void setParam(HttpPost post,Map<String, String> param){
		 List<BasicNameValuePair> formparams = new ArrayList<BasicNameValuePair>();  
		for(Entry<String, String> e:param.entrySet()){
			formparams.add(new BasicNameValuePair(e.getKey(), e.getValue()));
		}
		try {
			UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(formparams,StringUtil.getCharacterSet());
			post.setEntity(urlEncodedFormEntity);
//			post.setEntity(new UrlEncodedFormEntity(formparams));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	}
	
	public static HttpRequestBase buildRequest(int requestType,String url,Map<String, String> param,Map<String, String> header){
		HttpRequestBase requestBase;
		switch (requestType) {
			case http_get:
				requestBase = new HttpGet(url);
				break;
			case http_post:
				requestBase = new HttpPost(url);
				break;
			default:
				throw new RuntimeException("requestType只能是steed.util.http.HttpUtil.http_post或steed.util.http.HttpUtil.http_get!!!!");
		}
		
		setHotlinkingHeader(requestBase);
		
		if (param != null) {
			setParam((HttpPost) requestBase, param);
		}
		if (header != null) {
			setHeader(requestBase, header);
		}
		
		return requestBase;
	}
	
	/*************************私有方法结束********************************************/
	
	
}
