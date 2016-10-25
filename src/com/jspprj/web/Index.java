package com.jspprj.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greeting")
public class Index extends HttpServlet {
   @Override
   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // request 입력 response 출력
      // 스트림 얻기 전에 무조건 해주고!!!
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");// charset=UTF-8 :
                                             // UTF-8 을이곳으로 보내라는
                                             // 이야기
      // 이렇게 써주기
      PrintWriter out = response.getWriter();

      String _cnt = request.getParameter("cnt");
      int cnt = 0;

      if (_cnt != null && !_cnt.equals("")) {
         cnt = Integer.parseInt(_cnt); // request.getParameter("cnt"); 약속한
                                 // cnt. 이건 get요청이야
      }
      
      out.write("<!DOCTYPE html>");
      out.write("<html>");
      out.write("<head>");
      out.write("<meta charset=\"UTF-8\">");
      out.write("<title>Insert title here</title>");
      out.write("</head>");
      out.write("<body>");
      out.write("   <!-- action=\"/JSPPrj/bb\" -->");
      out.write("   <form action=\"greeting\" method=\"get\">"); 
      out.write("      <fieldset>");
      out.write("         <legend>환영인사 입력폼</legend>");
      out.write("         <div>");
      out.write("            <label>반복회수 : </label>");
      out.write("            <input type=\"text\" name=\"cnt\">");
      out.write("         </div>");
      out.write("         <div>");
      out.write("            <input type=\"submit\" value=\"say hello\"> ");
      out.write("         </div>");
      out.write("      </fieldset>");
      out.write("   </form>");
      for (int i = 0; i < cnt; i++)
         out.println((i + 1) + ":안녕 Servlet!!<br/>");
      out.write("</body>");
      out.write("</html>");
      
      
      

         // out.println((i+1)+":Hello Servlet!!");
      
   }

}