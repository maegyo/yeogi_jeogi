<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/board/boardList.css" type="text/css">
    <script src="/js/board/board.js"></script>
    <title>자유게시판</title>
</head>
<body>
    <div id="container">
        <%@include file="../header.jsp" %>
        <div id="content">
            <div id="wrap_content_header">
                <div id="content_header">
                <c:set var="boardType" value="${boardType}"/>
					 <script>
						 setBoardLabel();
						 function setBoardLabel() {
						 	let boardType = '<c:out value="${boardType}"/>';
						 	
						 	if (boardType == 'free'|| boardType == 'travel') {
						 		document.getElementById('content_header').innerHTML = '<input id="radio_1" type="radio" name="board_check" value="free">'
						 																				+'<input id="radio_2" type="radio" name="board_check" value="travel">'
						 														                  +'<label for="radio_1"><a href="/board/free">자유게시판</a></label>'
						 														                  +'<label for="radio_2"><a href="/board/travel">나만의 여행지</a></label>';
						 	}
						 	else {
						 		document.getElementById('content_header').innerHTML = '<input id="radio_1" type="radio" name="board_check" value="event">'
						 																				+'<input id="radio_2" type="radio" name="board_check" value="notice">'
						 														                  +'<label for="radio_1"><a href="/board/event">이벤트</a></label>'
						 														                  +'<label for="radio_2"><a href="/board/notice">공지사항</a></label>';
						 	}
						 	if (boardType == 'free') {
						 		document.getElementById('content_header').firstChild.setAttribute('checked', true);
						 	}
						 	else if (boardType == 'travel') {
						 		document.getElementById('content_header').firstChild.nextSibling.setAttribute('checked', true);
						 	}
						 	else if (boardType == 'event') {
						 		document.getElementById('content_header').firstChild.setAttribute('checked', true);
						 	}
						 	else if (boardType == 'notice') {
						 		document.getElementById('content_header').firstChild.nextSibling.setAttribute('checked', true);
						 	}
						 }
					 </script>
                </div>
            </div>
            <div id="wrap_board_search">
                <div id="board_search">           
                		<select id="sSort">
                			 <option value="all" selected>전체</option>
                			 <option value="title">제목</option>
                			 <option value="content">내용</option>
                			 <option value="id">아이디</option>
                		</select>         
                    <input type="text" id="sWord">
                    <button id="searchA" onclick="setHref()"><img src="/images/board/search_icon.png"></button>
            	 </div>
           	</div>
            <div id="board">
            	 <c:set var="maxPageNum" value="${allPageNum}"/>
            	 <c:choose>
	            	 <c:when test="${maxPageNum != 0}">
		                <table>
		                 	<colgroup>
		                        <col width="8%">
		                        <col width="13%">
		                        <col width="50%">
		                        <col width="8%">
		                        <col width="8%">
		                        <col width="8%">
		                        <col width="5%">
		                    </colgroup>
		                    <tr>
		                        <th>글 번호</th>
		                        <th>
		                            말 머리
		                            <select id="board_sort">
		                                <option>후기</option>
		                                <option>여행지 추천</option>
		                            </select>
		                        </th>
		                        <th>제목</th>
		                        <th>글쓴이</th>
		                        <th>작성일</th>
		                        <th>조회수</th>
		                        <th>추천</th>
		                    </tr>
		                    <c:forEach var="bfList" items="${boardList}" varStatus="status">
		                     <tr>
		                      <td>${bfList.bSubNum}</td>
		                      <td>${bfList.bSort}</td>
		                      <td>
		                      	<a href="/board/${boardType}/view/${bfList.bNum}">
		                      		<c:set var="maxTitleLength" value="30"/>
		                      		<c:set var="title" value="${bfList.bTitle}"/>
		                       	<c:set var="titleLength" value="${fn:length(title)}"/>
		                       	<c:choose>
		                       		<c:when test="${titleLength >= maxTitleLength}">
		                       			${fn:substring(title, 0, maxTitleLength -4)}${"..."}
		                       		</c:when>
		                       		<c:otherwise>
		                       			${bfList.bTitle}
		                       		</c:otherwise>
		                       	</c:choose>
		                    	  </a>
		                      </td>
		                      <td>${bfList.bUserId}</td>
		                      <td>${bfList.bCDate}</td>
		                      <td>${bfList.bCount}</td>
		                      <td>${bfList.bRcm}</td>
		              			</tr>
		              		</c:forEach>
		                </table>
	                </c:when>
	                <c:otherwise>
						 	 <span id="nonelist">게시글이 없습니다!</span>
						 </c:otherwise>
                </c:choose>
              	 <c:if test="${managerInfo != null}">
             	 	  <c:if test="${boardType eq 'notice' || boardType eq 'event'}">
             	 	      <a id="board_write" href="/board/${boardType}/write">글쓰기</a>
             	 	  </c:if>
              	 </c:if>
              	 <c:if test="${userInfo != null}">
                 	 <c:if test="${boardType eq 'free' || boardType eq 'travel'}">
             	 	      <a id="board_write" href="/board/${boardType}/write">글쓰기</a>
             	 	  </c:if>
              	 </c:if>
            </div>
            <c:if test="${maxPageNum != 0}">
	            <div id="wrap_board_num">
	            	<ul>
	             	<c:set var="pageNum" value="${pageNum}"/>
	             	<c:choose>
	             		<c:when test="${maxPageNum <= pageNum}">
	             			<c:set var="maxNum" value="1"/>
	             		</c:when>
	             		<c:when test="${maxPageNum % pageNum == 0 }">
	             			<c:set var="maxNum" value="${maxPageNum / pageNum}"/>
	             		</c:when>
	             		<c:otherwise>
	             			<c:set var="maxNum" value="${maxPageNum / pageNum + 1}"/>
	             		</c:otherwise>
	             	</c:choose>
	             	<c:forEach var="i" begin="1" end="${maxNum}" step="1">
	             		<c:choose>
		             		<c:when test="${pageColor == i}">
		             			<li><a id="pagenumcolor" href="/board/post/${i}">${i}</a></li>
		             		</c:when>
		             		<c:otherwise>
		             			<li><a href="/board/${boardType}/${i}">${i}</a></li>
		             		</c:otherwise>
	          			</c:choose>
	             	</c:forEach>
	            	</ul>
	            </div>
            </c:if>
        </div>
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>