package com.springbook.biz.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.trip.TripFileVO;

public class FileUtils {
	public List<TripFileVO> parseFileInfo(int seq, HttpServletRequest request, 
			MultipartHttpServletRequest mhsr) throws IOException {
		if(ObjectUtils.isEmpty(mhsr)) {
			return null;
		}
		
		List<TripFileVO> fileList = new ArrayList<TripFileVO>();
		
		//서버의 절대 경로 얻기
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "/upload/";
		
		//위 경로의 폴더가 없으면 폴더 생성
		File file = new File(root_path + attach_path);
		//File file = new File(attach_path);
		if(file.exists() == false) {
			file.mkdir();
		}
		
		//파일 이름들을 iterator로 담음
		Iterator<String> iterator = mhsr.getFileNames();
		
		// 반환이 있으면 true 없으면 false
		while(iterator.hasNext()) {
			//파일명으로 파일 리스트 꺼내오기
			List<MultipartFile> list = mhsr.getFiles(iterator.next());
			
			//파일 리스트 개수 만큼 리턴할 파일 리스트에 담아주고 생성
			for(MultipartFile mf : list) {
				if(mf.getSize() > 0) {
					TripFileVO tripFile = new TripFileVO();
					tripFile.setSeq(seq);
					tripFile.setFileSize(mf.getSize());
					tripFile.setOriginalFileName(mf.getOriginalFilename());
					tripFile.setFilePath(root_path + attach_path);
					//tripFile.setFilePath(attach_path);
					fileList.add(tripFile);
					
					file = new File(root_path + attach_path + mf.getOriginalFilename());
					//file = new File(attach_path + mf.getOriginalFilename());
					mf.transferTo(file);
				} else {
					fileList = null;
				}
			}
		}
		return fileList;
	}
}
