package com.szjm.entity.zlp;

import java.io.Serializable;
import java.util.List;

/** 
 * 说明：合同分类 实体类
 * 创建人：FB
 * 创建时间：2017-07-31
 */
public class ContractType implements Serializable {
	
	private String CONTRACTTYPE_ID;	//主键
	private String NAME;					//名称
	private String PARENT_ID;				//父类ID
	private String target;
	private ContractType contracttype;
	private List<ContractType> subContractType;
	private boolean hasContractType = false;
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

	public String getCONTRACTTYPE_ID() {
		return CONTRACTTYPE_ID;
	}
	public void setCONTRACTTYPE_ID(String CONTRACTTYPE_ID) {
		this.CONTRACTTYPE_ID = CONTRACTTYPE_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String NAME) {
		this.NAME = NAME;
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
	public ContractType getContractType() {
		return contracttype;
	}
	public void setContractType(ContractType contracttype) {
		this.contracttype = contracttype;
	}
	public List<ContractType> getSubContractType() {
		return subContractType;
	}
	public void setSubContractType(List<ContractType> subContractType) {
		this.subContractType = subContractType;
	}
	public boolean isHasContractType() {
		return hasContractType;
	}
	public void setHasContractType(boolean hasContractType) {
		this.hasContractType = hasContractType;
	}
	public String getTreeurl() {
		return treeurl;
	}
	public void setTreeurl(String treeurl) {
		this.treeurl = treeurl;
	}
	
}
