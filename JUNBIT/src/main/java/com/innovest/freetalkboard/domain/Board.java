package com.innovest.freetalkboard.domain;

public class Board {
	
	
	private Long id;
	private String subject;
	private String content;
	private String writer;
	private String register_datetime;
	private Integer good_point;
	
	
	public Board(Long id, String subject, String content, String writer, String register_datetime,
			Integer good_point) {
		super();
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.register_datetime = register_datetime;
		this.good_point = good_point;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegister_datetime() {
		return register_datetime;
	}
	public void setRegister_datetime(String register_datetime) {
		this.register_datetime = register_datetime;
	}
	public Integer getGood_point() {
		return good_point;
	}
	public void setGood_point(Integer good_point) {
		this.good_point = good_point;
	}
	
	
	
}
