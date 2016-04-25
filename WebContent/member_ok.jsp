<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 인증</title>
</head>
<body>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
try
{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/mydatabase";
		Connection conn= DriverManager.getConnection(url,"root","shdkdl");
		Statement stmt=conn.createStatement();
		String strSQL="SELECT*FROM member where ID='"+id+"'";
		ResultSet rs=stmt.executeQuery(strSQL);
		rs.next();
		
		String log_id=rs.getString("ID");
		String log_pass=rs.getString("password");
		String log_name=rs.getString("name");
		String log_email=rs.getString("email");
		String log_score=rs.getString("score");	

		if(id.equals(log_id)&&password.equals(log_pass))
		{%>
	
			<form Name="NameAndScore" method="post" Action="login_main.jsp"></TR></TD>
			<table>
			<TR><TD><input type="hidden" name="name" value="<%=log_name%>"></TR></TD>
			<TR><TD><input type="hidden" name="score" value="<%=log_score%>"></TR></TR>
			<TR><TD><input type="submit" value="로그인"></TR></TD>
			</table>
			</form>
			<%
		}
		else
		{
			out.println("아이디 혹은 비밀번호 를 다시 입력해주세요.");
		}
}
catch(Exception e)
{
	out.println("아이디 혹은 비밀번호 를 다시 입력해주세요.");
}
%>
</table>
</body>
</html>