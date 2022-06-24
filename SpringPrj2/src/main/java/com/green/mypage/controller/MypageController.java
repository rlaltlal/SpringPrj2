package com.green.mypage.controller;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.vo.BoardPager;
import com.green.board.vo.BoardVo;
import com.green.mypage.service.MypageService;
import com.green.mypage.vo.Criteria;
import com.green.mypage.vo.MyinformVo;
import com.green.mypage.vo.MypageVo;
import com.green.mypage.vo.MypostVo;
import com.green.mypage.vo.MyquestVo;
import com.green.mypage.vo.PageDTO;
import com.green.mypage.vo.UserVo;

@Controller
@RequestMapping("/Mypage")
public class MypageController {
	
	@Autowired
	private  MypageService   mypageService;
	
	//  내 예약 내역 페이지
	@SuppressWarnings({ "unchecked", "null" })
	@RequestMapping("/Myreserv")
	public  ModelAndView   reservList(String email) {
		MyinformVo vo = mypageService.myInform(email);
 		Map<String, Object> reservMap  =  mypageService.getReservList( email );
		List<MypageVo> reservList = (List<MypageVo>) reservMap.get("accomReservList");
		List<MypageVo> reservList2 = (List<MypageVo>) reservMap.get("trainReservList");
		List<MypageVo> reservDateList = (List<MypageVo>) reservMap.get("reservDateList");
		reservList.addAll(reservList2);
		reservList = reservList.stream().sorted(Comparator.comparing(MypageVo::getUsetime)).collect(Collectors.toList());
		reservDateList = reservDateList.stream().sorted(Comparator.comparing(MypageVo::getUsedate)).collect(Collectors.toList());
//		System.out.println(reservList);
		ModelAndView   mv  = new ModelAndView();
		mv.addObject("vo", vo);		
		mv.addObject("reservList", reservList);		
		mv.addObject("reservDateList", reservDateList);		
		mv.setViewName("mypage/myreserv");  
		return  mv; 
	}
	
	//  내 예약 - 상세조회
	@RequestMapping("/Myreservcont")
	public  ModelAndView   reservCont(@RequestParam HashMap <String, Object> map) {
		MypageVo reservVo  =  mypageService.getReservCont( map );
		
	//	System.out.println(reservVo);
		
		ModelAndView   mv  = new ModelAndView();
		mv.addObject("reservcont", reservVo);		
		mv.setViewName("mypage/myreservcont");  
		return  mv; 
	}
	
	// 상세 조회 -> 예약 취소 전 화면
	@RequestMapping("/CancelPage")
	public ModelAndView cancelPage(@RequestParam HashMap<String, Object> map, String email) {
		MypageVo cancelVo  =  mypageService.getReservCancel( map );
		ModelAndView   mv  = new ModelAndView();
		mv.addObject("email", email);
		mv.addObject("cancelVo", cancelVo);		
		mv.setViewName("mypage/reservcancel"); 
		
		return mv;
	}
	
	//  예약 취소
	@RequestMapping("/Myreservcancel")
	public  ModelAndView   reservCanael(@RequestParam HashMap <String, Object> map) {
		
		mypageService.reservCancel(map);
		MypageVo reservVo  =  mypageService.getReservCont( map );		
		ModelAndView   mv  = new ModelAndView();
		mv.addObject("reservcont", reservVo);		
		mv.setViewName("mypage/myreservcont");  
		return  mv; 
	}
	
	// 내 글보기
	@RequestMapping("/Mypost")
	public  ModelAndView   myPost(String email, Criteria cri) {
		MyinformVo vo = mypageService.myInform(email);			
		List<MypostVo>  myPostList = mypageService.getMyPostList( email , cri);
		List<MyquestVo> myQuestList = mypageService.getMyQuestList( email );
		int total = mypageService.getTotalCount(email);
		ModelAndView   mv  = new ModelAndView();
	//	System.out.println();
		mv.addObject("vo", vo);		
		mv.addObject("myPostList", myPostList);		
		mv.addObject("myQuestList", myQuestList);	
		
		mv.addObject("pageMaker", new PageDTO(cri, total));
		mv.setViewName("mypage/mypost");  
		return  mv; 
	}
	
	
	// 사용자 글보기 (사용자 이메일)
	@RequestMapping("/Userpost")
	public  ModelAndView   userPost(String email, Criteria cri) {
		List<MypostVo>  myPostList = mypageService.getMyPostList( email, cri);
		
		int total = mypageService.getTotalCount(email);
		
		ModelAndView   mv  = new ModelAndView();
		mv.addObject("email", email);		
		mv.addObject("myPostList", myPostList);		
		
		mv.addObject("pageMaker", new PageDTO(cri, total));
		mv.setViewName("mypage/userpost");  
		return  mv; 
	}
	// 내 글수정
	@RequestMapping("/MypostModify")
	public  ModelAndView   myPostModify(int bseq) {
		ModelAndView  mv  = new  ModelAndView();
		return  mv; 
	}
	
	// 내 게시글 삭제
	@RequestMapping("/MypostDelete")
	public  ModelAndView   myPostDelete(int bseq, String email, int pageNum) {
			
	mypageService.myPostDelete( bseq );
	

	ModelAndView  mv  = new  ModelAndView();

	mv.setViewName("redirect:/Mypage/Mypost?email=" + email + "&pageNum=" +pageNum);
	return  mv;
	}
	
	//내 문의글 삭제
	@RequestMapping("/MyquestDelete")
	public  ModelAndView   myQuestDelete(int qseq, String email, int pageNum) {
			
	mypageService.myQuestDelete( qseq );
	

	ModelAndView  mv  = new  ModelAndView();

	mv.setViewName("redirect:/Mypage/Mypost?email=" + email + "&pageNum=" +pageNum);
	return  mv;
	}
	
	// 내 글 삭제
	@RequestMapping("/MypostDelete2")
	public  ModelAndView   myPostDelete2(int bseq, String email, int pageNum) {
			
	mypageService.myPostDelete( bseq );
	

	ModelAndView  mv  = new  ModelAndView();

	mv.setViewName("redirect:/Mypage/Userpost?email=" + email + "&pageNum=" +pageNum);
	return  mv;
	}

	// 내 정보 불러오기
	@RequestMapping("/Myinform")
	public  ModelAndView   myInformModify(String email) {
		MyinformVo vo2 = mypageService.myInform(email);
		int rt = mypageService.rateCal(email);
		String rate = "";
		if (vo2.getRate().equals("MASTER")) {
			rate="MASTER";
		} else {
			if ( rt < 3 ) { 
				rate = "BRONZE";		
			} else if ( rt < 10) {
				rate = "SILVER";
			} else {
				rate = "GOLD";
			}
		}		
		mypageService.rateUpdate(email, rate);
		
		MyinformVo vo = mypageService.myInform(email);
		ModelAndView  mv  = new  ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("mypage/myinform");
		return  mv; 
	}
	
	// 내 정보 수정하기
	@RequestMapping("/MyinformUpdate")
	public  ModelAndView   myInformUpdate(MyinformVo vo) {
		mypageService.myInformUpdate(vo);
		String email = vo.getEmail();
		MyinformVo vo2 = mypageService.myInform(email);
		ModelAndView  mv  = new  ModelAndView();
		mv.addObject("vo", vo2);
		mv.setViewName("mypage/myinform");
		return  mv; 
	}
	
	// 등급 조건 팝업
	@RequestMapping("/Gradealert")
	public String gradeAlert() {
		return "mypage/gradealert";
	}
	
	// 예약 완료 날짜 조회
	@RequestMapping("/Mylog")
	public ModelAndView myLog(@RequestParam HashMap<String, Object> map, String email) {		
		List<MypageVo> myLogList = mypageService.getMyLogList(map); 
		MyinformVo vo = mypageService.myInform(email);
		ModelAndView  mv  = new  ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("email",email);
		mv.addObject("myLogList", myLogList);
		mv.setViewName("mypage/mylog");
		return mv;
	}
	
	@RequestMapping("/MylogDetail")
	public ModelAndView myLogDetail(@RequestParam HashMap<String, Object> map, String email) {
		List<MypageVo> myLogList = mypageService.getMyLogList(map); 
		List<MypageVo> myTripLog = mypageService.getMyTripLog(map);
		myTripLog = myTripLog.stream().sorted(Comparator.comparing(MypageVo::getUsetime)).collect(Collectors.toList());
		MyinformVo vo = mypageService.myInform(email);
	//	System.out.println( myLogList );
	//	System.out.println(myTripLog);
		ModelAndView  mv  = new  ModelAndView();
		mv.addObject("email",email);
		mv.addObject("vo",vo);
		mv.addObject("myLogList", myLogList);
		mv.addObject("myTripLog", myTripLog);
		mv.setViewName("mypage/mylog2");
		return mv;
	}
	
	// 환불 규정 팝업
	@RequestMapping("/Refund")
	public String refund() {
		return "mypage/refundalert";
	}
	
	// 회원 관리
	@RequestMapping("/Manage")
	public ModelAndView manage(String email) {
		List<UserVo> userList = mypageService.getUserList();
		for (UserVo userVo : userList) {
			int rt = mypageService.rateCal(userVo.getEmail());
			MyinformVo vo2 = mypageService.myInform(userVo.getEmail());
			String rate = "";
			if (vo2.getRate().equals("MASTER")) {
				rate="MASTER";
			} else {
				if ( rt < 3 ) { 
					rate = "BRONZE";		
				} else if ( rt < 10) {
					rate = "SILVER";
				} else {
					rate = "GOLD";
				}
			}
			
			mypageService.rateUpdate(userVo.getEmail(), rate);
		}	
		MyinformVo vo = mypageService.myInform(email);
		List<UserVo> userList2 = mypageService.getUserList();
		ModelAndView  mv  = new  ModelAndView();
		mv.addObject("userList", userList2);
		mv.addObject("vo", vo);
		mv.setViewName("mypage/manage");
		return mv;
	}
	

	

}
