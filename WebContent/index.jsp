<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>

<head>
<meta charset="utf-8">
<style>
@import url(navigationBarStyle.css);
</style>
<title>图书管理系统</title>
</head>
<body>

	<ul>
		<li><a href="searchOnesBook.jsp" title='searchOnesBook'>搜索图书</a></li>
		<li><a href="JDBCOperation!showAllBooks.action"
			title='showAllBooks'>所有图书</a></li>
		<li><a href="JDBCOperation!AddABookPr">添加图书</a></li>
		<li><a href="JDBCOperation!showAllAuthors.action"
			title='showAllAuthors'>所有作者</a></li>
		<li><a href="addAuthor.jsp" title='addAuthor'>添加作者</a></li>
		<li style="float: right"><a class="active" href="index.jsp">主页</a></li>
	</ul>
	<div
		style="padding: 20px; margin-top: 30px; height: 1500px; color: white"
		align="center">
		<div class="center">
		<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<font size="300%">图书管理系统</font>
			
			<br>
		</div>
	</div>

</body>
</html>
