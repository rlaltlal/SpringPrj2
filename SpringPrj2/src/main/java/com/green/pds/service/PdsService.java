package com.green.pds.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.pds.vo.FilesVo;
import com.green.pds.vo.PdsVo;

public interface PdsService {

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);

	List<PdsVo> getPdsList(HashMap<String, Object> map);

	PdsVo getPdsView(HashMap<String, Object> map);

	List<FilesVo> getFilesList(HashMap<String, Object> map);

	void deletePds(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void deleteUploadedFile(HashMap<String, Object> map);

}
