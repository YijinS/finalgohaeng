package com.jscb.gohaeng.gameresult.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dto.LottoGamesDto;

@Service
public class GameResultServiceImpl implements GameResultService {
	
	@Autowired
	LottoGamesDao lottoGamesDao;
	
	@Override
	public void getLastGames(ModelAndView mView) {
		
		LottoGamesDto dto = lottoGamesDao.getLastData();
		mView.addObject("lottoGames",dto);

	}

	@Override
	public void getGamesList(ModelAndView mView) {
		
		List<LottoGamesDto> list;
		list = lottoGamesDao.getList();
		mView.addObject("list",list);

	}
	
	@Override
	public List<LottoGamesDto> getGamesList(int start, int end) {
		
		List<LottoGamesDto> list;
		list = lottoGamesDao.getList(start, end);
		
		return list;
	}

	@Override
	public LottoGamesDto getData(int games) {
		
		LottoGamesDto dto;
		dto = lottoGamesDao.getData(games);
		return dto;
	}

	
	
	public Map<String,Object> getStatByNumber(int start,int end,int bonus) {
		
		List<LottoGamesDto> list = lottoGamesDao.getList(start,end);
		int[] nums = new int[45];
		for(LottoGamesDto lotto : list) {
			for(int i=0;i<6;i++) {
				String text = lotto.getWinningNum();
				Integer num = Integer.parseInt(text.substring(i*2, (i+1)*2));
				nums[num-1]++;
			}
			if(bonus != 0) {
				int bonusNum = Integer.parseInt(lotto.getBonusNum());
				nums[bonusNum-1]++;
			}
		}
		int max=0;
		for(int a:nums) {
			if(a > max)
				max = a;
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("nums",nums);
		map.put("max",max);
		
		return map;
		
	}
	
public Map<String,Object> getColorByNumber(int start,int end) {
		
		List<LottoGamesDto> list = lottoGamesDao.getList(start,end);
		int[] nums = new int[45];
		for(LottoGamesDto lotto : list) {
			for(int i=0;i<6;i++) {
				String text = lotto.getWinningNum();
				Integer num = Integer.parseInt(text.substring(i*2, (i+1)*2));
				nums[num-1]++;
			}
			int bonusNum = Integer.parseInt(lotto.getBonusNum());
			nums[bonusNum-1]++;
		}
		
		Integer first = 0;
		Integer second = 0;
		Integer third = 0;
		Integer fourth = 0;
		Integer fifth = 0;
		
		for(int i=0;i<45;i++) {
			if(i<11)
				first += nums[i];
			else if(i<21)
				second += nums[i];
			else if(i<31)
				third += nums[i];
			else if(i<41)
				fourth += nums[i];
			else
				fifth += nums[i];
		}
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("first",first);
		map.put("second",second);
		map.put("third",third);
		map.put("fourth",fourth);
		map.put("fifth",fifth);
		
		return map;
		
	}

	@Override
	public List<Integer> getGames() {
		
		List<Integer> list = lottoGamesDao.getGames();
		
		return list;
	}

	@Override
	public void getExelDown(HttpServletResponse response,int start, int end) {
		List<LottoGamesDto> list = lottoGamesDao.getList(start, end);
		//Excel Down 시작
        Workbook workbook = new HSSFWorkbook();
        //시트생성
        Sheet sheet = workbook.createSheet("게시판");
        
        //행, 열, 열번호
        Row row = null;
        Cell cell = null;
        int rowNo = 0;
        
        // 테이블 헤더용 스타일
        CellStyle headStyle = workbook.createCellStyle();

        // 가는 경계선을 가집니다.
        headStyle.setBorderTop(BorderStyle.THIN);
        headStyle.setBorderBottom(BorderStyle.THIN);
        headStyle.setBorderLeft(BorderStyle.THIN);
        headStyle.setBorderRight(BorderStyle.THIN);

        // 배경색은 노란색입니다.
        headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
        headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        // 데이터는 가운데 정렬합니다.
        headStyle.setAlignment(HorizontalAlignment.CENTER);

        // 데이터용 경계 스타일 테두리만 지정
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setBorderTop(BorderStyle.THIN);
        bodyStyle.setBorderBottom(BorderStyle.THIN);
        bodyStyle.setBorderLeft(BorderStyle.THIN);
        bodyStyle.setBorderRight(BorderStyle.THIN);

        // 헤더 생성
        row = sheet.createRow(rowNo++);

        cell = row.createCell(0);
        cell.setCellStyle(headStyle);
        cell.setCellValue("회차");

        cell = row.createCell(1);
        cell.setCellStyle(headStyle);
        cell.setCellValue("당첨번호");

        cell = row.createCell(2);
        cell.setCellStyle(headStyle);
        cell.setCellValue("추첨일");

        // 데이터 부분 생성
        for(LottoGamesDto lotto : list) {
            
            row = sheet.createRow(rowNo++);
            cell = row.createCell(0);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(""+lotto.getGames());
            cell = row.createCell(1);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(""+lotto.getWinningNum());
            cell = row.createCell(2);
            cell.setCellStyle(bodyStyle);
            cell.setCellValue(""+lotto.getDrawDate());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=test.xls");

        // 엑셀 출력
        try {
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       

	}



	

}
