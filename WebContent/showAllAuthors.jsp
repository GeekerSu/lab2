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

<meta charset="utf-8">
<!-- CSS goes in the document HEAD or added to your external stylesheet -->  
<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
	@import url(tableStyle.css);
</style>
</head>
<body>
	<ul>
<li><a href="searchOnesBook.jsp" title='searchOnesBook'>搜索图书</a></li>
<li><a href="JDBCOperation!showAllBooks.action" title='showAllBooks'>所有图书</a></li>
<li><a href="JDBCOperation!AddABookPr">添加图书</a></li>
<li><a href="JDBCOperation!showAllAuthors.action" class="active" title='showAllAuthors'>所有作者</a></li>
<li><a href="addAuthor.jsp" title='addAuthor'>添加作者</a></li>
<li style="float:right"><a href="index.jsp">主页</a></li>
	</ul>
	<div style="padding:20px;margin-top:30px;height:1500px;" align="center">
		<br>
<table class="altrowstable" id="alternatecolor">  
	<tr>
		<th>AuthorID</th>
		<th>Name</th>
		<th>Age</th>
		<th>Country</th>
		<th>Operation</th>
	</tr>
	
	<c:forEach items="${session.authorList}" var="author">
	<tr>
		<td>${author.authorID}</td>
		<td>${author.name}</td>
		<td>${author.age}</td>
		<td>${author.country}</td>
		<td><a href="JDBCOperation!deleteAuthor?AuthorID=${author.authorID}">删除</a></td>
	</tr>
	</c:forEach>
	</table>

	</div>
</body>
</html>