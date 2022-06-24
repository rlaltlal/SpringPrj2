package com.green.pds.service.impl;

import java.io.File;

public class CheckFileName {
	//filePath : c:\\upload\\
	//orgFileName : 손흥민
	//fileExt : .jpg
	public String getCheckFileName(String filePath,String orgFileName,String fileExt) {
		boolean isCheck=true;
		String returnFileName=null;
		String fullFilePath=null;
		File file =null;
		String fileName=orgFileName;
		int i=0;
		while(isCheck) {
			fullFilePath=filePath+fileName+fileExt; // c:\\upload\\손흥민.jpg
			file=new File(fullFilePath);
			if(file.exists()) {
				i++;
				fileName=String.format("%s_%d", orgFileName,i);
			}else { // 중복 없으면 빠져나가기
				isCheck=false;
			}
		}
		String returnFile=fileName+fileExt;
		return returnFile;
	}
}
