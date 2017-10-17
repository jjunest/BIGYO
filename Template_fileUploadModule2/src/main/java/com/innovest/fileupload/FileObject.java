package com.innovest.fileupload;

public class FileObject {
	/**
	 * 업로드한 이미지 파일이 저장될 경로
	 */
	public static final String IMAGE_DIR = "/example/resources/";
	// 저장해야 할 것들 :
	/*
	 * IDX NUMBER, BOARD_IDX NUMBER NOT NULL, ORIGINAL_FILE_NAME VARCHAR2(260 BYTE)
	 * NOT NULL, STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL, FILE_SIZE NUMBER,
	 * CREA_DTM DATE DEFAULT SYSDATE NOT NULL, CREA_ID VARCHAR2(30 BYTE) NOT NULL,
	 * DEL_GB VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL, PRIMARY KEY (IDX)
	 */
	private String id;
	private String contentType;
	private int contentLength;
	private String fileName;

	public FileObject(String id, String contentType, int contentLength, String fileName) {
		this.id = id;
		this.contentType = contentType;
		this.contentLength = contentLength;
		this.fileName = fileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public int getContentLength() {
		return contentLength;
	}

	public void setContentLength(int contentLength) {
		this.contentLength = contentLength;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
