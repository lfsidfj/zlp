package com.szjm.controller.information.pictures;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.szjm.controller.base.BaseController;
import com.szjm.entity.Page;
import com.szjm.service.information.pictures.PicturesManager;
import com.szjm.util.AppUtil;
import com.szjm.util.Const;
import com.szjm.util.DateUtil;
import com.szjm.util.DelAllFile;
import com.szjm.util.FileUpload;
import com.szjm.util.GetWeb;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import com.szjm.util.PathUtil;
import com.szjm.util.Tools;
import com.szjm.util.Watermark;

/**
 * 类名称：图片管理
 * 创建人：DCWI
 * 创建时间：2018-07-23
 */
@Controller
@RequestMapping(value="/lshapp/uploading/pictures")
public class AppPictureController extends BaseController {
	String menuUrl = "lshapp/uploading/pictures/list.do"; //菜单地址(权限用)
	@Resource(name="picturesService")
	private PicturesManager picturesService;

	/**新增
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveForUrl")
	@ResponseBody
	public Object saveForUrl(
			@RequestParam(required=false) MultipartFile file
			) throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		String  ffile = DateUtil.getDays(), fileName = "";
		PageData pd = new PageData();
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
		}else{
			System.out.println("上传失败");
		}
		pd.put("PICTURES_ID", this.get32UUID());			//主键
		pd.put("TITLE", "图片");								//标题
		pd.put("NAME", fileName);							//文件名
		pd.put("PATH", ffile + "/" + fileName);				//路径
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("MASTER_ID", "1");							//附属与
		pd.put("BZ", "图片管理处上传");						//备注
		//Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
		picturesService.save(pd);
		map.put("result", "ok");
		map.put("url", ffile + "/" + fileName);
		map.put("PICTURES_ID", pd.getString("PICTURES_ID"));
		map.put("PATH", pd.getString("PATH"));
		return AppUtil.returnObject(pd, map);
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除图片");
		PageData pd = new PageData();
		if(Jurisdiction.buttonJurisdiction(menuUrl, "del")){
			pd = this.getPageData();
			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); //删除图片
			picturesService.delete(pd);
		}
		out.write("success");
		out.close();
	}

	/**修改
	 * @param request
	 * @param file
	 * @param tpz
	 * @param PICTURES_ID
	 * @param TITLE
	 * @param MASTER_ID
	 * @param BZ
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="PICTURES_ID",required=false) String PICTURES_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="MASTER_ID",required=false) String MASTER_ID,
			@RequestParam(value="BZ",required=false) String BZ
			) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改图片");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(Jurisdiction.buttonJurisdiction(menuUrl, "edit")){
			pd.put("PICTURES_ID", PICTURES_ID);		//图片ID
			pd.put("TITLE", TITLE);					//标题
			pd.put("MASTER_ID", MASTER_ID);			//属于ID
			pd.put("BZ", BZ);						//备注
			if(null == tpz){tpz = "";}
			String  ffile = DateUtil.getDays(), fileName = "";
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;	//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());			//执行上传
				pd.put("PATH", ffile + "/" + fileName);									//路径
				pd.put("NAME", fileName);
			}else{
				pd.put("PATH", tpz);
			}
			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
			picturesService.edit(pd);				//执行修改数据库
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

	/**去新增页面
	 * @return
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("information/pictures/pictures_add");
		mv.addObject("pd", pd);
		return mv;
	}

	/**去修改页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = picturesService.findById(pd);	//根据ID读取
		mv.setViewName("information/pictures/pictures_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**批量删除
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		if(Jurisdiction.buttonJurisdiction(menuUrl, "del")){
			List<PageData> pdList = new ArrayList<PageData>();
			List<PageData> pathList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				pathList = picturesService.getAllById(ArrayDATA_IDS);
				for(int i=0;i<pathList.size();i++){
					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pathList.get(i).getString("PATH"));//删除图片
				}
				picturesService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
			}
		return AppUtil.returnObject(pd, map);
	}

	/**删除图片
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deltp")
	public void deltp(PrintWriter out) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		String PATH = pd.getString("PATH");													 		//图片路径
		DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
		if(PATH != null){
			picturesService.delTp(pd);																//删除数据库中图片数据
		}
		out.write("success");
		out.close();
	}

	/**去图片爬虫页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goImageCrawler")
	public ModelAndView goImageCrawler() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("information/pictures/imageCrawler");
		return mv;
	}

	/**
	 *	请求连接获取网页中每个图片的地址
	 * @param args
	 * @throws Exception
	 */
	@RequestMapping(value="/getImagePath")
	@ResponseBody
	public Object getImagePath(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<String> imgList = new ArrayList<String>();
		String errInfo = "success";
		String serverUrl = pd.getString("serverUrl");	//网页地址
		String msg = pd.getString("msg");				//msg:save 时保存到服务器
		if (!serverUrl.startsWith("http://")){ 			//检验地址是否http://
			 errInfo = "error";							//无效地址
		 }else{
			 try {
				imgList = GetWeb.getImagePathList(serverUrl);
				if("save".equals(msg)){
					String ffile = DateUtil.getDays();
					String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
					for(int i=0;i<imgList.size();i++){	//把网络图片保存到服务器硬盘，并数据库记录
						String fileName = FileUpload.getHtmlPicture(imgList.get(i),filePath,null);								//下载网络图片上传到服务器上
						//保存到数据库
						pd.put("PICTURES_ID", this.get32UUID());			//主键
						pd.put("TITLE", "图片");								//标题
						pd.put("NAME", fileName);							//文件名
						pd.put("PATH", ffile + "/" + fileName);				//路径
						pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
						pd.put("MASTER_ID", "1");							//附属与
						pd.put("BZ", serverUrl+"爬取");						//备注
						Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
						picturesService.save(pd);
					}
				}
			} catch (Exception e) {
				errInfo = "error";						//出错
			}
		}
		map.put("imgList", imgList);					//图片集合
		map.put("result", errInfo);						//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
