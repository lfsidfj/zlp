package com.szjm.util;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class RequestImageSave {
	/**
	 * 保存文件到项目目录下
	 *
	 * @param MultipartFile
	 * @param String
	 */
	public static String saveFile(MultipartFile adverImafe, String filePath) { // 保存文件到项目目录下
		// 原始文件名称
		String pictureFile_name = adverImafe.getOriginalFilename();
		// 新文件名称
		String newFileName = UuidUtil.get32UUID()
				+ pictureFile_name.substring(pictureFile_name.lastIndexOf("."));
		File uploadPic = new File(filePath + newFileName);

		if (!uploadPic.exists()) {
			uploadPic.mkdirs();
		}
		// 向磁盘写文件
		try {
			adverImafe.transferTo(uploadPic);
			System.out.println(adverImafe.getSize());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		String newFilePath = "\\"+filePath.substring(filePath.lastIndexOf("uploadFiles"));
		return newFilePath + newFileName;
	}

	@SuppressWarnings("all")
	public static Map<String, String> getPatems(HttpServletRequest request) { // 获得请求参数
		Map map = new HashMap();
		Enumeration paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			String[] paramValues = request.getParameterValues(paramName);
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() != 0) {
					map.put(paramName, paramValue);
				}
			}
		}
		return map;
	}
}
