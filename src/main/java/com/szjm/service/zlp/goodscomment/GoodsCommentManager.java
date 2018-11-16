package com.szjm.service.zlp.goodscomment;

import java.util.List;
import com.szjm.entity.Page;
import com.szjm.util.PageData;

/**
 * 说明： 商品评论接口
 * 创建人：
 * 创建时间：2018-07-11
 * @version
 */
public interface GoodsCommentManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public int save(PageData pd)throws Exception;

	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCommentById(PageData pd)throws Exception;

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**查询商品评论条数 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCountById(PageData pd) throws Exception;
	
	/**商品评论列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listByGoods(Page page)throws Exception;

}

