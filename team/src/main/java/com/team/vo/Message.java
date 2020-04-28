package com.team.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	private int messageNo;
	private String message;
	private Date sendDate;
	private int chatNo;
}
