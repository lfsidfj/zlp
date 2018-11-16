package spiderman.wechat.domain.receive;

public class ScanCodeInfo {
	private String ScanType;//扫描类型，一般是qrcode
	private String ScanResult;//扫描结果，即二维码对应的字符串信息
	public String getScanType() {
		return ScanType;
	}
	public void setScanType(String scanType) {
		ScanType = scanType;
	}
	public String getScanResult() {
		return ScanResult;
	}
	public void setScanResult(String scanResult) {
		ScanResult = scanResult;
	}
}
