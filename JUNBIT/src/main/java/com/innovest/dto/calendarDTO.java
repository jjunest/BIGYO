package com.innovest.dto;
import java.sql.Date;


public class calendarDTO {
	public Integer calendar_rcdno;
	public String calendar_title;
	public String calendar_url;
	public Date calendar_start;
	public Date calendar_end;
	public String calendar_etc1;
	public String calendar_etc2;
	public String calendar_etc3;
	
	
	
	public calendarDTO(Integer calendar_rcdno, String calendar_title, String calendar_url,
			Date calendar_start, Date calendar_end, String calendar_etc1, String calendar_etc2,
			String calendar_etc3) {
		super();
		this.calendar_rcdno = calendar_rcdno;
		this.calendar_title = calendar_title;
		this.calendar_url = calendar_url;
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
		this.calendar_etc1 = calendar_etc1;
		this.calendar_etc2 = calendar_etc2;
		this.calendar_etc3 = calendar_etc3;
	}
	public calendarDTO(String calendar_title, String calendar_url, Date calendar_start,
			Date calendar_end, String calendar_etc1, String calendar_etc2, String calendar_etc3) {
		super();
		this.calendar_title = calendar_title;
		this.calendar_url = calendar_url;
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
		this.calendar_etc1 = calendar_etc1;
		this.calendar_etc2 = calendar_etc2;
		this.calendar_etc3 = calendar_etc3;
	}
	public Integer getCalendar_rcdno() {
		return calendar_rcdno;
	}
	public void setCalendar_rcdno(Integer calendar_rcdno) {
		this.calendar_rcdno = calendar_rcdno;
	}
	public String getCalendar_title() {
		return calendar_title;
	}
	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}
	public String getCalendar_url() {
		return calendar_url;
	}
	public void setCalendar_url(String calendar_url) {
		this.calendar_url = calendar_url;
	}
	public Date getCalendar_start() {
		return calendar_start;
	}
	public void setCalendar_start(Date calendar_start) {
		this.calendar_start = calendar_start;
	}
	public Date getCalendar_end() {
		return calendar_end;
	}
	public void setCalendar_end(Date calendar_end) {
		this.calendar_end = calendar_end;
	}
	public String getCalendar_etc1() {
		return calendar_etc1;
	}
	public void setCalendar_etc1(String calendar_etc1) {
		this.calendar_etc1 = calendar_etc1;
	}
	public String getCalendar_etc2() {
		return calendar_etc2;
	}
	public void setCalendar_etc2(String calendar_etc2) {
		this.calendar_etc2 = calendar_etc2;
	}
	public String getCalendar_etc3() {
		return calendar_etc3;
	}
	public void setCalendar_etc3(String calendar_etc3) {
		this.calendar_etc3 = calendar_etc3;
	}
	
	
	
	
	
}
