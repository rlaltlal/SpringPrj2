package com.green.pds.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.pds.dao.PdsDao;
import com.green.pds.service.PdsService;
import com.green.pds.vo.FilesVo;
import com.green.pds.vo.PdsVo;

@Repository("pdsDao")
public class PdsDaoImpl implements PdsDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void setWrite(HashMap<String, Object> map) {
		int bnum=Integer.parseInt(map.get("bnum").toString());
		if(bnum==0) { //새글
			sqlSession.insert("Pds.PdsInsert",map);			
		}
		else{ //답글
			sqlSession.insert("Pds.UpdateRef",map);			
			sqlSession.insert("Pds.PdsReply",map);			
		}
		sqlSession.insert("Pds.FileInsert",map);

	}

	@Override
	public List<PdsVo> getPdsList(HashMap<String, Object> map) {
		List<PdsVo> list=null;
		list=sqlSession.selectList("Pds.PdsList",map);
		return list;
	}

	@Override
	public PdsVo getPdsView(HashMap<String, Object> map) {
		//글 조회+ 조회수 상승
		PdsVo vo=null;
		sqlSession.update("Pds.UpdateReadcount",map);
		vo=sqlSession.selectOne("Pds.GetPds", map);
		return vo;
	}

	@Override
	public List<FilesVo> getFilesList(HashMap<String, Object> map) {
		List<FilesVo> list=null;
		list=sqlSession.selectList("Pds.PdsFileList", map);
		return list;
	}

	@Override
	public void deletePds(HashMap<String, Object> map) {
		// pdsService 위한 Filesvo 전달
		List<FilesVo> filesList=sqlSession.selectList("Pds.PdsFileList",map);
		map.put("filesList", filesList);
		// 부모 삭제 -> 자식테이블 cascade삭제 보다 자식테이블부터 삭제를 권장 (files idx삭제 -> board idx삭제)
		sqlSession.delete("Pds.DeleteFiles",map);//files 테이블 삭제
		sqlSession.delete("Pds.DeletePds",map);  //board 테이블 삭제
	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {
		// board update + files update(=insert)
		
		sqlSession.update("Pds.UpdatePds",map);
		sqlSession.insert("Pds.FileInsertIntoIdx",map);
	}

	@Override
	public void deleteUploadedFile(HashMap<String, Object> map) {
		sqlSession.delete("Pds.deleteUploadedFile",map);		
	}

}
