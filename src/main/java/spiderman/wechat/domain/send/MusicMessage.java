package spiderman.wechat.domain.send;

public class MusicMessage extends BaseMessage {
	private Music Music;

	public MusicMessage() {
		super();
		setMsgType("music");
		// TODO Auto-generated constructor stub
	}

	public Music getMusic() {
		return Music;
	}

	public void setMusic(Music music) {
		Music = music;
	}
	
}
