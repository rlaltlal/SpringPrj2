package com.green.pds.dao;

import java.util.HashMap;
import java.util.List;

import com.green.pds.vo.FilesVo;
import com.green.pds.vo.PdsVo;

public interface PdsDao {

	void setWrite(HashMap<String, Object> map);

	List<PdsVo> getPdsList(HashMap<String, Object> map);

	PdsVo getPdsView(HashMap<String, Object> map);

	List<FilesVo> getFilesList(HashMap<String, Object> map);

	void deletePds(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map);

	void deleteUploadedFile(HashMap<String, Object> map);



}
