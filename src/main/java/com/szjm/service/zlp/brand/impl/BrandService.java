package com.szjm.service.zlp.brand.impl;

import java.util.List;
import javax.annotation.Resource;

import com.szjm.util.PropertiesQiNiuUtil;
import com.szjm.util.QiNiuFileUtil;
import org.springframework.stereotype.Service;
import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.brand.BrandManager;

/** 
 * 说明： 品牌管理
 * 创建人：
 * 创建时间：2018-11-15
 * @version
 */
@Service("brandService")
public class BrandService implements BrandManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BrandMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		PageData deletePd = findById(pd); // 删除区域关联图片
		if(deletePd.get("BRAND_LOGO")!=null &&deletePd.get("BRAND_LOGO").toString()!=""){
			String imageUrl = deletePd.get("BRAND_LOGO").toString();
			QiNiuFileUtil.deletefile(imageUrl.substring(PropertiesQiNiuUtil.getKeyValue("qiniuyun_http_url").length()));
		}
		dao.delete("BrandMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BrandMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BrandMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BrandMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BrandMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		// 批量删除对应七牛云上面的图片
		for (String id: ArrayDATA_IDS) {
			PageData pd = new PageData();
			pd.put("BRAND_ID",id);
			PageData deletePd =  findById(pd);
			if(deletePd.get("BRAND_LOGO")!=null &&deletePd.get("BRAND_LOGO").toString()!=""){
				String imageUrl = deletePd.get("BRAND_LOGO").toString();
				QiNiuFileUtil.deletefile(imageUrl.substring(PropertiesQiNiuUtil.getKeyValue("qiniuyun_http_url").length()));
			}
		}
		dao.delete("BrandMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

