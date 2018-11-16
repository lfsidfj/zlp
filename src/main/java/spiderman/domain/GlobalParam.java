package spiderman.domain;
/**
 * 系统各种常量
 * @author battle_steed
 *
 */
public class GlobalParam {
	/**
	 * 放在session，request中的key
	 */
	public static class attribute{
		/**
		 * user,当前登录的用户
		 */
		public static final String user = "user";
		
		/**
		 * admin,当前登录的管理员用户
		 */
		public static final String admin = "admin";
		/**
		 * 终端登录用户
		 */
		public static final String terminalUser = "terminalUser";
		public static final String wechatAccount = "wechatAccount";
	}
	
	public static class config{
		public static boolean devMode = true;
	}
	
	
	
	
	
	
	/**
	 * 文件夹常量
	 * @author battle_steed
	 *
	 */
	public static class FOLDER{
		/**
		 * contextPath 项目上下文路径/beyondstar
		 */
		public static String contextPath = "/redPacket";
		/**
		 * 服务器地址，例如http://battlesteed.tunnel.mobi
		 */
		public static String serverAddress = "/beyondstar";
		/**
		 * rootPath 项目绝对路径，形如D:\developer\apache-tomcat-7.0.59\webapps\BeyondStar\
		 */
		public static String rootPath = "D:\\developer\\apache-tomcat-7.0.59\\webapps\\wechatMarketing";
		
		/**
		 * 项目根url例如http://localhost/Beyondstar
		 */
		public static String contextUrl = "";
		/**
		 * /WEB-INF/jsp/
		 */
		public static String JSPPATH = "/WEB-INF/jsp/";
		/**
		 * /WEB-INF/jsp/admin/
		 */
		public static String ADMINJSPPATH = "/WEB-INF/jsp/admin/";
		/**
		 * /WEB-INF/jsp/admin/site/
		 */
		public static String ADMINSITEPATH = "/WEB-INF/jsp/admin/site/";
		/**
		 * /css/
		 */
		public static String CSSPATH = "/css/";
		/**
		 * /image/
		 */
		public static String IMAGEPATH = "/image/";
		/**
		 * /js/
		 */
		public static String JSPATH = "/js/";
		/**
		 * /html/
		 */
		public static String HTMLPATH = "/html/";
	}
}
