package spiderman.wechat.domain.send;

public class ImageMessage extends BaseMessage {
	
	private Image Image = new Image();
	
	public ImageMessage() {
		super();
		setMsgType("image");
		// TODO Auto-generated constructor stub
	}

	public Image getImage() {
		return Image;
	}

	public void setImage(Image image) {
		Image = image;
	}
	
}
