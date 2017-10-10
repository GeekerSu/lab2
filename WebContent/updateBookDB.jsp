<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
	<meta charset="utf-8"> 
		<style type="text/css">
			@import url(formStyle.css);
			@import url(navigationBarStyle.css);
    	</style>
	<title>UpdateInput</title>
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
	<div style="padding:20px;margin-top:30px;height:1500px;">
	<br>
	<c:forEach items="${session.bookList}" var="book">
	<form name="form1" action="JDBCOperation!updateBookInfo.action" method="post" class="smart-green">
	 <h1>更新图书
	 <span>请输入要修改的图书的信息</span>
</h1>
		<label>		
		<span>ISBN:</span><input type="text" name="ISBN" id="ISBN"value='${book.ISBN}'readonly=""><br> 
	</label>
		<label>				
		<span>Title:</span><input type="text" name="Title" id="Title" value='${book.title}'><br>
		</label>
		<label>	
	   <span>Publisher:</span><input type="text" name="Publisher" id="Publisher"value='${book.publisher}'><br> 
		</label>
		<label>	
		<span>PublishDate:</span><input type="text" name="PublishDate" id="PublishDate"value='${book.publishDate}'><br> 
		</label>
		<label>	
		<span>Price:</span><input type="text" name="Price" id="Price" value='${book.price}'><br>
		</label>
		<label>	
		<span>AuthorID:</span><select name="AuthorID">
		<option value='${book.authorID}'>${book.authorID}</option>
		<c:forEach items="${session.authorList}" var="author">
			<option value='${author.authorID}'>${author.authorID}</option>
		</c:forEach>
		</select>
		<input type="button" class="button" name="AddAuthor" value="添加作者" onclick="window.location.href='addAuthor.jsp?ISBN=${book.ISBN}&action=null&praction=updt'" /><br>
		</label>
		<label>	
		<span>&nbsp;</span><input  class="button" type="submit"name="Submit" value="Submit">
		</label>
		
	</form>
	
	</c:forEach>
	</div>
	</body>
</html>


