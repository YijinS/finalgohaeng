package com.jscb.gohaeng.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jscb.gohaeng.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

	/*
	@RequestMapping("/board/massiveWrite/")
    public ModelAndView writeMassiveArticle(MultipartHttpServletRequest request){
        
        MultipartFile excelFile = request.getFile("excelFile");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택해 주세요");
        }
 
        File destFile = new File("D:\\"+excelFile.getOriginalFilename());
        try {
            excelFile.transferTo(destFile);
        } catch (IllegalStateException | IOException e) {
            throw new RuntimeException(e.getMessage(),e);
 
        }
        
        boardService.insertMassiveArticleInBoard(destFile);
        
        //FileUtils.deleteFile(destFile.getAbsolutePath());
        
        ModelAndView view = new ModelAndView();
        view.setViewName("redirect:/excel/exceluploadform");
        return view;
    }
	*/
	
	@RequestMapping("/excel/insertform/")
	public ModelAndView insertform
	(HttpServletRequest request){
		return new ModelAndView("excel.exceluploadform");
	}
	
	@ResponseBody
    @RequestMapping(value = "/excelUploadAjax", method = RequestMethod.POST)
    public ModelAndView excelUploadAjax(MultipartHttpServletRequest request)  throws Exception{
        MultipartFile excelFile =request.getFile("excelFile");
        System.out.println("엑셀 파일 업로드 컨트롤러");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택 해 주세요.");
        }
        
        File destFile = new File("D:\\"+excelFile.getOriginalFilename());
        try{
            excelFile.transferTo(destFile);
        }catch(IllegalStateException | IOException e){
            throw new RuntimeException(e.getMessage(),e);
        }
        System.out.println();
        System.out.println();
        System.out.println("ㅇ아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ"+destFile+"ㅇ아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
        System.out.println();
        System.out.println();
        boardService.insertMassiveArticleInBoard(destFile);
        //FileUtils.delete(destFile.getAbsolutePath());
        
        ModelAndView view = new ModelAndView();
        view.setViewName("excel.exceluploadform");
        return view;
    }

}
