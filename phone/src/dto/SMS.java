package dto;

import java.util.Date;

public class SMS {
	int sendId;
	int recvId;
	String content;
	Date sendDate;
	String image;
	String read;	
	String deleted;
	
	// 정보전달용 멤버변수
	int numOfNew;
	
	
	public int getNumOfNew() {
		return numOfNew;
	}
	public void setNumOfNew(int numOfNew) {
		this.numOfNew = numOfNew;
	}
	public int getSendId() {
		return sendId;
	}
	public void setSendId(int sendId) {
		this.sendId = sendId;
	}
	public int getRecvId() {
		return recvId;
	}
	public void setRecvId(int recvId) {
		this.recvId = recvId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String delete) {
		this.deleted = delete;
	}
	
	
}
