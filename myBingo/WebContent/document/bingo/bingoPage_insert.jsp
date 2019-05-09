<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/document/common/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
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
	$(function(){
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
	</script>
</body>
</html>