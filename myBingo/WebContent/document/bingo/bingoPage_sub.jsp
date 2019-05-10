<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="/document/common/top.jsp" %>
<%
	List<Map<String, Object>> listMap = (List<Map<String, Object>>)request.getAttribute("list");
	
	String bingoId  = "";
		
	if(null==listMap){
	
	}else{
	
		bingoId  = listMap.get(0).get("bingoId")==null?"": String.valueOf(listMap.get(0).get("bingoId"));
	}
%>
<style>
	#bingoTable{
		text-align: center;
	}
	#bingoTable td{
		border: 1px solid lightgray;
	}
	.btn-secondary:focus, .btn-secondary:active {
	  box-shadow: none !important;
	}
	.btn-secondary{
		margin:0 3px 0 0;
	}
</style>
<body style="background-color:lightgray;">
	<div class="container" style="background-color:white;">
		<h1>here is bingo page</h1>
		<br>
		<table class="table" id="bingoTable">
			<tr>
				<td>1-1</td>
				<td>1-2</td>
				<td>1-3</td>
				<td>1-4</td>
				<td>1-5</td>
			</tr>
			<tr>
				<td>2-1</td>
				<td>2-2</td>
				<td>2-3</td>
				<td>2-4</td>
				<td>2-5</td>
			</tr>
			<tr>
				<td>3-1</td>
				<td>3-2</td>
				<td>3-3</td>
				<td>3-4</td>
				<td>3-5</td>
			</tr>
			<tr>
				<td>4-1</td>
				<td>4-2</td>
				<td>4-3</td>
				<td>4-4</td>
				<td>4-5</td>
			</tr>
			<tr>
				<td>5-1</td>
				<td>5-2</td>
				<td>5-3</td>
				<td>5-4</td>
				<td>5-5</td>
			</tr>
		</table>
		
		<div id="hashtag_area">
			<i class="fas fa-tags" style="margin-right:3px;"></i>
		</div>
		
		<br>
		
		<button type="button" class="btn btn-primary" id="twitterBtn"><i class="fab fa-twitter"></i> Twitter</button>
		<button type="button" class="btn btn-info" id="facebookBtn"><i class="fab fa-facebook"></i> Facebook</button>
		<button type="button" class="btn btn-success" id="imageBtn"><i class="fas fa-images"></i> 이미지로 저장</button>
		<!-- <div class="form-check">
		  <input class="form-check-input" type="checkbox" value="" id="sendOriginal">
		  <label class="form-check-label" for="sendOriginal">원본을 같이 업로드</label>
		</div> -->
		<div class="form-check">
			<input class="form-check-input" type="radio" name="sendTypeRadio" id="sendTypeRadio1" value="1" checked>
			<label class="form-check-label" for="sendTypeRadio1">링크만 업로드</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="sendTypeRadio" id="sendTypeRadio2" value="2">
			<label class="form-check-label" for="sendTypeRadio2">원본을 같이 업로드</label>
		</div>
	</div>
	
	<script>
	var bingoId = '<%=bingoId%>';
	
	$(function(){
		fn_selectBingo();
		
		$("#twitterBtn").click(function(){
			var value = $(":radio[name='sendTypeRadio']:checked").val();
			alert("Twitter : " + value);
		})
		
		$("#facebookBtn").click(function(){
			var value = $(":radio[name='sendTypeRadio']:checked").val();
			alert("Facebook : " + value);
		})
		
		$("#imageBtn").click(function(){
			alert("이미지로 저장");
		})
		
	})
	
	function fn_selectBingo(){
			var formData = new FormData();
			formData.append("bingoId", bingoId);
			
			$.ajax({
				url: encodeURI('/bingo/selectBingo.do'),
				data: formData,
				dataType: "json",
				type: 'POST',
				contentType: false,
				processData: false,
				success: function(data){
					if(data.msgCode == 0){
						var splitStr = data.tags.split(',');
						var hashNumber = 0;
						
						for(var i in splitStr){
							var innerHTML = '<button class="btn btn-sm btn-secondary" id="hashtag'+ ++hashNumber +'">#' + splitStr[i] + '</button>'
							$('#hashtag_area').append(innerHTML);
							
							// 동적으로 생성된 버튼 객체에 이벤트 할당
							$('#hashtag_area button').unbind("click").on("click", function(){
								alert(this.innerHTML);
							});
						}
					}else{
						$('.modal-title').text(data.msgTitle);
						$('.modal-body').html(data.msgDesc);
						$('#myModal').modal('show');
					}
				},
				error : function(xhr, status, error) {
					$('.modal-title').text("알림");
					$('.modal-body p').text("데이터 조회에 실패했습니다. 나중에 다시 시도해주세요.");
					$('#myModal').modal('show');
				}
			});
		}
	</script>
	
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog" role="document">
		    <div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
			        </button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
