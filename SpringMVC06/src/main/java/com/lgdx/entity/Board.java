package com.lgdx.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Board {
	
	// SQL문 아닌 Entity 라이브러리를 활용한 제약조건 부여
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idx; // Primary Key 지정, 크기가 큰 Long 타입 적용
	
	private String title;
	
	@Column(length = 2000)
	private String contents;
	
	@Column(updatable = false)
	private String writer;
	
	@Column(insertable = false, updatable = false, columnDefinition = "int default 0")
	private Long count;
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	private Date indate; // 날짜형 Date 타입 적용
	
}

