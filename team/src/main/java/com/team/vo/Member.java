package com.team.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String email;
	private String password;
	private Date regdate;
	private String name;
	private String phone;
	private String demartment;
	private String position;
	private boolean deleted;
	
	private Address address;
}
