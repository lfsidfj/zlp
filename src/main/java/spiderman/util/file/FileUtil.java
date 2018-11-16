package spiderman.util.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import spiderman.util.base.IOUtil;

public class FileUtil {
	
	/**
	 * 扫描该目录下所有文件，并放在list中（只放文件，目录不放）
	 * @param root 要扫描的根目录
	 * @param filter 可以为null
	 * @param list 扫描到的文件（不包括目录）
	 */
	public void scanAllFile(File root,List<File> list,FilenameFilter filter){
		File[] listFiles;
		if (filter == null) {
			listFiles = root.listFiles();
		}else {
			listFiles = root.listFiles(filter);
		}
		if (listFiles != null) {
			for(File f:listFiles){
				if (f.isFile()) {
					list.add(f);
				}else {
					scanAllFile(f, list,filter);
				}
			}
		}
	}
	
	/**
	 * 把file复制到path
	 * @param file
	 * @param path
	 * @return
	 */
	public static boolean copyFile(File file,String path){
		IOUtil io = new IOUtil();
		try {
			BufferedInputStream bufferedInputStream = io.getBufferedInputStream(file);
			BufferedOutputStream bufferedOutputStream = io.getBufferedOutputStream(path);
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = bufferedInputStream.read(buffer)) != -1) {
				bufferedOutputStream.write(buffer, 0, len);
			}
			io.closeInputStream();
			io.closeOutputStream();
			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 替换文件后缀
	 * @param fileName
	 * @param suffix 新后缀
	 * @return
	 */
	public static String replaceFileSuffix(String fileName,String suffix){
		return fileName.substring(0,fileName.lastIndexOf('.'))+suffix;
	}
	
	/**
	 * 获取文件后缀
	 * @param fileName
	 * @return
	 */
	public static String getFileSuffix(String fileName){
		return fileName.substring(fileName.lastIndexOf('.'));
	}
	
	/**
	 * 获取文件后缀
	 * @param fileName
	 * @return
	 */
	public static String getFileSuffix(File file){
		return getFileSuffix(file.getName());
	}
	
	/**
	 * 获取rootPath下所有文件，不包括目录
	 * @param rootPath
	 * @param filter 可以为null
	 * @return rootPath下所有文件，不包括目录
	 */
	public List<File> getAllFile(String rootPath,FilenameFilter filter){
		List<File> list = new ArrayList<File>();
		scanAllFile(new File(rootPath), list,filter);
		return list;
	}
	
}
