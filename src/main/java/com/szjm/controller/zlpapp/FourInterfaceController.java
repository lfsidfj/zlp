package com.szjm.controller.zlpapp;

import com.szjm.entity.Page;
import com.szjm.service.zlp.goods.GoodsManager;
import com.szjm.service.zlp.goodspicture.GoodsPictureManager;
import com.szjm.service.zlp.goodssku.GoodsSkuManager;
import com.szjm.service.zlp.goodstype.GoodsTypeManager;
import com.szjm.service.zlp.lshuser.LshUserManager;
import com.szjm.service.zlp.memorialday.MemorialDayManager;
import com.szjm.service.zlp.sysconfig.SysConfigManager;
import com.szjm.service.zlp.userbrithday.UserBrithdayManager;
import com.szjm.util.Jurisdiction;
import com.szjm.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 4接口
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/lshapp/init")
public class FourInterfaceController extends BaseAppController{
	@Resource(name = "lshuserService")
	private LshUserManager appuserService;// 用户
	@Resource(name="userbrithdayService")
	private UserBrithdayManager userbrithdayService;//用户生日
	@Resource(name="memorialdayService")
	private MemorialDayManager memorialdayService;//纪念日
	@Resource(name="sysconfigService")
	private SysConfigManager sysconfigService;//系统参数
	@Resource(name = "goodsService")
	private GoodsManager goodsService;	// 商品
	@Resource(name = "goodstypeService")
	private GoodsTypeManager goodstypeService;	// 商品类型
	@Resource(name = "goodsskuService")
	private GoodsSkuManager goodsskuService;// 商品SKU
	@Resource(name = "goodspictureService")
	private GoodsPictureManager goodspictureService;//商品图片
	/**
	 *      个人中心  center_index
	 * @throws Exception
	 */
	@RequestMapping(value = "/user_index")
	public void user_index(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		PageData pdUser = appuserService.findById(pd);
		Map<String,Object> content=new HashMap<String,Object>();
		//昵称
		content.put("NICK_NAME", pdUser.get("NICK_NAME"));
		//头像
		content.put("PATH", pdUser.get("PATH"));
		//角色
		if("common".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "普通用户");
		}
		if("agent".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "代理商");
		}
		if("partner".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "合伙人");
		}
		if("vip".equals(pdUser.get("ROLE").toString())){
			content.put("ROLE", "VIP会员");
		}
		//礼豆数量
		content.put("INTEGRATION", pdUser.get("INTEGRATION"));
		//余额数量
		content.put("MONEY", pdUser.get("MONEY"));
		WriteClientMessage(response,"0", "成功", content);
	}

	/**
	 * 生日
	 */
	@RequestMapping(value = "/user_brithday")
	public void user_brithday(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer user_id = Jurisdiction.getAppUserId();
		pd.put("USER_ID", user_id);
		List<PageData>	varList = userbrithdayService.listAll(pd);	//列出UserBrithday列表
		List<PageData> listAll = memorialdayService.listAll(pd); //纪念日列表
		Map<String,Object> content=new HashMap<String,Object>();
		List<Object> listB=new ArrayList<Object>();
		List<Object> listM=new ArrayList<Object>();
		//列出UserBrithday列表
		for (PageData pageData : varList) {
			Map<String,Object> contentNew=new HashMap<String,Object>();
			//头像
			if(pageData.get("PATH")!=null){
				contentNew.put("PATH", pageData.get("PATH"));
			}else{
				contentNew.put("PATH", "");
			}

			//昵称
			contentNew.put("NICK_NAME", pageData.get("NAME"));
			//电话
			contentNew.put("PHONE_NUMBER", pageData.get("PHONE_NUMBER"));
			//生日日期
			contentNew.put("SOLAR_BIRTHDAY", pageData.get("SOLAR_BIRTHDAY"));
			//关系
			contentNew.put("RELATIONSHIP", pageData.get("RELATIONSHIP"));
			//编号
			contentNew.put("BIRTHDAY_ID", pageData.get("BIRTHDAY_ID"));
			listB.add(contentNew);
		}
		for (PageData pageData : listAll) {
			Map<String,Object> contentNew=new HashMap<String,Object>();
			//日期
			contentNew.put("COMMEMORATE_DATE", pageData.get("COMMEMORATE_DATE"));
			//纪念日名称
			contentNew.put("NAME", pageData.get("NAME"));
			//编号
			contentNew.put("MEMORIALDAY_ID", pageData.get("MEMORIALDAY_ID"));
			//距离日期
			contentNew.put("DAYS", pageData.get("DAYS"));
			listM.add(contentNew);
		}
		content.put("brithdayList", listB);
		content.put("memorialdayList", listM);
		WriteClientMessage(response,"0", "成功", content);
	}

	/**
	 * 送礼
	 */
	@RequestMapping(value = "/shop_index")
	public void shop_index(HttpServletRequest request, HttpServletResponse response,Page page) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put(Jurisdiction.getAppUserRole(), Jurisdiction.getAppUserRole()); // 当前用户角色
		pd.put("IS_INDEX", 1); // 首页展示
		page.setPd(pd);
		List<PageData> typeList = goodstypeService.listAll(pd); // 商品类型
		List<PageData> goodsList = goodsService.appGoodsList(page); // 列出Goods列表
		List<PageData> broadcastList = new ArrayList<PageData>(); // 轮播商品
		Map<String,Object> content=new HashMap<String,Object>();
		List<Object> listB=new ArrayList<Object>();
		List<Object> listM=new ArrayList<Object>();
		List<Object> listG=new ArrayList<Object>();
		// 商品类型
		for (PageData pageData : typeList) {
			Map<String,Object> contentG=new HashMap<String,Object>();
			contentG.put("TYPE_NAME", pageData.get("TYPE_NAME"));
			contentG.put("PATH", pageData.get("PATH"));
			contentG.put("GOODSTYPE_ID", pageData.get("GOODSTYPE_ID"));
			listG.add(contentG);
		}
		for (PageData pageData : goodsList) {
			List<PageData> listGoods = goodsskuService.listByGoodsId(pageData);
			// 轮播的商品
			if (pageData.get("IS_BROADCAST") != null
					&& pageData.get("IS_BROADCAST").toString().equals("1")) {
				PageData broadPd = new PageData();
				broadPd.put("GOODS_ID", pageData.get("GOODS_ID"));
				broadcastList.add(broadPd);
			}
			// 库存
			int stock = 0;
			for (PageData goods : listGoods) {
				stock = stock
						+ Integer.parseInt(goods.get("GOODS_INVENTORY")
								.toString());
			}
			pageData.put("GOODS_INVENTORY", stock);
			Map<String,Object> contentG=new HashMap<String,Object>();
			contentG.put("PATH", pageData.get("PATH"));//图片
			contentG.put("GOODS_INVENTORY", stock);//库存
			contentG.put("ORIGINAL_PRICE", pageData.get("ORIGINAL_PRICE"));//现价
			contentG.put("GOODS_NAME", pageData.get("GOODS_NAME"));//商品名称
			contentG.put("GOODS_ID", pageData.get("GOODS_ID"));//商品编号
			contentG.put("GOODS_POSITION", pageData.get("GOODS_POSITION"));
			contentG.put("SALES_VOLUME", pageData.get("SALES_VOLUME"));//销量
			contentG.put("CURRENT_PRICE", pageData.get("CURRENT_PRICE"));//现价
			listB.add(contentG);
		}
		// 首页轮播图
		for (PageData pageData : broadcastList) {
			Map<String,Object> contentG=new HashMap<String,Object>();
			PageData pictureGoods = goodspictureService.findByGoodsId(pageData);
			if (pictureGoods != null && pictureGoods.get("PATH") != null
					&& !pictureGoods.get("PATH").toString().equals("")) {

				contentG.put("PATH", pictureGoods.get("PATH").toString());

			}else{
				contentG.put("PATH", "");
			}
			contentG.put("GOODS_ID", pageData.get("GOODS_ID"));
			listM.add(contentG);
		}
		content.put("typeList", listG);
		content.put("goodsList", listB);
		content.put("broadcastList", listM);
		content.put("totalPage", page.getTotalPage());
		content.put("currentPage", 1);
		WriteClientMessage(response,"0", "成功", content);
	}
}
