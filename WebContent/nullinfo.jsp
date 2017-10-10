<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="utf-8"> 
<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
</style>
<title>Input Error</title>
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
	<div  style="padding:20px;margin-top:30px;height:1500px;" align="center">
	<br>
	<div  class="ex">
	<s:property value="errorMsg" />
	输入信息有空项！你可以<a onclick ="javascript:history.go(-1);"><font color=blue >点击这里</font></a>来返回上一页面。<br>
	</div>
	</div>
</body>
</html>