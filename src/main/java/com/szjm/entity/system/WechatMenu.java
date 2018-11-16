package com.szjm.entity.system;

import java.util.List;

/**
 * 
* 类名称：微信菜单
* 类描述： 
* @author FH QQ 313596790[青苔]
* 作者单位： 
* 联系方式：
* 修改时间：2015年12月16日
* @version 2.0
 */
public class WechatMenu {

	private String NAME;			//名称
	private String NAME_EN;			//英文名称
	private String BIANMA;			//编码
	private String ORDER_BY;		//排序	
	private String PARENT_ID;		//上级ID
	private String BZ;				//备注
	private String TBSNAME;			//关联表
	private String DICTIONARIES_ID;	//主键
	private String TYPE;	//菜单类型
	private String KEE;	//菜单编号
	private String URL;	//网页地址
	private String MEDIA_ID;	//多媒体编号
	private String APPID;	//小程序ID
	private String PAGEPATH;	//小程序页面
	private String target;
	private WechatMenu dict;
	private List<WechatMenu> subDict;
	private boolean hasDict = false;
	private String treeurl;
	
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getNAME_EN() {
		return NAME_EN;
	}
	public void setNAME_EN(String nAME_EN) {
		NAME_EN = nAME_EN;
	}
	public String getBIANMA() {
		return BIANMA;
	}
	public void setBIANMA(String bIANMA) {
		BIANMA = bIANMA;
	}
	public String getORDER_BY() {
		return ORDER_BY;
	}
	public void setORDER_BY(String oRDER_BY) {
		ORDER_BY = oRDER_BY;
	}
	public String getPARENT_ID() {
		return PARENT_ID;
	}
	public void setPARENT_ID(String pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	public String getTBSNAME() {
		return TBSNAME;
	}
	public void setTBSNAME(String tBSNAME) {
		TBSNAME = tBSNAME;
	}
	public String getDICTIONARIES_ID() {
		return DICTIONARIES_ID;
	}
	public void setDICTIONARIES_ID(String dICTIONARIES_ID) {
		DICTIONARIES_ID = dICTIONARIES_ID;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public WechatMenu getDict() {
		return dict;
	}
	public void setDict(WechatMenu dict) {
		this.dict = dict;
	}
	public List<WechatMenu> getSubDict() {
		return subDict;
	}
	public void setSubDict(List<WechatMenu> subDict) {
		this.subDict = subDict;
	}
	public boolean isHasDict() {
		return hasDict;
	}
	public void setHasDict(boolean hasDict) {
		this.hasDict = hasDict;
	}
	public String getTreeurl() {
		return treeurl;
	}
	public void setTreeurl(String treeurl) {
		this.treeurl = treeurl;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getKEE() {
		return KEE;
	}
	public void setKEE(String kEE) {
		KEE = kEE;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public String getMEDIA_ID() {
		return MEDIA_ID;
	}
	public void setMEDIA_ID(String mEDIA_ID) {
		MEDIA_ID = mEDIA_ID;
	}
	public String getAPPID() {
		return APPID;
	}
	public void setAPPID(String aPPID) {
		APPID = aPPID;
	}
	public String getPAGEPATH() {
		return PAGEPATH;
	}
	public void setPAGEPATH(String pAGEPATH) {
		PAGEPATH = pAGEPATH;
	}
	
}
