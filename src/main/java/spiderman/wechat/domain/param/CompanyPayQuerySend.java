package spiderman.wechat.domain.param;
/**
 * 企业付款查询
 * @author spiderman
 * 2017年6月2日上午11:25:47
 */
public class CompanyPayQuerySend extends OrderSend {
	private String partner_trade_no;

	public String getPartner_trade_no() {
		return partner_trade_no;
	}

	public void setPartner_trade_no(String partner_trade_no) {
		this.partner_trade_no = partner_trade_no;
	}
	
}
