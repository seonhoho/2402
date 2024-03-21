<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션을 무효화하여 사용자를 로그아웃합니다.
    session.invalidate();
    // 로그아웃 후 로그인 페이지로 리다이렉트합니다.
    response.sendRedirect("index.jsp");
%>
