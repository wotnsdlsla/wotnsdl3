<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%      
String url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
String sql = "SELECT * FROM NOTICE_VIEW WHERE TITLE LIKE ?";
String query = "";


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url, "c##sist", "dclass");

//Statement st = con.createStatement(); //파라미터에 값을 꽃을 수 있는 능력이 없다.

PreparedStatement st = con.prepareStatement(sql); //sql 쿼리문 넣어줌
st.setString(1, "%"+query+"%");
ResultSet rs = st.executeQuery(); //preparedstatment 사용시 쿼리문 빼준다. 한번 더 넣으면 에러남.

String code="";
String title="";
String writer="";
Date regdate;
int hit;

%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h5>
      <a href="">□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
         □□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
         □□□■□□□□■□□□□■□□□□■□□□□■□□□■■■■□□□□□□□■■■■□□□■□□□□■□□□□□□■■■■□□□■□□□□■□□□□□■□□□□□■□□□□□□□□□□□□□
         □□□■□□□□■□□□□■□□□□■■□□□■□□■□□□□■□□□□□■□□□□■□□■□□□□■□□□□□■□□□□■□□■■□□□■□□□□□■□□□□□□□□□□□□□□□□□□□
         □□□■□□□□■□□□■□■□□□■■□□□■□□■□□□□□□□□□□■□□□□□□□■□□□□■□□□□□■□□□□■□□■■□□□■□□□□□■□□□□□□□□□□□□□□□□□□□
         □□□■□□□□■□□□■□■□□□■□■□□■□□■□□□□□□□□□□■□□□□□□□■□□□□■□□□□□■□□□□■□□■□■□□■□□□□□■□□□□□■□■□■■□□□■■■□□
         □□□■□□□□■□□■□□□■□□■□■□□■□□■□□■■■□□□□□■□□■■■□□■□□□□■□□□□□■□□□□■□□■□■□□■□□□□□■□□□□□■□■■□□■□■□□□■□
         □□□■□□□□■□□■□□□■□□■□□■□■□□■□□□□■□□□□□■□□□□■□□■□□□□■□□□□□■□□□□■□□■□□■□■□□■■□■□□□□□■□■□□□■□■■■■■□
         ■□□■□■□□■□□■■■■■□□■□□□■■□□■□□□□■□□□□□■□□□□■□□■□□□□■□□□□□■□□□□■□□■□□□■■□□□□□■□□□□□■□■□□□■□■□□□□□
         ■□□■□■□□■□■□□□□□■□■□□□■■□□■□□□■■□□□□□■□□□■■□□■□□□□■□□□□□■□□□□■□□■□□□■■□□□□□■□□□□□■□■□□□■□■□□□■□
         □■■□□□■■□□■□□□□□■□■□□□□■□□□■■■□■□□□□□□■■■□■□□□■■■■□□□□□□□■■■■□□□■□□□□■□□□□□■■■■■□■□■□□□■□□■■■□□
         □□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
         □□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□</a>
   </h5>
   <ul>
      <li><a href="../index.jsp">HOME</a></li>
      <li><a href="notice.jsp">NOTICE</a></li>
   </ul>
   <table border="1">
      <thead>
         <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
         </tr>
      </thead>
      <tbody>
      <%
      while(rs.next()){
         code= rs.getString("CODE");
         title= rs.getString("TITLE");
         writer= rs.getString("WRITER");
         regdate= rs.getDate("REGDATE");
         hit= rs.getInt("HIT");
      
      %>
         <tr>
            <td><%=code%></td>
            <td><a href="notice-detail.jsp?code=<%=code%>"><%=title%></a></td>
            <td><%=writer%></td>
            <td><%=regdate%></td>
            <td><%=hit%></td>
         </tr>
         <%
         }
         rs.close();
         st.close();
         con.close();
         %>
      </tbody>
   
   </table>
</body>
</html>