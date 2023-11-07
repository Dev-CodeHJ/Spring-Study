package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {

//	private Long[] bnoArr = {4L, 5L, 6L, 7L, 8L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
//	@Test public void testFindByRno() {
//		Long targetRno = 6L;
//		ReplyVO vo = mapper.findByRno(targetRno);
//		log.info(vo);
//	}
//	
//	@Test public void testDelete() {
//		Long targetRno = 1L;
//		mapper.delete(targetRno);
//	}
//	
//	@Test
//	public void testCreate() {
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			ReplyVO vo = new ReplyVO();
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트" + i);
//			vo.setReplyer("replyer" + i);
//			mapper.insert(vo);
//		});
//	}
//	
//	@Test
//	public void testMapper() {
//		log.info(mapper);
//	}
//	
//	@Test
//	public void testUpdate() {
//		Long targetRno = 3L;
//		ReplyVO vo = mapper.findByRno(targetRno);
//		vo.setReply("Update Reply");
//		int count = mapper.update(vo);
//		log.info("update count : " + count);
//	}
	
	@Test
	public void testFindAllReply() {
		Long targetBno = 6L;
		List<ReplyVO> rnoList = mapper.findAllReply(targetBno);
		log.info(rnoList);
	}
}