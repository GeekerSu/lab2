<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Javascript goes in the document HEAD -->
<script type="text/javascript">
	function altRows(id) {
		if (document.getElementsByTagName) {

			var table = document.getElementById(id);
			var rows = table.getElementsByTagName("tr");

			for (i = 0; i < rows.length; i++) {
				if (i % 2 == 0) {
					rows[i].className = "evenrowcolor";
				} else {
					rows[i].className = "oddrowcolor";
				}
			}
		}
	}

	window.onload = function() {
		altRows('alternatecolor');
		altRows('alternatecolor2');
	}
</script>
<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
	@import url(tableStyle.css);
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
<li><a href="searchOnesBook.jsp" title='searchOnesBook'>搜索图书</a></li>
<li><a href="JDBCOperation!showAllBooks.action" title='showAllBooks'>所有图书</a></li>
<li><a href="JDBCOperation!AddABookPr">添加图书</a></li>
<li><a href="JDBCOperation!showAllAuthors.action" title='showAllAuthors'>所有作者</a></li>
<li><a href="addAuthor.jsp" title='addAuthor'>添加作者</a></li>
<li style="float:right"><a href="index.jsp">主页</a></li>
	</ul>
	<br>
	<div style="padding:20px;margin-top:30px;height:1500px;" align="center">
		
		<h2><font color=white >图书及作者详细信息</font></h2>


<div>
		<table class="altrowstable"  align="center" id="alternatecolor">
			<tr>
				<th>ISBN</th>
				<th>Title</th>
				<th>Publisher</th>
				<th>PublishDate</th>
				<th>Price</th>
				<th>AuthorID</th>
				<th colspan="2">Operations</th>
			</tr>

			<c:forEach items="${session.bookList}" var="book">
				<tr>
					<td>${book.ISBN}</td>
					<td>${book.title}</td>
					<td>${book.publisher}</td>
					<td>${book.publishDate}</td>
					<td>${book.price}</td>
					<td>${book.authorID}</td>
					<td><a href="JDBCOperation!updateBookInfoPr?ISBN=${book.ISBN}">修改</a></td>
					<td><a href="JDBCOperation!deleteBook?ISBN=${book.ISBN}">删除</a></td>
				</tr>
				</c:forEach>
			</table>
			</div>
		<div>
			<table class="altrowstable"  align="center" id="alternatecolor2">
			

			<tr>
				<th>AuthorID</th>
				<th>Name</th>
				<th>Age</th>
				<th>Country</th>
			</tr>

			<c:forEach items="${session.authorList}" var="author">
				<tr>
					<td>${author.authorID}</td>
					<td>${author.name}</td>
					<td>${author.age}</td>
					<td>${author.country}</td>
				</tr>
			</c:forEach>
		</table>
	</div>	
	
	<br>
</body>
</html>