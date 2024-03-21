<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 결과</title>
</head>
<body>
    <h1>로그인 결과</h1>
    <%-- 전달받은 파라미터를 출력합니다. --%>
    <p>아이디: <%= request.getParameter("id") %></p>
    <p>이메일: <%= request.getParameter("email") %></p>
</body>
</html>
