package spiderman.util.base;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
/**
 * io工具类
 * @author 战马
 *
 */
public class IOUtil {
	private BufferedReader reader;
	private FileReader fileReader;
	
	private BufferedWriter writer;
	private FileWriter fileWriter;
	
	private FileOutputStream outputStream;
	private BufferedOutputStream bufferedOutputStream;
	
	private FileInputStream inputStream;
	private BufferedInputStream bufferedInputStream;
	
	private void closeBufferedReader(){
		try {
			if (reader != null) {
				reader.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void closeFileReader(){
		try {
			if (fileReader != null) {
				fileReader.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	private void closeBufferedWriter(){
			if (writer != null) {
				try {
					writer.flush();
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	}
	private void closeFileWriter(){
			if (fileWriter != null) {
				try {
					fileWriter.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	}
	private void closeBufferedInputStream(){
		if (bufferedInputStream != null) {
			try {
				bufferedInputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	private void closeFileInputStream(){
		if (inputStream != null) {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	private void closeBufferedOutputStream(){
		if (bufferedOutputStream != null) {
			try {
				bufferedOutputStream.flush();
				bufferedOutputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	private void closeFileOutputStream(){
		if (outputStream != null) {
			try {
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void closeReader(){
		closeBufferedReader();
		closeFileReader();
	}
	public void closeWriter(){
		closeBufferedWriter();
		closeFileWriter();
	}
	public void closeInputStream(){
		closeBufferedInputStream();
		closeFileInputStream();
	}
	/**
	 * flush并关闭BufferedOutputStream和OutputStream
	 */
	public void closeOutputStream(){
		closeBufferedOutputStream();
		closeFileOutputStream();
	}
	/**
	 * 关闭所有用IOUtil获取的输入输出流
	 */
	public void closeIO(){
		closeInputStream();
		closeOutputStream();
		closeReader();
		closeWriter();
	}
	
	public BufferedReader getBufferedReader(String path) throws FileNotFoundException{
		return getBufferedReader(new File(path));
	}
	public BufferedReader getBufferedReader(File file) throws FileNotFoundException{
		fileReader = new FileReader(file);
		reader = new BufferedReader(fileReader);
		return reader;
	}
	public BufferedWriter getBufferedWriter(String path) throws IOException{
		return getBufferedWriter(getFileAndMakeDirs(path));
	}
	public BufferedWriter getBufferedWriter(File file) throws IOException{
		fileWriter = new FileWriter(file);
		writer = new BufferedWriter(fileWriter);
		return writer;
	}
	
	public BufferedOutputStream getBufferedOutputStream(String path) throws FileNotFoundException {
		return getBufferedOutputStream(getFileAndMakeDirs(path));
	}
	public BufferedOutputStream getBufferedOutputStream(File file) throws FileNotFoundException {
		outputStream = new FileOutputStream(file);
		bufferedOutputStream = new BufferedOutputStream(outputStream);
		return bufferedOutputStream;
	}
	
	public BufferedInputStream getBufferedInputStream(String path) throws FileNotFoundException {
		return getBufferedInputStream(new File(path));
	}
	/**
	 * 获取BufferedInputStream，读取完毕后一定要调用closeInputStream
	 * @param file
	 * @return
	 * @throws FileNotFoundException
	 */
	public BufferedInputStream getBufferedInputStream(File file) throws FileNotFoundException {
		inputStream = new FileInputStream(file);
		bufferedInputStream = new BufferedInputStream(inputStream);
		return bufferedInputStream;
	}
	public String readLine() throws IOException{
		return reader.readLine();
	}
	
	public static void copyFile(String copyedPath,String copyToPath) throws IOException{
		copyFile(new File(copyedPath), getFileAndMakeDirs(copyToPath));
	}
	public static void copyFile(File copyed,String copyToPath) throws IOException{
		copyFile(copyed, getFileAndMakeDirs(copyToPath));
	}
	/**
	 * 复制文件
	 * @param copyed 被复制的文件
	 * @param copyTo 复制到哪里
	 * @throws IOException
	 */
	public static void copyFile(File copyed,File copyTo) throws IOException{
		IOUtil io = new IOUtil();
		try {
			BufferedInputStream in = io.getBufferedInputStream(copyed);
			BufferedOutputStream out = io.getBufferedOutputStream(copyTo);
			byte[] buffer = new byte[1024];
			int len;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}
			io.closeIO();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 把文件中的字符读到string中
	 * @param path 文本路径
	 * @return
	 */
	public static StringBuffer file2StringBuffer(String path){
		StringBuffer sb = new StringBuffer();
		IOUtil io = new IOUtil();
		try {
			io.getBufferedReader(path);
			String temp;
			while ((temp = io.readLine()) != null) {
				sb.append(temp);
			}
			return sb;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			io.closeReader();
		}
	}
	
	/**
	 * 获取file并创建其所有上级目录
	 * @param path
	 * @return
	 */
	public static File getFileAndMakeDirs(String path) {
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
			file.delete();
		}
		return file;
	}
}
