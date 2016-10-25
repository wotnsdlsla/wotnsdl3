
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>




<!-- pageContext.getRequest();
pageContext.getServletContext();

request.getRemoteAddr(); 
 -->

<%-- 
  내부적으로 자바 변수로 선언되는게 아니라 page데이터 영역의 Attribute 선언되기 떄문에
 <%=변수이름%>형태로 출력 할수 없기때문에 ${변수이름} 이렇게 사용한다
                                                            지역변수를 가지고와서 쓸수가 없어서  
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table border="1">
      <tbody>
         <tr>
            <td>제목</td>
            <td colspan="3">${n.title}/ ${pageContext.request.remoteAddr}/ ${ param.code} / ${requestScope.aa} 
             </td>
                                 <%-- --%>
         <tr>
            <td>번호</td>
            <td colspan="3">${n.code}</td>
         </tr>
         <tr>
            <td>작성자</td>
            <td>${n.writer}</td>
            <td>조회수</td>
            <td></td>
         </tr>
         <tr>
            <td>작성일</td>
            <td colspan="3">${n.regdate}</td>
         </tr>
         <tr>

            <td colspan="4"> ${n.content}</td>
         </tr>
      </tbody>
   </table>
   <div>
   <a href="notice">목록</a>
   <a href="notice-edit?code=${n.code}">수정</a>
   <a href="notice-delete?code=${n.code}">삭제</a>
  	
   </div>
</body>
</html>