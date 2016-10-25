
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
	<h1>등록 페이지</h1>
	<form action="notice-reg" method="post">
		<fieldset>
			<legend>공지사항 필드수정</legend>
			<table border="1">
				<tbody>
					<tr>
						<td>제목</td>					<!-- name 키값을 전달함 -->
						<td colspan="3"><input type="text" name="title" value="${n.title}" /></td>
						<%-- --%>
					</tr>
					
					<tr>
														<!-- name 키값을 전달함 -->
						<td colspan="4"><textarea name="content" rows="20" cols="60">${n.content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>

			<div>				<!-- name 키값을 전달함 -->
				<input type="submit" value="등록"/>
				<a href="notice">취소</a>
			</div>
		</fieldset>
	</form>
</body>
</html>