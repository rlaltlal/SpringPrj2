package com.green.imageboard.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.pds.vo.FilesVo;

public class PdsFile {

	public static void save(HashMap<String, Object> map, HttpServletRequest request) {
		// 1.파일경로 설정. 1-1.없으면 생성
		// 2-1.중복이름 처리 2-2.파일저장하기(c:\\upload) 
		// 2-2-1. upload된 파일마다 반복처리  2-2-2. 중복이름 처리 2-2-3 파일 저장
		
		//1.파일경로 설정
		String filePath="C:\\Users\\82109\\Documents\\카카오톡 받은 파일\\SpringPrj2 (4)\\src\\main\\webapp\\WEB-INF\\resources\\img\\";
		File dir=new File(filePath);
		
		//1-1. 없으면 생성
		if(!dir.exists()) {
			dir.mkdir();
		}
				
		CheckFileName checkFile=new CheckFileName(); //중복체크객체
		
		//2-2.파일저장하기
		MultipartHttpServletRequest multipartHttpServletRequest=
				(MultipartHttpServletRequest) request;
		Iterator<String> iterator= multipartHttpServletRequest.getFileNames(); // write.jsp 파일들에 대한 iterator
		MultipartFile multipartFile=null;
		
		List<FilesVo> filesList=new ArrayList<FilesVo>();
		String fileName=null;
		String orgFileName=null;
		String fileExt=null;
		String sFilename=null;
		
		//2-2-1.upload된 파일마다 반복처리 
		while(iterator.hasNext()) {
			multipartFile=multipartHttpServletRequest.getFile(iterator.next());
			System.out.println("is Empty?");
			if(!multipartFile.isEmpty()) {
				fileName=multipartFile.getOriginalFilename();  // filename 처리
				orgFileName=fileName.substring(0,fileName.lastIndexOf(".")); // 마지막 (.)까지만을 잘라냄
				fileExt=fileName.substring(fileName.lastIndexOf(".")); // (.)부터 끝까지를 잘라냄
				
				//2-2-2.중복이름 처리
				sFilename=checkFile.getCheckFileName(filePath, orgFileName, fileExt);
				
				//2-2-3.파일 저장
				FilesVo vo=new FilesVo(0,0,fileName,fileExt,sFilename);
				filesList.add(vo);
				
				File file=new File(filePath+sFilename);
				System.out.println("here path"+filePath+sFilename);
				try {
					multipartFile.transferTo(file); //실제이름으로 파일 저장
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}// if isempty  ends
		}// while iterator ends
		map.put("filesList", filesList);
	}
	
}
