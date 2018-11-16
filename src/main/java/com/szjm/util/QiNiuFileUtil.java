package com.szjm.util;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

/**
 * 七牛云 上传文件
 * 
 * @author Administrator
 *
 */
public class QiNiuFileUtil {

	// 构造一个带指定Zone对象的配置类
	static Configuration cfg = new Configuration(Zone.zone0());
	// ...其他参数参考类注释
	static UploadManager uploadManager = new UploadManager(cfg);
	// ...生成上传凭证，然后准备上传
	static String accessKey = null;
	static String secretKey = null;
	static String bucket = null;

	// 默认不指定key的情况下，以文件内容的hash值作为文件名

	static {

		// *********七牛云*******************
		accessKey = PropertiesQiNiuUtil.getKeyValue("accessKey");
		secretKey = PropertiesQiNiuUtil.getKeyValue("secretKey");
		bucket = PropertiesQiNiuUtil.getKeyValue("bucket");

	}

	/*public static void main(String[] args) {
		// 删除图片
		deletefile("8c24e2c9-0935-419b-b4b8-8e555eb3c514.png");
	}*/

	/**
	 * 
	 * @param file
	 *            new file("D:\\qiniu\\test.png")文件路径 如果是Windows情况下，格式是
	 *            D:\\qiniu\\test.png
	 * @param FileName
	 *            文件名 test
	 */
	public static void uploadFile(File file, String FileName) {

		try {
			String key = FileName;
			Auth auth = Auth.create(accessKey, secretKey);

			String upToken = auth.uploadToken(bucket);

			Response response = uploadManager.put(file, key, upToken);
			// 解析上传成功的结果
			DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
			System.out.println(putRet);
			System.out.println("key:" + putRet.key);
			System.out.println("hash:" + putRet.hash);
		} catch (QiniuException ex) {
			Response r = ex.response;
			System.err.println(r.toString());
			try {
				System.err.println(r.bodyString());
			} catch (QiniuException ex2) {
				// ignore
			}
		}

	}
	
	/**
	 * 删除文件
	 * 
	 * @param fileName
	 *            文件名
	 */
	public static void deletefile(String fileName) {

		try {

			Auth auth = Auth.create(accessKey, secretKey);
			BucketManager bucketManager = new BucketManager(auth, cfg);
			bucketManager.delete(bucket, fileName);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 删除批量文件
	 * 
	 * @param  fileName
	 *            文件名 数组
	 */
	public static void deletefileArr(String[] fileName) {

		try {

			Auth auth = Auth.create(accessKey, secretKey);
			BucketManager bucketManager = new BucketManager(auth, cfg);

			for (int i = 0; i < fileName.length; i++) {

				bucketManager.delete(bucket, fileName[i]);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 获取空间 列表
	 */
	public static void getfilelist() {

		Auth auth = Auth.create(accessKey, secretKey);
		BucketManager bucketManager = new BucketManager(auth, cfg);
		// 文件名前缀
		String prefix = "";
		// 每次迭代的长度限制，最大1000，推荐值 1000
		int limit = 1000;
		// 指定目录分隔符，列出所有公共前缀（模拟列出目录效果）。缺省值为空字符串
		String delimiter = "";
		// 列举空间文件列表
		BucketManager.FileListIterator fileListIterator = bucketManager.createFileListIterator(bucket, prefix, limit,
				delimiter);

		while (fileListIterator.hasNext()) {
			// 处理获取的file list结果
			FileInfo[] items = fileListIterator.next();

			for (FileInfo item : items) {
				System.out.println(item.key + "文件");
				System.out.println(item.hash);
				System.out.println(item.fsize);
				System.out.println(item.mimeType);
				System.out.println(item.putTime);
				System.out.println(item.endUser);
			}
		}

	}

	public static String uploadMulFile(MultipartFile file) {

		// 原始文件名称
		String pictureFile_name = file.getOriginalFilename();
		// 新文件名称
		String newFileName = UUID.randomUUID().toString()
				+ pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

		// 上传图片
		String projectPath = QiNiuFileUtil.class.getResource("/").getPath();
		projectPath = projectPath.replaceAll("WEB-INF/", "") + "upload/";
		File uploadPic = new File(projectPath + newFileName);

		if (!uploadPic.exists()) {
			uploadPic.mkdirs();
		}
		// 向磁盘写文件
		try {
			file.transferTo(uploadPic);

			if(file.getSize()>1024*1204*5){
				long size=file.getSize();

			int ratio=(int) (size) /(1024*1204*5);
			InputStream in = null;

			//缩放后需要保存的路径
			File saveFile = new File(projectPath);
			
			//原图片的路径  
				in = new FileInputStream(uploadPic);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		uploadFile(uploadPic, newFileName);
		
		// 删本地
		uploadPic.delete();
		
		
		return PropertiesQiNiuUtil.getKeyValue("qiniuyun_http_url")+newFileName;

	}

	/**
	 * 字节数组上传  
	 * @param base64  字节字符串
	 * @param fileName   文件名
	 */
	public static String  uploadArr( String base64,String fileName){

		try {
			
			if(base64.contains("base64")){
				  base64 = base64.split(",")[1];
				}
			  
		    if (base64 == null){
		    	// 图像数据为空
		    	System.out.println("图像数据为空");
		    }
		    
			 BASE64Decoder decoder = new BASE64Decoder();
			    
			      // Base64解码
			      byte[] bytes = decoder.decodeBuffer(base64);
			      for (int i = 0; i < bytes.length; ++i) {
			        if (bytes[i] < 0) {// 调整异常数据
			          bytes[i] += 256;
			        }
			      }
			
			
			 
			
		    Auth auth = Auth.create(accessKey, secretKey);
		    String upToken = auth.uploadToken(bucket);
		    try {
		        Response response = uploadManager.put(bytes, fileName, upToken);
		        //解析上传成功的结果
		        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
		        System.out.println(putRet.key);
		        System.out.println(putRet.hash);
		    } catch (QiniuException ex) {
		        Response r = ex.response;
		        System.err.println(r.toString());
		        try {
		            System.err.println(r.bodyString());
		        } catch (QiniuException ex2) {
		            //ignore
		        }
		    }
		} catch (Exception ex) {
		    //ignore
		}
		
		
		return PropertiesQiNiuUtil.getKeyValue("qiniuyun_http_url")+fileName;
		
		
		
	}
	
	 
	
}
