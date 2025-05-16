package com.lgdx.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.lgdx.entity.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {

	// T : DB와 주고 받으려는 데이터 타입
	// ID : SQL에서 주고 받는 @ID 지정 데이터 타입

	// 사용자 정의 메소드 생성
	@Transactional
	@Modifying
	@Query("UPDATE Board b SET b.count = b.count + 1 WHERE b.idx = :idx")
	void count(@Param("idx") Long idx);
}
