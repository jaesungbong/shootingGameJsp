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
			alert("���̵� �Է��Ͻÿ�.");
			member_join.id.focus();
			return false;
		}
		if(member_join.password.value.length<1)
		{
			alert("��й�ȣ�� �Է��Ͻÿ�.");
			member_join.password.focus();
			return false;
		}
		if(member_join.name.value.length<1)
		{
			alert("�̸��� �Է��Ͻÿ�.");
			member_join.name.focus();
			return false;
		}
		if(member_join.email.value.length<1)
		{
			alert("�̸����� �Է��Ͻÿ�.");
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
<h2 align="center">ȸ������</h2>
<FORM Name='member_join' Method='post' Action='member_output.jsp' >
<table align="center">
<tr><td>ID</td><td><input type="text" name='id'></td><td><input type="button" value="�ߺ�Ȯ��" OnClick='Check_id()'></td></tr>
<tr><td>��й�ȣ</td><td><input type="password" name='password'></td></tr>
<tr><td>�̸�</td><td><input type="text" name='name'></td></tr>
<tr><td>�̸���</td><td><input type="text" name='email'></td></tr>
<tr></tr>
<tr><td colspan="2" align="center"><input type="button" value="Ȯ��" Onclick='Check()'></td></tr>
</table>
</FORM>
</body>
</html>