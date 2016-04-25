<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 중복 체크</title>
</head>
<body>
<form>
<table width=250>
<%
String id=request.getParameter("id"); 
if(id==""){
%>

<TR><TD align='center'>id를 입력하세요.</TD></TR>
<TR><TD align='center'><a href=javascript:close()>[닫기]</a></TD></TR>

<%
}
else
{
	Class.forName("com.mysql.jdbc.Driver");
	
	String url="jdbc:mysql://localhost:3306/mydatabase";
	Connection conn= DriverManager.getConnection(url,"root","shdkdl");
	Statement stmt=conn.createStatement();
	
	String strSQL="SELECT id FROM member where ID='"+id+"'";
	ResultSet rs=stmt.executeQuery(strSQL);
	
	if(!rs.next())
	{
	%>
	<TR><TD align='center'>ID:<%=id %><BR>사용할 수 있는 아이디 입니다.</TD></TR>
	<TR><TD align='center'><a href=javascript:close()>[닫기]</a></TD></TR>
	<%
	}
	else
	{	
	%>
	<TR><TD align='center'>ID:<%=id %><BR> 사용할 수 없는 아이디 입니다.</TD></TR>
	<TR><TD align='center'><a href=javascript:close()>[닫기]</a></TD></TR>
	<%
	}
	
	rs.close();
	stmt.close();
	conn.close();
}
%>

</body>
</html>