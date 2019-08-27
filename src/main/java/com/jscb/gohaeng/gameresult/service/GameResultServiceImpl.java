package com.jscb.gohaeng.gameresult.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.dao.LottoGamesDao;
import com.jscb.gohaeng.dto.LottoGamesDto;


@Service
public class GameResultServiceImpl implements GameResultService {
	
	@Autowired
	LottoGamesDao lottoGamesDao;
	
	//한 페이지에 나타낼 row 의 갯수 
	static final int PAGE_ROW_COUNT=10;
	//하단 디스플레이 페이지 갯수 
	static final int PAGE_DISPLAY_COUNT=5;
	
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
        int cellNo = 0;
        
        // -------------------------------------------------------------
        // 테이블 헤더용 스타일1
        CellStyle headStyle1 = workbook.createCellStyle();

        // 데이터는 가운데 정렬합니다.
        headStyle1.setAlignment(HorizontalAlignment.CENTER);
        headStyle1.setVerticalAlignment(VerticalAlignment.CENTER);

        // -------------------------------------------------------------
        // -------------------------------------------------------------
        // 테이블 헤더용 스타일2
        CellStyle headStyle2 = workbook.createCellStyle();

        // 가는 경계선을 가집니다.
        headStyle2.setBorderTop(BorderStyle.THIN);
        headStyle2.setBorderBottom(BorderStyle.THIN);
        headStyle2.setBorderLeft(BorderStyle.THIN);
        headStyle2.setBorderRight(BorderStyle.THIN);

        // 배경색은 밝은 녹색입니다.
        headStyle2.setFillForegroundColor(HSSFColorPredefined.LIGHT_GREEN.getIndex());
        headStyle2.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        // 데이터는 가운데 정렬합니다.
        headStyle2.setAlignment(HorizontalAlignment.CENTER);
        headStyle2.setVerticalAlignment(VerticalAlignment.CENTER);

        // 데이터용 경계 스타일 테두리만 지정
        CellStyle bodyStyle2 = workbook.createCellStyle();
        bodyStyle2.setBorderTop(BorderStyle.THIN);
        bodyStyle2.setBorderBottom(BorderStyle.THIN);
        bodyStyle2.setBorderLeft(BorderStyle.THIN);
        bodyStyle2.setBorderRight(BorderStyle.THIN);
        // -------------------------------------------------------------
        // -------------------------------------------------------------
        // 셀 스타일 및 폰트 설정(일반 텍스트)
        CellStyle nomtext = workbook.createCellStyle();

        // 가는 경계선을 가집니다.
        nomtext.setBorderTop(BorderStyle.THIN);
        nomtext.setBorderBottom(BorderStyle.THIN);
        nomtext.setBorderLeft(BorderStyle.THIN);
        nomtext.setBorderRight(BorderStyle.THIN);

        // 데이터는 가운데 정렬합니다.
        nomtext.setAlignment(HorizontalAlignment.CENTER);
        nomtext.setVerticalAlignment(VerticalAlignment.CENTER);

        // 데이터용 경계 스타일 테두리만 지정
        CellStyle bodyStyle3 = workbook.createCellStyle();
        bodyStyle3.setBorderTop(BorderStyle.THIN);
        bodyStyle3.setBorderBottom(BorderStyle.THIN);
        bodyStyle3.setBorderLeft(BorderStyle.THIN);
        bodyStyle3.setBorderRight(BorderStyle.THIN);
        // -------------------------------------------------------------
     // -------------------------------------------------------------
        // 셀 스타일 및 폰트 설정(금액 텍스트)
        CellStyle paytext = workbook.createCellStyle();

        // 가는 경계선을 가집니다.
        paytext.setBorderTop(BorderStyle.THIN);
        paytext.setBorderBottom(BorderStyle.THIN);
        paytext.setBorderLeft(BorderStyle.THIN);
        paytext.setBorderRight(BorderStyle.THIN);

        // 데이터는  오른쪽 정렬합니다.
        paytext.setAlignment(HorizontalAlignment.RIGHT);
        paytext.setVerticalAlignment(VerticalAlignment.CENTER);
        paytext.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
        // 데이터용 경계 스타일 테두리만 지정
        CellStyle bodyStyle4 = workbook.createCellStyle();
        bodyStyle4.setBorderTop(BorderStyle.THIN);
        bodyStyle4.setBorderBottom(BorderStyle.THIN);
        bodyStyle4.setBorderLeft(BorderStyle.THIN);
        bodyStyle4.setBorderRight(BorderStyle.THIN);
        // -------------------------------------------------------------
        
        
        // 헤더 생성
        
        //0행 생성
        row = sheet.createRow(rowNo++);
        cellNo = 0; // 셀 카운트 초기화
        
        //셀 병합
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 8));
        sheet.addMergedRegion(new CellRangeAddress(1, 2, 0, 0));
        sheet.addMergedRegion(new CellRangeAddress(1, 2, 1, 1));
        sheet.addMergedRegion(new CellRangeAddress(1, 1, 2, 8));
        
        
        //셀 생성
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        cell.setCellValue("회차별 추첨 결과");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle1);

        
        //1행 생성
        row = sheet.createRow(rowNo++);
        cellNo = 0;
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("회차");

        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("추첨일");

        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("당첨번호");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        //2행 생성
        row = sheet.createRow(rowNo++);
        cellNo = 0;
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("1");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("2");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("3");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("4");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("5");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("6");
        
        cell = row.createCell(cellNo++);
        cell.setCellStyle(headStyle2);
        cell.setCellValue("보너스");
        
        
        // 데이터 부분 생성
        for(LottoGamesDto lotto : list) {
           SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
           String drawDate = sf.format(lotto.getDrawDate());

            row = sheet.createRow(rowNo++);
            cell = row.createCell(0);
            cell.setCellStyle(bodyStyle3);
            cell.setCellValue(""+lotto.getGames());
            cell = row.createCell(1);
            cell.setCellStyle(bodyStyle3);
            cell.setCellValue(""+drawDate);
            for(int i=0; i<6; i++) {
	            cell = row.createCell(i+2);
	            cell.setCellStyle(bodyStyle3);
	            cell.setCellValue(""+Integer.parseInt(lotto.getWinningNum().substring(i*2, (i+1)*2)));
            }
            cell = row.createCell(8);
            cell.setCellStyle(bodyStyle3);
            cell.setCellValue(""+Integer.parseInt(lotto.getBonusNum()));
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=excel.xls");

        // 엑셀 출력
        try {
			workbook.write(response.getOutputStream());
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       

	}

	@Override
	public Map<String, Object> getPageList(int page, int start, int end) {

		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=lottoGamesDao.getTotalCount(start, end);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((page-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		
		List<LottoGamesDto> list = lottoGamesDao.getList(page, PAGE_ROW_COUNT, start, end);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("startPageNum",startPageNum);
		map.put("endPageNum",endPageNum);
		map.put("pageNum",page);
		map.put("totalPageCount",totalPageCount);
		map.put("totalRow",totalRow);
		map.put("current", page);
		
		return map;
	}



	

}
