package com.lgdx.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgdx.entity.Board;
import com.lgdx.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository repository;
	
	public List<Board> boardList() {
		
		return repository.findAll();
		
	}

	public Board boardContents(Long idx) {
		
		Optional<Board> vo = repository.findById(idx);
		
		return vo.get();
		
	}

	public void boardInsert(Board vo) {
		
		repository.save(vo);
		
	}

	public void boardDelete(Long idx) {
		
		repository.deleteById(idx);
		
	}

	public void boardUpdate(Board vo) {
		
		// 게시글 추가(Insert)와 수정(Update)의 차이는?
		// Long idx 값으로 특정 게시글로 구분되냐 안되냐의 차이
		repository.save(vo);
		
	}

	public void boardCounts(Long idx) {
		
		// count() 기능이 있긴 하지만 
		// 매개변수 idx 사용가능한 건 레파지토리에 없음 직접 생성 필요!
		repository.count(idx);
		
	}

}
