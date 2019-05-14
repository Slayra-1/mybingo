<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/document/common/top.jsp" %>
<style>
	#bingoTable{
		text-align: center;
	}
	#bingoTable td{
		border: 1px solid lightgray;
	}
</style>
<body>
	<div class="container">
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody id="boardList">
				<tr>
					<td>1</td>
					<td>일반</td>
					<td>운영자</td>
					<td>지금</td>
					<td>0</td>
				</tr>
				<tr>
					<td>2</td>
					<td>ㅇㅇㅇ</td>
					<td>운영자</td>
					<td>지금</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td>ㅁㅁㅁ</td>
					<td>운영자</td>
					<td>지금</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		
		<hr/>
		
		<a class="btn btn-primary" style="margin-bottom:10px; color:white;">빙고 작성</a>
		
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">이전</a></li>
				<li class="page-item active"><a class="page-link " href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</nav>
	</div>
</body>

<script type="text/javascript">
	$(function(){
		$('#boardList tr').bind('click', function(){
			var num = $(this).children().first().text();
			
			window.location = "/bingo/selectBingoIntro.do?bingoId=" + num;
		})
	})
</script>