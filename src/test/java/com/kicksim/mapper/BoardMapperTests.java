package com.kicksim.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
 
     
     
		@Autowired
		private BoardMapper mapper;
// 
//     @Test
//     public void testEnroll() {
//         
//         BoardVO vo = new BoardVO();
//         
//         vo.setTitle("mapper test");
//         vo.setContent("mapper test");
//         vo.setmemberId("admin");
//         
//         mapper.enroll(vo);
//         
//     }
//     
 
}
 
