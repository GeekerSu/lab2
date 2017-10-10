<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="utf-8"> 
<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
</style>
<title>Searching Error</title>
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
	该作者不存在！
	<br>
	你可以<a href="addAuthor.jsp" title='addAuthor'>点击这里</a>来添加一个新作者。<br>
</body>
</html>