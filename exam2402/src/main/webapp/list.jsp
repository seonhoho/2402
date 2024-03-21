<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
String sql = "select * from member";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

// 사용자가 로그인한 경우 세션에 loginId라는 속성이 설정되어 있습니다.
String loginId = (String) session.getAttribute("loginId");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="a.jsp">Link</a></li>
					<%-- 로그인 상태에 따라 다르게 표시될 버튼 --%>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#"> <%-- 로그인한 경우 여기에 사용자 이름 표시 --%>
								<%=loginId != null ? "Welcome, " + loginId : ""%>
						</a></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
			</div>
		</div>
	</nav>

	<div class="container" style="padding-top: 50px">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">아이디</th>
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
				%>
				<tr>
					<th scope="row"><%=rs.getString("memberno")%></th>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("name")%></td>
					<td>
						<button class="btn btn-warning"
							onClick='location.href=
                    "updateForm.jsp?memberno=<%=rs.getString("memberno")%>"'>수정</button>
					</td>
					<td>
						<button class="btn btn-warning"
							onClick='location.href=
                    "memberDelete.jsp?memberno=<%=rs.getString("memberno")%>"'>삭제</button>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<button class="btn btn-primary" onClick="moveToMemberForm()">회원가입</button>
		<button class="btn btn-primary" onClick="moveToBoard()">게시판</button>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

	<script>
    function moveToBoard() {
        location.href = "board.jsp";
    }
    
    function moveToMemberForm() {
        location.href = "memberForm.jsp";
    }
	</script>
  
