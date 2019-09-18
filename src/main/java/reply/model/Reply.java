package reply.model;

import org.apache.ibatis.type.Alias;

@Alias("MyReply")
public class Reply {

	private int rpnum;
	private String writer;
	private String reply;
	private String regdate;
	private int replyto;
	private int emo;
	
	public int getRpnum() {
		return rpnum;
	}
	public void setRpnum(int rpnum) {
		this.rpnum = rpnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReplyto() {
		return replyto;
	}
	public void setReplyto(int replyto) {
		this.replyto = replyto;
	}
	public int getEmo() {
		return emo;
	}
	public void setEmo(int emo) {
		this.emo = emo;
	}
	
	
	
}
