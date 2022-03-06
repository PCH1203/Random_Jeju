/*
 * package com.springbook.biz.common;
 * 
 * import java.io.File; import java.io.IOException; import java.util.ArrayList;
 * import java.util.Iterator; import java.util.List;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.util.ObjectUtils; import
 * org.springframework.web.multipart.MultipartFile; import
 * org.springframework.web.multipart.MultipartHttpServletRequest;
 * 
 * import com.springbook.biz.trip.TripVO;
 * 
 * public class FileUtils2 { public String parseFileInfo(HttpServletRequest
 * request, MultipartHttpServletRequest mhsr) throws IOException {
 * 
 * 
 * //서버의 절대 경로 얻기 String root_path =
 * request.getSession().getServletContext().getRealPath("/"); String attach_path
 * = "/upload/";
 * 
 * //위 경로의 폴더가 없으면 폴더 생성 File file = new File(root_path + attach_path); //File
 * file = new File(attach_path);
 * 
 * //file.exists() ==> 파일이 존재하면 true 를 리턴 if(file.exists() == false) {
 * //file.mkdir() ==> 디렉토리 생성해주는데 mkdir은 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우 생성 불가
 * file.mkdir(); }
 * 
 * MultipartFile mf = mhsr.getFile("file");
 * 
 * TripVO vo = new TripVO(); vo.setTrImgName(mf.getOriginalFilename());
 * vo.setTrImgPath(root_path + attach_path);
 * 
 * file = new File(root_path + attach_path + mf.getOriginalFilename());
 * mf.transferTo(file);
 * 
 * return "file"; } }
 */