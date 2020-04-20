package com.team.vo;

import java.sql.Time;

import lombok.Data;

@Data
public class Comments {
	private int commentNo;
	private int feedbackNo;
	private String writer;
	private String content;
	private Time writedate;
}
