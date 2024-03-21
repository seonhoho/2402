<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>

<%
request.setCharacterEncoding("UTF-8");

// 사용자가 입력한 아이디와 이메일 가져오기
String id = request.getParameter("id");
String email = request.getParameter("email");
System.out.println(id+email);

// 오라클 데이터베이스 연결
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
    String sql = "SELECT * FROM member WHERE id=? AND email=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id); // 수정된 부분
    pstmt.setString(2, email);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
        // 로그인 성공
        // 세션을 사용하여 로그인 정보 유지
        session.setAttribute("id", id);
        session.setAttribute("email", email);
        // 로그인 성공 후 index.jsp로 이동
        response.sendRedirect("index.jsp");

    }
} catch (SQLException e) {
    // SQL 예외 처리
    e.printStackTrace(); // 에러 로그 출력
    out.println("<p>로그인 중 오류가 발생했습니다. 다시 시도해주세요.</p>"); // 클라이언트에게 오류 메시지 전송
} catch (Exception e) {
    // 그 외 예외 처리
    e.printStackTrace(); // 에러 로그 출력
    out.println("<p>로그인 중 예기치 못한 오류가 발생했습니다. 다시 시도해주세요.</p>"); // 클라이언트에게 오류 메시지 전송
} finally {
    // 리소스 해제
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
