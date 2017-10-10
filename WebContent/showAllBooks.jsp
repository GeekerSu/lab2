<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<!-- Javascript goes in the document HEAD -->  
<script type="text/javascript">  
function altRows(id){  
    if(document.getElementsByTagName){    
          
        var table = document.getElementById(id);    
        var rows = table.getElementsByTagName("tr");   
           
        for(i = 0; i < rows.length; i++){            
            if(i % 2 == 0){  
                rows[i].className = "evenrowcolor";  
            }else{  
                rows[i].className = "oddrowcolor";  
            }        
        }  
    }  
}  
  
window.onload=function(){  
    altRows('alternatecolor');  
}  
</script>
<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
	@import url(tableStyle.css);
</style>

</head>
<body>
	<ul>
<li><a href="searchOnesBook.jsp" title='searchOnesBook'>搜索图书</a></li>
<li><a href="JDBCOperation!showAllBooks.action" class="active" title='showAllBooks'>所有图书</a></li>
<li><a href="JDBCOperation!AddABookPr">添加图书</a></li>
<li><a href="JDBCOperation!showAllAuthors.action" title='showAllAuthors'>所有作者</a></li>
<li><a href="addAuthor.jsp" title='addAuthor'>添加作者</a></li>
<li style="float:right"><a href="index.jsp">主页</a></li>
	</ul>
	<div style="padding:20px;margin-top:30px;height:1500px;" align="center">
	<br>
<table class="altrowstable" id="alternatecolor" align="center">  
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
	<tr class="alt">
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
</body>
		</html>
