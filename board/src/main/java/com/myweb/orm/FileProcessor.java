package com.myweb.orm;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.domain.FileVO;
import com.myweb.persistence.FileDao;

@Component
public class FileProcessor {

	private static Logger logger = LoggerFactory.getLogger(FileProcessor.class);

	@Autowired
	private FileDao fdao;
	
	public void uploadFile(MultipartFile[] files, int bno) {
		final String UP_DIR = "C:\\Users\\HUBDNC-DEV\\git\\Spring_Board\\board\\src\\main\\webapp\\resources\\upload\\temp"; // 업로드 경로
		
		LocalDate date = LocalDate.now(); 
		String today = date.toString();
		today = today.replace("-", File.separator); // File.separator -> 파일 구분자
		
		File folder = new File(UP_DIR, today);
		
		if(!folder.exists()) folder.mkdirs();
		
		for (MultipartFile f : files) {
			FileVO fvo = new FileVO();
			fvo.setSavedir(today);
			
			String originalFileName = f.getOriginalFilename(); // 원래 파일 이름
						
			fvo.setFname(originalFileName);
			
			UUID uuid = UUID.randomUUID();
			fvo.setUuid(uuid.toString());
			
			String fullFileName = uuid.toString() + "_" + originalFileName; // 저장되는 파일 이름 (UUID + 원래 파일 이름)
			File storeFile = new File(folder, fullFileName);
						
			try {
				f.transferTo(storeFile); // 업로드
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			fvo.setBno(bno); // 게시글 번호
			fdao.insert(fvo); // 파일 등록
		}
	}
}
