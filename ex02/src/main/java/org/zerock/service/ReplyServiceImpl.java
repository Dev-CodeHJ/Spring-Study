package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register........." + vo);
		return mapper.insert(vo);
	}
	
	@Override
	public int modify(ReplyVO vo) {
		log.info("modify........." + vo);
		return mapper.update(vo);
	}
	
	@Override
	public int remove(Long rno) {
		log.info("remove........." + rno);
		return mapper.delete(rno);
	}
	
	@Override
	public ReplyVO getReply(Long rno) {
		log.info("getReply........." + rno);
		return mapper.findByRno(rno);
	}
	
	@Override
	public List<ReplyVO> replyList(Long bno) {
		log.info("replyList........." + bno);
		return mapper.findAllReply(bno);
	}
}
