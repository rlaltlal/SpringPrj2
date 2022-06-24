package com.green.pds.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.pds.dao.PdsDao;
import com.green.pds.service.PdsService;
import com.green.pds.vo.FilesVo;
import com.green.pds.vo.PdsVo;

@Service("pdsService")
public class PdsServiceImpl implements PdsService {

	@Autowired
	private PdsDao pdsDao;
	
	@Override
	public void setWrite(HashMap<String, Object> map, HttpServletRequest request) {
		//1. request처리(넘어온 파일처리) 2. 넘어온 정보 db 저장

		//1.
		PdsFile.save(map, request); // 별도 클래스 생성
		
		//2.
		pdsDao.setWrite(map);

	}

	@Override
	public List<PdsVo> getPdsList(HashMap<String, Object> map) {
		List<PdsVo> list=null;
		list=pdsDao.getPdsList(map);
		return list;
	}

	@Override
	public PdsVo getPdsView(HashMap<String, Object> map) {
		PdsVo vo=null;
		vo=pdsDao.getPdsView(map);
		return vo;
	}

	@Override
	public List<FilesVo> getFilesList(HashMap<String, Object> map) {
		List<FilesVo> list=null;
		list=pdsDao.getFilesList(map);
		return list;
	}

	@Override
	public void deletePds(HashMap<String, Object> map) {
		// 1. db정보 삭제 + map에 sfilename 추가 2. c:/upload/map.sfilename 파일 삭제 
		pdsDao.deletePds(map);
		// map : {idx=20, menu_id=MENU04, filesList=[PdsVo [idx=20, title=jQuery 게시물 줄바꿈, cont=null, 
		//writter=sky, regdate=2022-05-26 17:18.56, readcount=5, bnum=20, lvl=0, step=0, nref=20, 
		// menu_id=MENU04, menu_name=null, menu_seq=0, filescount=0], ...
		List<FilesVo> filesList=(List<FilesVo>)map.get("filesList");
		for (FilesVo filesVo : filesList) {
			String delFile=filesVo.getSfilename();
			System.out.println(delFile);
			File file=new File("c:\\upload\\"+delFile);
			if(file.exists())
				file.delete();
		}
		
	}

	@Override
	public void setUpdate(HashMap<String, Object> map, HttpServletRequest request) {
		// 넘어온 파일만 저장(request) + 글 수정(map)
		// map : {file0=05-포트(1).hwp, idx=22, title=asdad, cont=wq, menu_id=MENU04, 
		// filesList=[FilesVo [file_num=0, idx=0, filename=21.jpg, 
		// fileext=.jpg, sfilename=21_1.jpg]]}

		PdsFile.save(map, request);
		pdsDao.setUpdate(map);
	}

	@Override
	public void deleteUploadedFile(HashMap<String, Object> map) {
		// c:/upload/ 해당파일 삭제 + files table 데이터 삭제
		String sfilename=(String)map.get("sfilename");
		String filePath="c:\\upload\\";
		String fileName=filePath+sfilename;
		File file=new File(fileName);
		if(file.exists()) {
			file.delete();
		}
		pdsDao.deleteUploadedFile(map);
		
	}

}
