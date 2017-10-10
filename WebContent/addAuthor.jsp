<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
	<meta charset="utf-8">
<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
</style>
		<title>AddAuthor</title>
	</head>
	<body>
	<ul>
<li><a href="searchOnesBook.jsp" title='searchOnesBook'>搜索图书</a></li>
<li><a href="JDBCOperation!showAllBooks.action" title='showAllBooks'>所有图书</a></li>
<li><a href="JDBCOperation!AddABookPr">添加图书</a></li>
<li><a href="JDBCOperation!showAllAuthors.action" title='showAllAuthors'>所有作者</a></li>
<li><a href="addAuthor.jsp" class="active" title='addAuthor'>添加作者</a></li>
<li style="float:right"><a  href="index.jsp">主页</a></li>
	</ul>
	<div style="padding:20px;margin-top:30px;height:1500px;">
	<br>
	<form name="form1" action="JDBCOperation!AddAnAuthor.action"
		method="post" class="smart-green">
		<h1>添加作者
<span>请输入要添加的作者的信息</span>
</h1>
		<label>
		<span>AuthorID:</span><input type="text" name="AuthorID" id="AuthorID"placeholder="AuthorID"><br>
		</label>
		<label>
		<span>Name:</span><input type="text" name="Name" id="Name" placeholder="姓名"><br>
		</label>
		<label>
		<span>Age:</span><input type="text" name="Age" id="Age" placeholder="年龄"><br>
		</label>
		<label>
		<span>Country:</span><input type="text" name="Country" id="Country" placeholder="国家"><br>
		</label>
		<label>
		<span>&nbsp;</span>
		<input type="submit" class="button" name="Submit" value="Ok">
		</label>
		
	</form>
</div>
	</body>
</html>


