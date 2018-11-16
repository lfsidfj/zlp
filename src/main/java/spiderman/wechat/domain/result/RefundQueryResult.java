package spiderman.wechat.domain.result;


/**
 * 退款查询返回结果
 * @author spiderman
 * 2017年6月2日上午10:31:17
 */
public class RefundQueryResult extends BaseWechatResult{
	
	private String return_code;
	private String return_msg;
	private String result_code;
	private String err_code;
	private String err_code_des;
	
	private String appid;
	private String mch_id;
	private String nonce_str;
	private String sign;
	private String transaction_id;
	private String out_trade_no;
	private Integer total_fee;
	private Integer settlement_total_fee ;
	private String fee_type;
	private Integer cash_fee;
	private Integer refund_count;
	private String out_refund_no_0;
	private String refund_id_0;
	private String refund_channel_0;
	private Integer refund_fee_0;
	private Integer settlement_refund_fee_0;
	private String coupon_type_0;
	private Integer coupon_refund_fee_0;
	private Integer coupon_refund_count_0;
	private String coupon_refund_id_0_0;
	private Integer coupon_refund_fee_0_0;
	private String refund_status_0;
	private String refund_account_0;
	private String refund_recv_accout_0;
	private String refund_success_time_0;
	private Integer refund_fee;
	
	@Override
	public String getMessage() {
		return getReturn_msg();
	}
	@Override
	public boolean isSuccess() {
		return "SUCCESS".equals(result_code);
	}
	public String getReturn_code() {
		return return_code;
	}
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}
	public String getReturn_msg() {
		return return_msg;
	}
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}
	public String getResult_code() {
		return result_code;
	}
	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}
	public String getErr_code() {
		return err_code;
	}
	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}
	public String getErr_code_des() {
		return err_code_des;
	}
	public void setErr_code_des(String err_code_des) {
		this.err_code_des = err_code_des;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public Integer getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(Integer total_fee) {
		this.total_fee = total_fee;
	}
	public Integer getSettlement_total_fee() {
		return settlement_total_fee;
	}
	public void setSettlement_total_fee(Integer settlement_total_fee) {
		this.settlement_total_fee = settlement_total_fee;
	}
	public String getFee_type() {
		return fee_type;
	}
	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}
	public Integer getCash_fee() {
		return cash_fee;
	}
	public void setCash_fee(Integer cash_fee) {
		this.cash_fee = cash_fee;
	}
	public Integer getRefund_count() {
		return refund_count;
	}
	public void setRefund_count(Integer refund_count) {
		this.refund_count = refund_count;
	}
	public String getOut_refund_no_0() {
		return out_refund_no_0;
	}
	public void setOut_refund_no_0(String out_refund_no_0) {
		this.out_refund_no_0 = out_refund_no_0;
	}
	public String getRefund_id_0() {
		return refund_id_0;
	}
	public void setRefund_id_0(String refund_id_0) {
		this.refund_id_0 = refund_id_0;
	}
	public String getRefund_channel_0() {
		return refund_channel_0;
	}
	public void setRefund_channel_0(String refund_channel_0) {
		this.refund_channel_0 = refund_channel_0;
	}
	public Integer getRefund_fee_0() {
		return refund_fee_0;
	}
	public void setRefund_fee_0(Integer refund_fee_0) {
		this.refund_fee_0 = refund_fee_0;
	}
	public Integer getSettlement_refund_fee_0() {
		return settlement_refund_fee_0;
	}
	public void setSettlement_refund_fee_0(Integer settlement_refund_fee_0) {
		this.settlement_refund_fee_0 = settlement_refund_fee_0;
	}
	public String getCoupon_type_0() {
		return coupon_type_0;
	}
	public void setCoupon_type_0(String coupon_type_0) {
		this.coupon_type_0 = coupon_type_0;
	}
	public Integer getCoupon_refund_fee_0() {
		return coupon_refund_fee_0;
	}
	public void setCoupon_refund_fee_0(Integer coupon_refund_fee_0) {
		this.coupon_refund_fee_0 = coupon_refund_fee_0;
	}
	public Integer getCoupon_refund_count_0() {
		return coupon_refund_count_0;
	}
	public void setCoupon_refund_count_0(Integer coupon_refund_count_0) {
		this.coupon_refund_count_0 = coupon_refund_count_0;
	}
	public String getCoupon_refund_id_0_0() {
		return coupon_refund_id_0_0;
	}
	public void setCoupon_refund_id_0_0(String coupon_refund_id_0_0) {
		this.coupon_refund_id_0_0 = coupon_refund_id_0_0;
	}
	public Integer getCoupon_refund_fee_0_0() {
		return coupon_refund_fee_0_0;
	}
	public void setCoupon_refund_fee_0_0(Integer coupon_refund_fee_0_0) {
		this.coupon_refund_fee_0_0 = coupon_refund_fee_0_0;
	}
	public String getRefund_status_0() {
		return refund_status_0;
	}
	public void setRefund_status_0(String refund_status_0) {
		this.refund_status_0 = refund_status_0;
	}
	public String getRefund_account_0() {
		return refund_account_0;
	}
	public void setRefund_account_0(String refund_account_0) {
		this.refund_account_0 = refund_account_0;
	}
	public String getRefund_recv_accout_0() {
		return refund_recv_accout_0;
	}
	public void setRefund_recv_accout_0(String refund_recv_accout_0) {
		this.refund_recv_accout_0 = refund_recv_accout_0;
	}
	public String getRefund_success_time_0() {
		return refund_success_time_0;
	}
	public void setRefund_success_time_0(String refund_success_time_0) {
		this.refund_success_time_0 = refund_success_time_0;
	}
	public Integer getRefund_fee() {
		return refund_fee;
	}
	public void setRefund_fee(Integer refund_fee) {
		this.refund_fee = refund_fee;
	}
	
	
}
