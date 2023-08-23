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
    <title>${boardFree.bTitle}</title>
</head>
<body>
    <div id="container">
        <%@include file="../../header.jsp" %>
        <div id="content">
        		<div id="board_bar"><span>자유게시판</span></div>
            <div id="wrap_hm">
                <div id="content_header">
                    <div id="ch_title">
                    		<span>제목 : ${boardFree.bTitle}</span>
                    </div>
                    <div id="ch_id_date">
	                     <span>${boardFree.bUserId}</span>
	                     <span>${boardFree.bCDate} 조회 ${boardFree.bCount}</span>
                    </div>
                </div>
                <hr>
                <div id="content_main">
                    ${boardFree.bContent}
                </div>
                <hr>
                <div id="comment">
                	  <p>댓글</p>
                	  <hr>
                    <div id="comment_list">
                    		<c:set var="comListChk" value="${fn:length(bfComList)}"/>
                    		<c:choose>
	                    		<c:when test="${comListChk != 0}">
		                	      <c:forEach var="comList" items="${bfComList}">
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
			                    <form method="post" action="/bfpost/addcom" enctype="multipart/form-data">
			                    		<input type="hidden" name="cBNum" value="${boardFree.bNum}">
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
        <%@include file="../../footer.jsp" %>
    </div>
</body>
</html>