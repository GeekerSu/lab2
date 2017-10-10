<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
	@import url(tableStyle.css);
</style>
<title>Search the author's books</title>
</head>
<body>
	<ul>
<li><a href="searchOnesBook.jsp" class="active" title='searchOnesBook'>搜索图书</a></li>
<li><a href="JDBCOperation!showAllBooks.action" title='showAllBooks'>所有图书</a></li>
<li><a href="JDBCOperation!AddABookPr">添加图书</a></li>
<li><a href="JDBCOperation!showAllAuthors.action" title='showAllAuthors'>所有作者</a></li>
<li><a href="addAuthor.jsp" title='addAuthor'>添加作者</a></li>
<li style="float:right"><a href="index.jsp">主页</a></li>
	</ul>
	<div style="padding:20px;margin-top:30px;height:1500px;">
	
<br>
   <form action="JDBCOperation!searchOnesBooks.action" method="post" class="smart-green">
   <h1>搜索图书
<span>请输入要搜索的图书的作者名</span>
</h1>

		<label>
      <span>AuthorName:</span><input type="text" name="Name" placeholder="作者名"/><br/>
      </label>
      <label>
      <span>&nbsp;</span><input type="submit" class="button"  value="Search"/>
      </label>		
   </form>
   </div>
</body>
</html>