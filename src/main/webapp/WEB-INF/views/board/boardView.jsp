<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/board/boardView.css">
    <script src="/js/board/board.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <title>${board.bTitle}</title>
</head>
<body>
    <div id="container">
        <%@include file="../header.jsp" %>
        <div id="content">
        		<div id="board_bar"><span>자유게시판</span></div>
            <div id="wrap_hm">
                <div id="content_header">
                    <div id="ch_title">
                    		<span>제목 : ${board.bTitle}</span>
                    </div>
                    <div id="ch_id_date">
	                     <span>${board.bUserId}</span>
	                     <span>${board.bCDate} 조회 ${board.bCount}</span>
                    </div>
                </div>
                <hr>
                <div id="content_main">
                    ${board.bContent}
                </div>
                <div id="rcm">
                	 <button id="rcm_up_button" type="button" onclick="rcm()"><img src="/images/board/like.png"></button>
                	 <span id="rcm_num">추천 수 : ${board.bRcm}</span>
                </div>
                <script>
                	 const bNum = '${board.bNum}';
                	 const rUserNum = '${userInfo.lUserNum}';
                	 function rcm() {
 							 if (${userInfo != null}) {
	                		 const param = JSON.stringify({
	                				 rBNum : bNum,
	                		 		 rUserNum : rUserNum
                		 	 });
                		 	 $.ajax({
                		 		 type: 'POST',
                		 		 url: '/board/${boardType}/rcm',
                		 		 data: param,
                		 		 contentType: 'application/json',
                		 		 success: 
                		 		 function(data) {
	                		 		 if (!data) {
	                		 		 	 alert('추천 하였습니다');	 
	                		 		 	 document.getElementById('rcm_num').innerHTML = '추천 수 : ${board.bRcm +1}';
	                    		 	 }
	                    		 	 else {
	                    		 		alert('이미 추천한 게시글입니다');
	                    		 	 }
                		 		 }
                		 	 }) 
                	 	 }
 							 else
 							 	 alert('로그인 후 이용할 수 있습니다!');
                	 }
                </script>
                <hr>
                <div id="comment">
                	  <p>댓글</p>
                	  <hr>
                    <div id="comment_list">
                    		<c:set var="comListChk" value="${fn:length(comList)}"/>
                    		<c:choose>
	                    		<c:when test="${comListChk != 0}">
		                	      <c:forEach var="comList" items="${comList}">
		                	      	<span>아이디${comList.cUserNum}</span>
		                	      	<span>내용${comList.cContent}</span>
		                	      	<hr>
		                	      </c:forEach> 
	                	      </c:when>
	                	      <c:otherwise>
	                	      	<span>댓글이 없습니다!</span>
	                	      	<hr>
	                	      </c:otherwise>
                	      </c:choose>
                	  </div>
                	  <span>${userInfo.getlUserId()}</span>
	                	  <c:choose>
	                	  <c:when test="${userInfo != null}">
		                	  <div id="comment_write">
			                    <form method="post" action="/board/${boardType}/addcom" enctype="multipart/form-data">
			                    		<input type="hidden" name="cBNum" value="${board.bNum}">
			                        <textarea name="cContent" onkeydown="resizeTextArea(this)"></textarea>
			                        <button type="submit">댓글등록</button>
			                    </form>
		                    </div>
	                    </c:when>
	                    <c:otherwise>
		                    <div id="comment_write">
		                        <textarea disabled>댓글을 등록하려면 로그인을 해주세요.</textarea>
		                        <button type="button">로그인 필요</button>
		                    </div>
	                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>