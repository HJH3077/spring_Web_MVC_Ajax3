<%@page import="java.util.List"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {
	text-align: center; margin: auto;
	}
	table {
	width: 500px; margin: auto; text-align: center;
	}
	table, th, td{
		border: 3px solid skyblue;
		border-collapse: collapse;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url: "list_ok.do",
		method : "post",
		dataType : "json",
		success : function(data) {
		  // console.log(data);
		  var tbody = "" ;
		  $.each(data,function(){
			  tbody +="<tr>";
			  tbody +="<td>"+this["idx"] +"</td>";
			  tbody +="<td>"+this["name"] +"</td>";
			  								// idx 속성
			  tbody +="<td><span id='onelist' idx='"+this["idx"]+"'>"+this["title"] +"</span></td>";
			  tbody +="<td>"+this["reg"].substring(0,10) +"</td>";
			  tbody +="</tr>";
		  });
		  $("#tbody").append(tbody);
			
		},
		error : function() {
			alert("읽기실패");
		}
	});
	$("table").on("click","#onelist",function() {
		location.href="onelist.do?idx="+$(this).attr("idx");
	});
});
</script>
</head>
<body>
	<div>
		<h1 style="text-align: center">방명록</h1>
		<hr>
		<p style="text-align: center">
			[<a href="write.do">방명록쓰기</a>]
		</p>
		<form method="post">
			<table>
				<thead style="background-color: #99ccff">
					<tr>
						<th style="width: 10%">번호</th>
						<th style="width: 20%">작성자</th>
						<th style="width: 40%">제목</th>
						<th style="width: 30%">작성일</th>
					</tr>
				</thead>
				<tbody id="tbody"></tbody>
			</table>
		</form>
	</div>
</body>
</html>