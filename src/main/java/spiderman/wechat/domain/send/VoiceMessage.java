package spiderman.wechat.domain.send;

public class VoiceMessage extends BaseMessage {
	private Voice Voice;

	public VoiceMessage() {
		super();
		setMsgType("voice");
		// TODO Auto-generated constructor stub
	}

	public Voice getVoice() {
		return Voice;
	}

	public void setVoice(Voice voice) {
		Voice = voice;
	}
	
}
