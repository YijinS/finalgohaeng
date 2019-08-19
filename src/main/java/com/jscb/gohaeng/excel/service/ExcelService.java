package com.jscb.gohaeng.excel.service;

import javax.servlet.http.HttpServletResponse;

public interface ExcelService {
	void selectExcelList(HttpServletResponse response) throws Exception;
}
