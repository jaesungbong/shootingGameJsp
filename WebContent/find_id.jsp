<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");

Class.forName("com.mysql.jdbc.Driver");

String url="jdbc:mysql://localhost:3306/mydatabase";
Connection conn= DriverManager.getConnection(url,"root","shdkdl");
Statement stmt=conn.createStatement();

String strSQL="SELECT*FROM member where email='"+email+"'";
ResultSet rs=stmt.executeQuery(strSQL);

rs.next();

String log_id=rs.getString("ID");
String log_pass=rs.getString("password");
String log_name=rs.getString("name");
String log_email=rs.getString("email");
String log_score=rs.getString("score");	
%>
����� ���̵��<%=log_id%>�Դϴ�.
</body>
</html>