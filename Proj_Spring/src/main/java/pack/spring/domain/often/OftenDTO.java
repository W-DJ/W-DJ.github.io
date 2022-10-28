package pack.spring.domain.often;

public class OftenDTO {
private int num;
private String aId;
private String aName;
private String subject;
private String qnaType;
private String content;
private String regTM;
private  int readCnt;
private String fileName;
private int   fileSize;

public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}

public String getaId() {
	return aId;
}
public void setaId(String aId) {
	this.aId = aId;
}
public String getaName() {
	return aName;
}
public void setaName(String aName) {
	this.aName = aName;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getQnaType() {
	return qnaType;
}
public void setQnaType(String qnaType) {
	this.qnaType = qnaType;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getRegTM() {
	return regTM;
}
public void setRegTM(String regTM) {
	this.regTM = regTM;
}
public int getReadCnt() {
	return readCnt;
}
public void setReadCnt(int readCnt) {
	this.readCnt = readCnt;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public int getFileSize() {
	return fileSize;
}
public void setFileSize(int fileSize) {
	this.fileSize = fileSize;
}

@Override
public String toString() {
	return "OftenDTO [num=" +num+", aId="+aId +", aName="+aName+",subject="+subject+",qnaType="+qnaType+
			",content="+content+",regTM="+regTM+",readCnt="+readCnt+",fileName ="+fileName+"fileSize ="+fileSize+"]";
}
}
