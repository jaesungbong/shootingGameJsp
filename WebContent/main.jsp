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
	font-family: "Yj BLOCK 중간";
	font-size: 0.75em
}
article 
{
	float:left;
	width:75%;
	height:500px;
	font-size: 0.9em;
	font-family: "Yj BLOCK 중간";
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
			alert("아이디를 입력하시오.");
			member,id.focus();
			return false;
		}
		if(member.pass.value.length<1)
		{
			alert("비밀번호를 입력하시오.");
			member.id.focus();
			return false;
		}
		member.submit();	
	}
</script>

<title>Insert title here</title>
</head>
<body>

<header> <h1><font size="5.5" color="blue"><p align="center">슈팅 게임</p></font></h1> 

 <nav>
  <ul>
   제작자: 박재성
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
  		<TR><TD>아이디</TD><TD><input type="text" name="id"></TD></TR>
  		<TR><TD>비밀번호</TD><TD><input type="password" name="password"></TD></TR>
  		<TR><TD><input type="submit" value="로그인" onclick="check()"></TD><TD>
  		<input type="button" value="회원가입" onclick="window.open('member_join.jsp','회원가입','width=500,height=300')">
  		<input type="button" value="ID/비밀번호 찾기" onclick="window.open('find.jsp','회원가입','width=500,height=300')"></TD></TR>
   	</table>
  </form> 	
 
</div>

<article> 
<h1><font size="5.5" color="blue"><p align="left">슈팅게임 JSP 페이지</p></font></h1>
<figure>
 <img src="air.jpg">
</figure>
</article>
<footer>
<p>박재성 전화:010-8809-8943 email:manle4@outlook.kr<br>
shooting program corporation.all rights reserved.
</footer>

</body>
</html>