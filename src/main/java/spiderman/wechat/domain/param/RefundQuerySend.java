package spiderman.wechat.domain.param;
/**
 * 退款查询
 * @author spiderman
 * 2017年6月2日上午10:18:54
 */
public class RefundQuerySend extends OrderSend {
	/**
	 * 微信订单号
	 */
	private String transaction_id;
	/**
	 * 商户订单号
	 */
	private String out_trade_no;
	/**
	 * 商户退款单号
	 */
	private String out_refund_no;
	/**
	 * 微信退款单号
	 */
	private String refund_id;
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
	public String getOut_refund_no() {
		return out_refund_no;
	}
	public void setOut_refund_no(String out_refund_no) {
		this.out_refund_no = out_refund_no;
	}
	public String getRefund_id() {
		return refund_id;
	}
	public void setRefund_id(String refund_id) {
		this.refund_id = refund_id;
	}
	
}
