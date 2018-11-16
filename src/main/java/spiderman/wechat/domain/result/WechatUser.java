package spiderman.wechat.domain.result;

/**
 * 微信用户
 *
 */
public class WechatUser{
	private static final long serialVersionUID = 1L;
	private String errcode;
	private String errmsg;
	private String openid;
	/**
	 * 用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
	 */
	private Integer sex;

	private String nickname;
	private String province;
	private String city;
	private String country;
	private String headimgurl;
	private String unionid;
	private String[] privilege;
	private String privilegeStr;
	private Integer subscribe;
	private Double integration;
	private String language;
	private Long subscribe_time;
	private String remark;
	private Integer groupid;
	private String tagid_list;
	private String subscribe_scene;
	private Integer qr_scene;
	private String qr_scene_str;
	private String createtime;


	public String getOpenid() {
		return openid;
	}

	public Integer getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(Integer subscribe) {
		this.subscribe = subscribe;
	}

	public Double getIntegration() {
		return integration;
	}

	public void setIntegration(Double integration) {
		this.integration = integration;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public Integer getSex() {
		return sex;
	}
	public String getErrcode() {
		return errcode;
	}

	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}

	public String getUnionid() {
		return unionid;
	}

	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}
	public String[] getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String[] privilege) {
		this.privilege = privilege;
		if (privilege == null) {
			privilegeStr = null;
		}else{
			if (privilege.length > 0) {
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < privilege.length; i++) {
					sb.append(privilege[i]).append(",");
				}
				privilegeStr = sb.substring(0, sb.length() - 1);
			}else {
				privilegeStr = "";
			}
		}
	}

	public String getPrivilegeStr() {
		return privilegeStr;
	}

	public void setPrivilegeStr(String privilegeStr) {
		this.privilegeStr = privilegeStr;
		if (privilegeStr == null) {
			privilege = null;
		}else {
			privilege = privilegeStr.split(",");
		}
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Long getSubscribe_time() {
		return subscribe_time;
	}

	public void setSubscribe_time(Long subscribe_time) {
		this.subscribe_time = subscribe_time;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public String getTagid_list() {
		return tagid_list;
	}

	public void setTagid_list(String tagid_list) {
		this.tagid_list = tagid_list;
	}

	public String getSubscribe_scene() {
		return subscribe_scene;
	}

	public void setSubscribe_scene(String subscribe_scene) {
		this.subscribe_scene = subscribe_scene;
	}

	public Integer getQr_scene() {
		return qr_scene;
	}

	public void setQr_scene(Integer qr_scene) {
		this.qr_scene = qr_scene;
	}

	public String getQr_scene_str() {
		return qr_scene_str;
	}

	public void setQr_scene_str(String qr_scene_str) {
		this.qr_scene_str = qr_scene_str;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public boolean isSuccess() {
		return null == errcode || "".equals(errcode);
	}
}
