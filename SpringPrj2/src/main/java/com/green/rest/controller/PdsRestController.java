package com.green.rest.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.pds.service.PdsService;

//@reqmap+@responsebody = restconroller : 리턴을 json, xml형식으로함
@RestController
public class PdsRestController {
	@Autowired
	private PdsService pdsService;
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET,
			headers="Accept=application/json")
	public void deleteFile(@RequestParam HashMap<String,Object> map) {
		//map : file_num=${fileVo.file_num}&sfilename=${fileVo.sfilename}s
		pdsService.deleteUploadedFile(map);
		
	}
}
