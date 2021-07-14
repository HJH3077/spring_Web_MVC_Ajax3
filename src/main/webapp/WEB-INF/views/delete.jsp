<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{text-decoration: none;}
	table{width: 600px; border-collapse: collapse;; text-align: center;}
	table, th, td{border: 1px solid black; padding: 5px; margin: auto;}
	div{ width: 600px; margin: 100px auto; text-align: center;}
	
	.bg{background-color: #99ccff}
	input{padding: 5px;}
</style>
<script type="text/javascript">
function del_ok(f) {
	// 비밀번호체크
	if(f.pw.value == "${pw}"){
		var chk = confirm("정말 삭제할까요?");
		if(chk){
			f.submit();
		}else{
		   history.go(-1);					
		}
	}else{
		alert("비밀번호틀림");
		f.pwd.value="";
		f.pwd.focus();
		return;
	}
}
</script>
</head>
<body>
	<div>
		<h2>방명록 : 삭제화면</h2>
		<hr>
		<p>[ <a href="list.do">목록으로</a> ]</p>
		<form method="post" action="delete_ok.do">
			<table>
				<tbody>
					<tr><th class="bg">비밀번호</th> <td><input type="password" name="pw" ></td></tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="삭제" onclick="del_ok(this.form)">
							<input type="hidden" name="idx" value="${idx}">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>