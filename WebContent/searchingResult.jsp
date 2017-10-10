<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
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


<!-- CSS goes in the document HEAD or added to your external stylesheet -->  
<style>
	@import url(formStyle.css);
	@import url(navigationBarStyle.css);
	@import url(tableStyle.css);
</style>
<title>Search the author's books</title>
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
		
		<h2><font color=white >搜索结果</font></h2>
	
	<br>
<table class="altrowstable" id="alternatecolor" align="center"> 
	<tr>
		<th>该作者图书</th>
	</tr>
	
	<c:forEach items="${session.bookList}" var="book">
	<tr>
		<td><a href="JDBCOperation!showOnesBooks.action?ISBN=${book.ISBN}">${book.title}</a></td>
	</tr>
	</c:forEach>
	</table>
	</div>
	
</body>
</html>