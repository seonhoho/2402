<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
    <h1>Error</h1>
    <p>An error occurred: <%= request.getParameter("message") %></p>
    <p>Please go back and try again.</p>
</body>
</html>
