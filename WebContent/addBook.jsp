<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
	<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
	</style>
		<title>AddBook</title>
	</head>
	<body>
	<ul>
<li><a href="searchOnesBook.jsp" title='searchOnesBook'>搜索图书</a></li>
<li><a href="JDBCOperation!showAllBooks.action" title='showAllBooks'>所有图书</a></li>
<li><a class="active" href="JDBCOperation!AddABookPr">添加图书</a></li>
<li><a href="JDBCOperation!showAllAuthors.action" title='showAllAuthors'>所有作者</a></li>
<li><a href="addAuthor.jsp" title='addAuthor'>添加作者</a></li>
<li style="float:right"><a  href="index.jsp">主页</a></li>
	</ul>
	<div style="padding:20px;margin-top:30px;height:1500px;">
	<br>
	<form name="form1" action="JDBCOperation!AddABook.action" method="post" class="smart-green">
	<h1>添加图书
<span>请输入要添加的图书的信息</span>
</h1>
	<label>			
		<span>ISBN:</span><input type="text" name="ISBN" id="ISBN" placeholder="ISBN" ><br>
		</label> 
<label> 		
		<span>Title:</span><input type="text" name="Title" id="Title" placeholder="标题"><br>
		</label> 
<label>		
	   	<span>Publisher:</span><input type="text" name="Publisher" id="Publisher" placeholder="出版社"><br>
	   	</label> 
<label> 		
		<span>PublishDate:</span><input type="text" name="PublishDate" id="PublishDate" placeholder="yyyy-mm-dd"><br>
		</label> 
<label> 
		<span>Price:</span><input type="text" name="Price" id="Price" placeholder="价格"><br>
		</label> 
	<label> 
		<span>AuthorID:</span><select name="AuthorID">
		<c:forEach items="${session.authorList}" var="author">
		<option value='${author.authorID}'>${author.authorID}</option>
			</c:forEach>
		</select>

		<input type="button" class="button" name="AddAuthor" value="添加作者" onclick="window.location.href='addAuthor.jsp?ISBN=${book.ISBN}&action=null&praction=updt'" /><br>
		</label> 
		<label> 
		<span>&nbsp;</span><input type="submit" class="button" name="Submit" value="Submit">
		</label> 
	</form>

	</div>
	</body>
</html>


