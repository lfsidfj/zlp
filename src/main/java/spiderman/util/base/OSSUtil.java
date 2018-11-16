package spiderman.util.base;

import java.io.File;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.GetObjectRequest;
public class OSSUtil {

    /*private static String endpoint = "http://oss-cn-shenzhen.aliyuncs.com";
    private static String accessKeyId = "LTAIKNu9jjd4geDi";
    private static String accessKeySecret = "wvmfOLxcRMSu6DqsRkpVx6OxAIgwuy";
    private static String bucketName = "hnjxtx";*/
	private static String endpoint = "http://oss-cn-shenzhen.aliyuncs.com";
    private static String accessKeyId = "LTAI887fLCVntwQA";
    private static String accessKeySecret = "J3v6fhROfpUbWWBo90A3UDdeZNhr2u";
    private static String bucketName = "cspcsp";
    /**
     * 文件上传
     * @param key
     * @param file
     */
	public static void uploadFile(String key,File file){
		try {
			//如果OSS存在同名文件
			if(doesObjectExist(key)){
				deleteFile(key);
			}
		    // 创建OSSClient实例
		    OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		    // 上传文件
		    ossClient.putObject(bucketName, key, file);
		    // 关闭client
		    ossClient.shutdown();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static void download(String key,String filePath){
		try {
		    // 创建OSSClient实例
		    OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		    // 下载object到文件
		    ossClient.getObject(new GetObjectRequest(bucketName, key), new File(filePath));
		    // 关闭client
		    ossClient.shutdown();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * 删除文件
	 * @param key
	 */
	public static void deleteFile(String key){
		try {
		    // 创建OSSClient实例
		    OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		    // 删除Object
		    ossClient.deleteObject(bucketName, key);
		    // 关闭client
		    ossClient.shutdown();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	/**
	 * 获取文件URL
	 * @param key
	 * @return
	 */
	public static String getFileUrl(String key){
		String urlStr = endpoint.replace("http://", "http://" + bucketName+ ".");
		return urlStr+"/"+key;
	}
	/**
	 *	判断文件是否存在
	 * @param key
	 * @return
	 */
	public static boolean doesObjectExist(String key){
	    // 创建OSSClient实例
	    OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
	    // Object是否存在
	    boolean found = ossClient.doesObjectExist(bucketName, key);
	    // 关闭client
	    ossClient.shutdown();
	    return found;
	}
}
