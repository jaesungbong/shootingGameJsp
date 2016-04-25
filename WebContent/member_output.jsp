<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 가입 성공</title>
</head>

<%
String id= request.getParameter("id");
String password=request.getParameter("password");
String name=request.getParameter("name");
String email=request.getParameter("email");
String score="0";

String check="yes";

if(id=="")
	check="no";
if(password=="")
	check="no";
if(name=="")
	check="no";
if(email=="")
	check="no";

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/mydatabase";
Connection conn= DriverManager.getConnection(url,"root","shdkdl");
Statement stmt=conn.createStatement();
String strSQL="SELECT id FROM member where id='"+id+"'";
ResultSet rs=stmt.executeQuery(strSQL);

if(!rs.next())
	check="yes";
else
	check="no";

if(check=="yes")
{
	strSQL="INSERT INTO member(id,password,name,email,score)";
	strSQL=strSQL+"VALUES('"+id+"','"+password+"','"+name+"','"+email+"','"+score+"')";
	stmt.executeUpdate(strSQL);
%>
<body>

<Center><b>회원 가입 성공</b>
<Table align='center'>
<TR><TD align='center'>로그인 하세요</TD></TR>
</Table>

</body>
</html>

<%
}else{
%>

<html>
<head>
<Title>회원 가입 실패</Title>
</head>

<body>

<Center><b>회원 가입 실패</b>
<Table align='center'>
<TR><TD align='center'>다시 가입해 주세요.</TD></TR>
<TR><TD align='center'><a href="member_join.jsp">[가임]</a></TD></TR>
</Table>


</body>
</html>
<%
}

stmt.close();
conn.close();
%>