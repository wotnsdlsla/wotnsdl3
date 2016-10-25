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

@WebServlet("/customer/notice-edit") // < 가상이지만 요청이 같은 디렉토리처럼 나타나게 해주려고
public class NoticeEditController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDao noticeDao= new MyBatisNoticeDao();
		
		Notice n= new Notice();
		n.setCode(code);  //담아주기위한 코드
		n.setTitle(title);//담아주기위한 코드
		n.setContent(content);//담아주기위한 코드
		
		noticeDao.update(n);
		
		response.sendRedirect("notice-detail?code="+code);
		
		
		

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			String _code = request.getParameter("code");
			NoticeDao noticeDao = new MyBatisNoticeDao(); // DAO:data access object
			Notice notice; 
				
			notice = noticeDao.get(_code);
			request.setAttribute("n", notice);

		
		// 1.그냥부르기: 니가 새로해
		// response.sendRedirect("notice.jsp");

		// 2.자원을 공유하면서 부르기: 일을 이서서 계속
		request.getRequestDispatcher("/WEB-INF/views/customer/notice-edit.jsp").forward(request, response);
		// Dispatcher 누군가를 호출하기 위한도구 forward

	}

}
