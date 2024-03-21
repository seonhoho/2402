<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h2>환영합니다!</h2>
    <%-- 세션에서 사용자 아이디를 가져와서 화면에 출력합니다. --%>
    <% String userId = (String) session.getAttribute("id"); %>
    <p>아이디: <%= userId %></p>
    <p>로그인에 성공하셨습니다.</p>
    <p><a href="logout.jsp">로그아웃</a></p>
</body>
</html>
