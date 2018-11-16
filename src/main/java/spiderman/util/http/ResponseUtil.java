package spiderman.util.http;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spiderman.util.base.StringUtil;

/**
 * 
 * @author 战马
 *
 */
public class ResponseUtil {
	/**
	 * 设置响应头为附件响应头
	 * @param fileName
	 * @param response
	 * @param request
	 */
	public static void setAttachmentHeader(String fileName,HttpServletResponse response,HttpServletRequest request) {
    	try {
//    		response.setContentType("application/force-download");
//    		response.setContentType("application/octet-stream");
    		response.setContentType("application/x-msdownload");
    		String upperCase = request.getHeader("User-Agent").toUpperCase();
			if (upperCase.indexOf("MSIE") > 0 || upperCase.indexOf("LIKE GECKO") > 0 ) {  
    			response.addHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fileName, StringUtil.getCharacterSet()));
    		} else {  
    			response.addHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes(StringUtil.getCharacterSet()), "ISO8859-1"));
    		}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}  
	}
	
}
