package kh.spring.bab.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.board.domain.Board;
import kh.spring.bab.board.model.dao.BoardDao;

@Service
public interface BoardService {
	
	// 공지사항 조회
	public List<Board> selectBoard();
}
