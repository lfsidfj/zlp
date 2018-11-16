package spiderman.util.file;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import spiderman.domain.GlobalParam;
import spiderman.util.digest.DigestUtil;
import spiderman.util.digest.Md5Util;
import spiderman.util.digest.Sha256Util;

import com.szjm.entity.system.User;

public class AttachmentUtil {
	
	/**
	 * 保存附件
	 * @param file
	 * @param fileName 为null时fileName = file.getName();
	 * @param user 为null时保存到公共目录，否则保存到用户目录
	 * @return 相对于项目部署目录的相对路径
	 */
	public static String save(File file,String fileName,User user){
		if (fileName == null) {
			fileName = file.getName();
		}
		String path = getPath(user,file,fileName);
		FileUtil.copyFile(file, GlobalParam.FOLDER.rootPath+path);
		return path;
	}
	/**
	 * 删除附件
	 * @param path 相对于项目部署目录的相对路径save的返回值
	 */
	public static void delete(String path){
		new File(GlobalParam.FOLDER.rootPath+path).delete();
	}
	
	
	private static String getPath(User user,File file,String fileName) {
		String userPath;
		Date now = new Date();
		if (user != null) {
			String userNickName = Md5Util.Md5Digest(user.getUSER_ID()+"")+"/";
			userPath = Sha256Util.sha256Digest(userNickName).substring(30)+"/";
		}else {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd/");
			userPath = format.format(now);
		}
		String decodeUrl = DigestUtil.AESAndMd532MinEncode(String.format("%d%d", now.getTime(),new Random().nextInt()));
		return "/upload/"+userPath+"file/"+decodeUrl+FileUtil.getFileSuffix(fileName);
	}
	/**
	 * 保存附件
	 *author:Spiderman
	 * @param pictureFile
	 * @return
	 */
	public static String save(MultipartFile pictureFile){
		//原始文件名称
		String pictureFile_name =  pictureFile.getOriginalFilename();
		//新文件名称
		String newFileName = UUID.randomUUID().toString()+pictureFile_name.substring(pictureFile_name.lastIndexOf("."));
		
		//上传图片
		String path="d:/upload/temp/"+newFileName;
		File uploadPic = new File(path);
		
		if(!uploadPic.exists()){
			uploadPic.mkdirs();
		}
		//向磁盘写文件
		try {
			pictureFile.transferTo(uploadPic);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;
	}
	
}
