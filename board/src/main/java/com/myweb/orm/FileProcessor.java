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
		final String UP_DIR = "C:\\upload\\temp";
		
				LocalDate date = LocalDate.now(); 
				String today = date.toString();
				today = today.replace("-", File.separator);
				
				File folder = new File(UP_DIR, today);
				
				if(!folder.exists()) folder.mkdirs();
				
				for (MultipartFile f : files) {
					FileVO fvo = new FileVO();
					fvo.setSavedir(today);
					
					String originalFileName = f.getOriginalFilename(); // 원래 filename
					logger.info(">>> originalFileName ? : " +originalFileName);
								
					fvo.setFname(originalFileName);
					
					UUID uuid = UUID.randomUUID(); // 유니크한 값
					fvo.setUuid(uuid.toString());
					
					String fullFileName = uuid.toString() + "_" + originalFileName; // 실제로 만들어진 filename(저장되는 이름)
					File storeFile = new File(folder, fullFileName);
								
					try {
						f.transferTo(storeFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					fvo.setBno(bno);
					fdao.insert(fvo);
				}
	}

}
