package spiderman.wechat.domain.param;

/**
 * 退款,字段含义详见https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_4
 * @author 战马
 * @email java@beyondstar.com.cn 
 *        battle_steed@163.com
 * @company 深圳市星超越科技有限公司
 */
public class RefundSend extends OrderSend {
	/**
	 * 操作员帐号, 默认为商户号
	 */
	private String op_user_id;
	private String refund_fee_type;
	/**
	 * 退款总金额，订单总金额，单位为分，
	 */
	private Integer refund_fee;
	/**
	 * 订单总金额，单位为分，只能为整数，详见
	 */
	private Integer total_fee;
	/**
	 * 商户系统内部的退款单号，商户系统内部唯一，同一退款单号多次请求只退一笔
	 */
	private String out_refund_no;
	/**
	 *  	终端设备号
	 */
	private String device_info;
	/**
	 * 微信订单号
	 */
	private String transaction_id;

	public String getTransaction_id() {
		return transaction_id;
	}

	public String getOp_user_id() {
		return op_user_id;
	}

	public void setOp_user_id(String op_user_id) {
		this.op_user_id = op_user_id;
	}
	public Integer getRefund_fee() {
		return refund_fee;
	}

	public void setRefund_fee(Integer refund_fee) {
		this.refund_fee = refund_fee;
	}

	public Integer getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(Integer total_fee) {
		this.total_fee = total_fee;
	}

	public String getRefund_fee_type() {
		return refund_fee_type;
	}

	public void setRefund_fee_type(String refund_fee_type) {
		this.refund_fee_type = refund_fee_type;
	}

	
	public String getOut_refund_no() {
		return out_refund_no;
	}

	public void setOut_refund_no(String out_refund_no) {
		this.out_refund_no = out_refund_no;
	}

	public String getDevice_info() {
		return device_info;
	}

	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}

	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	
}
