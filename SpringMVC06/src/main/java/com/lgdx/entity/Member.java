package com.lgdx.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data // Getter, Setter 자동 생성
@Entity // DB 테이블 자동 생성
public class Member {

	@Id // PK 설정
	private String id; // 아이디
	
	private String pw; // 비밀번호
	
	private String nick; // 닉네임
	
	private String addr; // 거주지 주소
	
}
