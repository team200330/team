package com.team.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Comments {
	private int commentNo;
	private int feedbackNo;
	private String writer;
	private String content;
	private Date writedate;
}
