package com.jscb.gohaeng.board.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jscb.gohaeng.board.dao.BoardDao;
import com.jscb.gohaeng.dto.BoardDto;
import com.jscb.gohaeng.utilities.excel.option.ReadOption;
import com.jscb.gohaeng.utilities.excel.read.ExcelRead;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void insertMassiveArticleInBoard(File destFile) {
		ReadOption readOption = new ReadOption();
		readOption.setFilePath(destFile.getAbsolutePath());
		readOption.setOutputColumns("A", "B", "C", "D");
		readOption.setStartRow(2);

		List<Map<String, String>> excelContent = ExcelRead.read(readOption);

		BoardDto boardDto = null;
		for (Map<String, String> article : excelContent) {

			boardDto = new BoardDto();
			boardDto.setSubject(article.get("A"));
			boardDto.setContent(article.get("B"));
			boardDto.setUserId(article.get("C"));
			boardDto.setFileName(article.get("D"));

			boardDao.insertArticleInBoard(boardDto);
		}

	}

}
