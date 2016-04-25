<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script language="javascript">
	function Check()
	{
		if(member_join.id.value.length<1)
		{
			alert("아이디를 입력하시요.");
			member_join.id.focus();
			return false;
		}
		if(member_join.password.value.length<1)
		{
			alert("비밀번호를 입력하시요.");
			member_join.password.focus();
			return false;
		}
		if(member_join.name.value.length<1)
		{
			alert("이름을 입력하시요.");
			member_join.name.focus();
			return false;
		}
		if(member_join.email.value.length<1)
		{
			alert("이메일을 입력하시요.");
			member_join.email.focus();
			return false;
		}
		member_join.submit();
	}
	
	function Check_id()
	{
		browsing_window=window.open("checkid.jsp?id="+member_join.id.value,"_idcheck","height=200,width=300,menubar=no,directories=no,resizable=no,status=no,scrillbars=yes");
		browsing_window.focus();
	}

</script>

</head>
<body>
<h2 align="center">회원가입</h2>
<FORM Name='member_join' Method='post' Action='member_output.jsp' >
<table align="center">
<tr><td>ID</td><td><input type="text" name='id'></td><td><input type="button" value="중복확인" OnClick='Check_id()'></td></tr>
<tr><td>비밀번호</td><td><input type="password" name='password'></td></tr>
<tr><td>이름</td><td><input type="text" name='name'></td></tr>
<tr><td>이메일</td><td><input type="text" name='email'></td></tr>
<tr></tr>
<tr><td colspan="2" align="center"><input type="button" value="확인" Onclick='Check()'></td></tr>
</table>
</FORM>
</body>
</html>