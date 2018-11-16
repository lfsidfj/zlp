package com.szjm.service.zlp.giftareatype.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.szjm.dao.DaoSupport;
import com.szjm.entity.Page;
import com.szjm.util.PageData;
import com.szjm.service.zlp.giftareatype.GiftAreaTypeManager;

/** 
 * 说明： 区域管理类目
 * 创建人：
 * 创建时间：2018-08-17
 * @version
 */
@Service("giftareatypeService")
public class GiftAreaTypeService implements GiftAreaTypeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("GiftAreaTypeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByArea(PageData pd)throws Exception{
		dao.delete("GiftAreaTypeMapper.deleteByArea", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByType(PageData pd)throws Exception{
		dao.delete("GiftAreaTypeMapper.deleteByType", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("GiftAreaTypeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("GiftAreaTypeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("GiftAreaTypeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("GiftAreaTypeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GiftAreaTypeMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**列表(全部)(通过区域Id)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllByArea(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("GiftAreaTypeMapper.listAllByArea", pd);
	}
	
	/**批量删除(通过商品类目类目)
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAllByType(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("GiftAreaTypeMapper.deleteAllByType", ArrayDATA_IDS);
	}
	
}

