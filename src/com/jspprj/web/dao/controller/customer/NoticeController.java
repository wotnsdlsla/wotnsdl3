package com.jspprj.web.dao.controller.customer;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspprj.web.dao.NoticeDao;
import com.jspprj.web.dao.mybatis.MyBatisNoticeDao;
import com.jspprj.web.model.NoticeModel;

@WebServlet("/customer/notice")
public class NoticeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String p = request.getParameter("p");
			String t = request.getParameter("t");
			String q = request.getParameter("q");
			
		
			int page= 1;
			String field="TITLE";
			String query="";
		
			if(p !=null && !p.equals(""))
				page=Integer.parseInt(p);
			if(t != null && !t.equals("") )
				field= t;
			if(q !=null )
				query= q;
			
			NoticeDao noticeDao = new MyBatisNoticeDao();
			List<NoticeModel> list = noticeDao.getList(page, field, query);
			int count = noticeDao.getCount(field,query);
			request.setAttribute("list", list);
			
			request.setAttribute("count", count);
			
			
		
		
		//1.그냥부르기: 니가 새로해 
		//response.sendRedirect("notice.jsp");
		
		//2.자원을 공유하면서 부르기: 일을 이서서 계속
		request.getRequestDispatcher("/WEB-INF/views/customer/notice.jsp").forward(request,response);
						//Dispatcher 누군가를 호출하기 위한도구 forward 
		
		
	}

	}

