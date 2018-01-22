//package com.bootdo.clouddoadmin;
//
//import com.bootdo.clouddoadmin.utils.JwtUtils;
//import com.bootdo.clouddoadmin.vo.UserToken;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class ClouddoAdminApplicationTests {
//
//	@Test
//	public void contextLoads() {
//		UserToken userToken = new UserToken("admin",1L,"管理员");
//		String jwt = null;
//		try {
//			jwt = JwtUtils.generateToken(userToken,1);
//			Thread.sleep(100);
//			UserToken userToken1 = JwtUtils.getInfoFromToken(jwt);
//			System.out.println(userToken1);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
//
//}
