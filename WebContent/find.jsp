<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<Table align='center' border=1>
<form Name="member" method="post" Action="find_id.jsp">
<TR><TD align='center'>IDã��</TD></TR>
<TR><TD align='center'>�̸����� �Է��Ͻÿ�<input type="text" name=email></TD></TR>
<TR><TD align="center"><input type="submit" value="Ȯ��"></TD></TR>
</form>
<form Name="member" method="post" Action="find_password.jsp">
<TR><TD align='center'>��й�ȣ ã��</TD></TR>
<TR><TD align='center'>���̵� �Է��Ͻÿ�<input type="text" name=id></TD></TR>
<TR><TD align="center"><input type="submit" value="Ȯ��"></TD></TR>
</form>

</Table>
</body>
</html>