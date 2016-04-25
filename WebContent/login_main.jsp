<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
body 
{
	font-size: 15px;
	color: #333;
}
header, article, footer, #sidemenu 
{
	border: 1px solid #999;
	margin:5px;
	padding:10px;
}
header 
{
	height: 110px;
	background-color:white;
	font-family: "Yj BLOCK �߰�";
	font-size: 0.75em
}
article 
{
	float:left;
	width:75%;
	height:500px;
	font-size: 0.9em;
	font-family: "Yj BLOCK �߰�";
	background-image:url(bgimg.JPG);
	line-height: 2em;
}

figure 
{
	float:right;
	margin:5px;	
}

figure img 
{
	width:564px;
	height:421px;
}

figure2
{
	float:center;
	margin:5px;	
}

figure2 img 
{
	width:50px;
	height:50px;
}

figcaption 
{
	text-align:right;
}

footer 
{
	clear:both;
	height:20px;
	background-color:white;
	padding:50px;
	text-align:center;
}

nav ul 
{
	list-style:none;
	float:right;
}

nav ul li 
{
	float:left;
	margin:0 20px;
}

#sidemenu {
	float:right;
	width:20%;
	height:500px;
	background-color:white;
	font-size: 0.85em
}

#sidemenu ul {
	list-style:none;
}

hgroup 
{
	border-bottom: 1px solid #F90;

}
</style>

<script language="javascript">
	function check()
	{
		if(member.id.value.length<1)
		{
			alert("���̵� �Է��Ͻÿ�.");
			member,id.focus();
			return false;
		}
		if(member.pass.value.length<1)
		{
			alert("��й�ȣ�� �Է��Ͻÿ�.");
			member.id.focus();
			return false;
		}
		member.submit();	
	}
</script>

<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String score=request.getParameter("score");
int iscore=Integer.parseInt(score);
%>

<header> <h1><font size="5.5" color="blue"><p align="center">���� ����</p></font></h1> 

 <nav>
  <ul>
   ������: ���缺
  </ul>
 </nav>

</header>

<div id="sidemenu">

  <br>
  <br>
  <br>
  <br>
  <form Name="member" method="post" Action="member_ok.jsp">
  	<table align="center">
  		<BR>
  		<BR>
  		<BR>
  		<BR>
  		<BR>
  		<BR>
  		<TR><TD><B><%=name%></B>�Ծ������. <BR>����� �ֱ� ���� ������<B><%=iscore%></B></TD></TR>
  		<TR><TD align='center'>���<br>

  	  <% 
  		if(iscore<50)
  		{%>
  			<figure2>
  			<img src="chobo.jpg">
  			</figure2>
  	  <%}
  		else if(50<=iscore&&iscore<100)
  		{%>
  			<figure2>
  			<img src="joongsu.jpg">
  			</figure2>
  	  <%}
  		else if(100<=iscore&&iscore<200)
  		{%>
  			<figure2>
  			<img src="gosu.jpg">
  			</figure2>
  	  <%}
  		else if(200<=iscore&&iscore<400)
  		{%>
  			<figure2>
  			<img src="chogosu.jpg">
  			</figure2>
  	  <%}
  		else
  		{%>
  			<figure2>
  			<img src="god.jpg">
  			</figure2>
  	  <%}
  		%>
  	</TD></TR>
  	</table>
  </form> 	
 
</div>

<article> 
<h1><font size="5.5" color="blue"><p align="left">���ָ� �����ڴ� ��� ��!!</p></font></h1>
<figure>
 <img src="air.jpg">
</figure>
<br>
</article>

<footer>
<p>���缺 ��ȭ:010-8809-8943 email:01048098943@naver.com<br>
shooting program corporation.all rights reserved.
</footer>

</body>
</html>