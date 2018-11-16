package spiderman.util.base;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import spiderman.domain.GlobalParam;
import spiderman.exception.BaseException;
import spiderman.exception.PathIsTopException;
import spiderman.exception.runtime.BaseRuntimeException;


public class PathUtil {

	/**
	 * 获取classes目录在操作系统中的绝对路径 形如D:/workspaces/SMS/WebRoot/WEB-INF/classes/
	 * @return
	 */
	public static String getClassesPath(){
		return PathUtil.class.getResource("/").getPath();
	}
	/**
	 * 获取项目路径
	 * @return
	 */
	public static String getContextPath(){
		return GlobalParam.FOLDER.contextPath;
	}
	/**
	 * 合并路径,防止出现双斜杠或者没有斜杠
	 * @return
	 */
	public static String mergePath(String path1,String path2){
		return mergePath(path1, path2, "/");
	}
	
	public static String mergePath(String path1,String path2,String separator){
		if (path2.startsWith(separator)&&path1.endsWith(separator)) {
			return path1 + path2.substring(1);
		}else if(!path2.startsWith(separator)&&!path1.endsWith(separator)){
			return path1 + separator + path2;
		}else {
			return path1 + path2;
		}
	}
	/**
	 * 获取浏览器能访问到的路径
	 * @return
	 */
	public static String getBrowserPath(String resouresRelativePath){
		/*if (resouresRelativePath.startsWith("/")&&GlobalParam.FOLDER.contextUrl.endsWith("/")) {
			return GlobalParam.FOLDER.contextUrl + resouresRelativePath.substring(1);
		}else if (!resouresRelativePath.startsWith("/")&&!GlobalParam.FOLDER.contextUrl.endsWith("/")) {
			return GlobalParam.FOLDER.contextUrl + "/" + resouresRelativePath;
		}*/
		return mergePath(GlobalParam.FOLDER.contextUrl, resouresRelativePath);
	}
	/**
	 * 获取工程根目录,特殊情况获取不到
	 * @return
	 */
	public static String getProjectPath(){
		try {
			return getParaentPath(getClassesPath());
		} catch (BaseException e) {
			e.printStackTrace();
			throw new BaseRuntimeException("该项目classPath特殊,请用另外的方法!");
		}
	}
	
	public static String getQueryUrl(HttpServletRequest request){
		StringBuffer string = request.getRequestURL();
		String queryString = request.getQueryString();
		if (!StringUtil.isStringEmpty(queryString)) {
			string.append("?").append(queryString);
		}
		
		String string2 = string.toString();
		if (string2.indexOf("/WEB-INF/jsp/") != -1) {
			string2 = jspUrl2ServletUrl(string2);
		}
		return string2;
	}
	public static String jspUrl2ServletUrl(String jspUrl){
		return jspUrl.replaceFirst("/WEB-INF/jsp", "").replaceFirst("\\.jsp", ".act");
	}

	/**
	 * 把分隔符换成当前系统的分割符,如更换后路径以类似\D:开头,
	 * 开头的\将会被去掉
	 * @param path
	 * @return
	 */
	public static String change2SystemSeparatorChar(String path){
		char separatorChar = File.separatorChar;
		switch (separatorChar) {
		case '/':
			path =  path.replaceAll("\\\\", "/");
			break;
		case '\\':
			path = path.replaceAll("\\/", "\\\\");
			break;
		default:
			break;
		}
		
		if (path.length() > 2 && path.substring(0,3).matches("^\\\\\\S\\:$")) {
			path = path.substring(1);
		}
		return path;
	}
	/**
	 * 解析相对于classpath的相对路径为绝对路径
	 * @param relativePath
	 * @return
	 */
	public static String praseRelativePath(String relativePath){
		int count = 0;
		while (relativePath.startsWith("../")) {
			count++;
			relativePath = relativePath.substring(3);
		}
		String temp = getClassesPath();
		for (int i = 0; i < count; i++) {
			try {
				temp = getParaentPath(temp);
			} catch (PathIsTopException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		return change2SystemSeparatorChar(temp+relativePath);
	}
	/**
	 * 解析相对于currentPath的相对路径为绝对路径
	 * @param relativePath
	 * @param currentPath
	 * @return
	 */
	public static String praseRelativePath(String currentPath,String relativePath){
		int count = 0;
		while (relativePath.startsWith("../")) {
			count++;
			relativePath = relativePath.substring(3);
		}
		String temp = currentPath;
		for (int i = 0; i < count; i++) {
			try {
				temp = getParaentPath(temp);
			} catch (PathIsTopException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		return change2SystemSeparatorChar(mergePath(temp, relativePath));
	}
	
	/**
	 * append参数到url,不会出现两个?或者没有?
	 * @param url
	 * @param param
	 * @return
	 */
	public static String appendParam(String url,Map<String, Object> param){
		StringBuffer sb = new StringBuffer(url);
		if (url.contains("?")) {
			sb.append("&");
		}else {
			sb.append("?");
		}
		for (Entry<String, Object> temp:param.entrySet()) {
			sb.append(temp.getKey());
			sb.append("=");
			sb.append(temp.getValue());
			sb.append("&");
		}
		String string = sb.toString();
		if (string.endsWith("&")) {
			string = string.substring(0, string.length()-1);
		}
		return string;
	}
	/**
	 * 获取参数url,把post的参数也append到url来,一般用于带参数重定向url
	 * @param url
	 * @param param
	 * @return
	 */
	public static String getParamUrl(HttpServletRequest request,Map<String, Object> param){
		if (param == null) {
			param = new HashMap<String, Object>();
		}
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String string = (String) parameterNames.nextElement();
			param.put(string, request.getParameter(string));
		}
		return appendParam(request.getRequestURL().toString(), param);
	}
	
	/**
	 * 获取path上级目录,分隔符/或\均可,
	 * path末尾带分隔符时返回的上级目录末尾也会带分隔符，反之亦然
	 * @param path 可以是文件路径
	 * @return
	 * @throws PathIsTopException path为顶级目录时抛出
	 */
	public static String getParaentPath(String path) throws PathIsTopException{
		boolean isReaction;
		if (path.contains("/")) {
			isReaction = false;
		}else if (path.contains("\\")) {
			isReaction = true;
			path = path.replaceAll("\\\\", "/");
		}else {
			throw new PathIsTopException(String.format("%s%s", path,"已经是顶级目录"));
		}
		if (path.endsWith("/")) {
			path = path.substring(0, path.length()-1);
			path = path.substring(0,path.lastIndexOf("/")+1);
		}else {
			path = path.substring(0,path.lastIndexOf("/"));
		}
		if (isReaction && path.contains("/")) {
			return path = path.replaceAll("/", "\\\\");
		}
		return path;
	}
}
