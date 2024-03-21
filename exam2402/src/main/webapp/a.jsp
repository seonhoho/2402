<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Button Links</title>
<style>
.button {
  display: inline-block;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  color: white;
  background-color: #007bff;
  border-radius: 5px;
  margin-right: 10px;
}

.button:hover {
  background-color: #0056b3;
}
</style>
</head>
<body>
<a href="https://www.naver.com" class="button">스마트 스토어</a>
<a href="https://www.instagram.com" class="button">인스타그램</a>
<a href="https://www.youtube.com" class="button">유튜브</a>
</body>
</html>
