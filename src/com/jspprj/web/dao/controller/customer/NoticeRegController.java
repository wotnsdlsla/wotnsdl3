package com.jspprj.web.dao.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspprj.web.dao.NoticeDao;
import com.jspprj.web.dao.mybatis.MyBatisNoticeDao;
import com.jspprj.web.entities.Notice;

@WebServlet("/customer/notice-reg")
public class NoticeRegController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/customer/notice-reg.jsp").forward(request, response);
	}	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		NoticeDao noticeDao= new MyBatisNoticeDao();
		
		Notice n= new Notice();
		
		n.setTitle(title);//담아주기위한 코드
		n.setContent(content);//담아주기위한 코드
		n.setWriter("SOON");
		
		noticeDao.insert(n);
	
		
		response.sendRedirect("notice");
	}
}
