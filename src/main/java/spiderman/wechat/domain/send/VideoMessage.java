package spiderman.wechat.domain.send;

public class VideoMessage extends BaseMessage {
	
	private Video Video=new Video();

	public VideoMessage() {
		super();
		setMsgType("video");
		// TODO Auto-generated constructor stub
	}

	public Video getVideo() {
		return Video;
	}

	public void setVideo(Video video) {
		Video = video;
	}
	
}
