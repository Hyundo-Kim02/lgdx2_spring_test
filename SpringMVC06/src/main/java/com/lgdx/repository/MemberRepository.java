package com.lgdx.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lgdx.entity.Member;

@Repository // JpaRepository로부터 상속을 받아 Repository 기능 활용
public interface MemberRepository extends JpaRepository<Member, String> {

	Member findByIdAndPw(String id, String pw);
	
	
}
