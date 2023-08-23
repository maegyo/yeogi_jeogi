<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" href="/css/board/boardWrite.css" type="text/css">
	 <script src="/js/board/boardWrite.js"></script>
    <title>글 쓰기</title>
</head>
<body>
    <div id="container">
        <%@include file="../../header.jsp" %>
        <div id="content">
        		<form method="post" action="/bfwrite/add" enctype="multipart/form-data">
	            <div id="content_header">
	                <span>제목 : </span><input type="text" placeholder="제목을 입력하세요." name="bTitle">
	                <select name="bSort">
	                	<option>후기</option>
	                	<option>asdad</option>
	                </select>
	                <div id="buttons">
	                    <select id="font_sel" onchange="setFont(this.value)">
	                        <option value="Culim" selected>굴림</option>
	                        <option value="CulimChe">굴림체</option>
	                        <option value="Dotum">돋움</option>
	                        <option value="DotumChe">돋움체</option>
	                        <option value="BaTang">바탕</option>
	                        <option value="BaTangChe">바탕체</option>
	                        <option value="Gungsuh">궁서</option>
	                        <option>궁서체</option>
	                    </select>
	                    <select>
	                        <option>48px</option>
	                        <option>36px</option>
	                        <option>24px</option>
	                        <option>18px</option>
	                        <option>14px</option>
	                        <option>12px</option>
	                        <option>11px</option>
	                        <option>10px</option>
	                    </select>
	                    <button id="font_bold" type="button" onclick="setBold()"><img src="/images/board/bold_icon.png"></button>
	                    <button id="font_italic"type="button" onclick="setItalic()"><img src=""></button>
	                    <button type="button" onclick=""><img src=""></button>
	                    <button type="button" onclick=""><img src=""></button>
	                    <button type="button" onclick=""><img></button>
	                    <button type="button" onclick=""><img src=""></button>
	                </div>
	            </div>
	            <div id="content_text" contenteditable="true"></div>
	            <input id="htmlContainer" type="text" name="bContent" value="">
	            <div id="wrap_button">
	                <button type="submit" onclick="getHtml()">글 등록하기</button>
	            </div>
            </form>
        </div>
        <%@include file="../../footer.jsp" %>
    </div>
</body>
</html>