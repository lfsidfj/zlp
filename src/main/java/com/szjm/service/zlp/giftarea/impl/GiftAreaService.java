package com.szjm.service.zlp.giftarea.impl;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.service.zlp.giftarea.GiftAreaManager;
import com.szjm.util.PageData;
import com.szjm.util.PropertiesQiNiuUtil;
import com.szjm.util.QiNiuFileUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 礼物专区
 * 创建人：
 * 创建时间：2018-08-17
 * @version
 */
@Service("giftareaService")
public class GiftAreaService implements GiftAreaManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GiftAreaMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		PageData deletePd = findById(pd); // 删除区域关联图片
		if(deletePd.get("AREA_IMAGE")!=null &&deletePd.get("AREA_IMAGE").toString()!=""){
			String imageUrl = deletePd.get("AREA_IMAGE").toString();
			QiNiuFileUtil.deletefile(imageUrl.substring(PropertiesQiNiuUtil.getKeyValue("qiniuyun_http_url").length()));
		}
		dao.delete("GiftAreaMapper.delete", pd);
	}

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GiftAreaMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GiftAreaMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GiftAreaMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GiftAreaMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GiftAreaMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

