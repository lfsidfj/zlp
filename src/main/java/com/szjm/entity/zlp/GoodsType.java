package com.szjm.entity.zlp;

import java.io.Serializable;
import java.util.List;

/** 
 * 说明：商品分类 实体类
 * 创建时间：2017-07-31
 */
public class GoodsType implements Serializable {
	
	private String GOODS_TYPE_ID;	//主键
	private String TYPE_NAME;					//名称
	private String PARENT_ID;				//父类ID
	private String target;
	private GoodsType Goodstype;
	private List<GoodsType> subGoodsType;
	private boolean hasGoodsType = false;
	private String treeurl;
	
	private String STATUS;			//状态
	public String getFSTATUS() {
		return STATUS;
	}
	public void setFSTATUS(String STATUS) {
		this.STATUS = STATUS;
	}
	private String CREATE_USER;			//创建人
	public String getFCREATE_USER() {
		return CREATE_USER;
	}
	public void setFCREATE_USER(String CREATE_USER) {
		this.CREATE_USER = CREATE_USER;
	}
	private String CREATE_DATE;			//创建日期
	public String getFCREATE_DATE() {
		return CREATE_DATE;
	}
	public void setFCREATE_DATE(String CREATE_DATE) {
		this.CREATE_DATE = CREATE_DATE;
	}
	private String MODIFY_USER;			//修改人
	public String getFMODIFY_USER() {
		return MODIFY_USER;
	}
	public void setFMODIFY_USER(String MODIFY_USER) {
		this.MODIFY_USER = MODIFY_USER;
	}
	private String MODIFY_DATE;			//修改日期
	public String getFMODIFY_DATE() {
		return MODIFY_DATE;
	}
	public void setFMODIFY_DATE(String MODIFY_DATE) {
		this.MODIFY_DATE = MODIFY_DATE;
	}
	private String DESCRIPTION;			//描述
	public String getFDESCRIPTION() {
		return DESCRIPTION;
	}
	public void setFDESCRIPTION(String DESCRIPTION) {
		this.DESCRIPTION = DESCRIPTION;
	}

	public String getGOODS_TYPE_ID() {
		return GOODS_TYPE_ID;
	}
	public void setGOODS_TYPE_ID(String GOODS_TYPE_ID) {
		this.GOODS_TYPE_ID = GOODS_TYPE_ID;
	}
	public String getTYPE_NAME() {
		return TYPE_NAME;
	}
	public void setTYPE_NAME(String TYPE_NAME) {
		this.TYPE_NAME = TYPE_NAME;
	}
	public String getPARENT_ID() {
		return PARENT_ID;
	}
	public void setPARENT_ID(String PARENT_ID) {
		this.PARENT_ID = PARENT_ID;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public GoodsType getGoodsType() {
		return Goodstype;
	}
	public void setGoodsType(GoodsType Goodstype) {
		this.Goodstype = Goodstype;
	}
	public List<GoodsType> getSubGoodsType() {
		return subGoodsType;
	}
	public void setSubGoodsType(List<GoodsType> subGoodsType) {
		this.subGoodsType = subGoodsType;
	}
	public boolean isHasGoodsType() {
		return hasGoodsType;
	}
	public void setHasGoodsType(boolean hasGoodsType) {
		this.hasGoodsType = hasGoodsType;
	}
	public String getTreeurl() {
		return treeurl;
	}
	public void setTreeurl(String treeurl) {
		this.treeurl = treeurl;
	}
	
}
