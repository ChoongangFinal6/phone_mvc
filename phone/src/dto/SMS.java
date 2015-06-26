package dto;

import java.util.Date;

public class SMS {
	int smsNo;
	String sendId;
	String recvId;
	String content;
	Date sendDate;
	String image;
	String read;	
	String deleted;
	
	// 정보전달용 멤버변수
	int numOfNew;
	
	public SMS() {}
	public SMS(String sendId, String recvId, String content) {
		this.sendId = sendId;
		this.recvId = recvId;
		this.content = content;
	}
	
	public int getNumOfNew() {
		return numOfNew;
	}
	public void setNumOfNew(int numOfNew) {
		this.numOfNew = numOfNew;
	}
	
	
	public int getSmsNo() {
		return smsNo;
	}
	public void setSmsNo(int smsNo) {
		this.smsNo = smsNo;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getRecvId() {
		return recvId;
	}
	public void setRecvId(String recvId) {
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
