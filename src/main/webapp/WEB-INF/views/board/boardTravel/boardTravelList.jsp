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
    <title>자유게시판</title>
</head>
<body>
    <div id="container">
        <%@include file="../../header.jsp" %>
        <div id="content">
            <div id="wrap_content_header">
                <div id="content_header">
                    <input id="radio_free" type="radio" name="board_check" value="free">
                    <input id="radio_travel" type="radio" name="board_check" value="travel" checked>
                    <label for="radio_free"><a href="/bflist">자유게시판</a></label>
                    <label for="radio_travel"><a href="/btlist">나만의 여행지</a></label>
                </div>
            </div>
            <div id="wrap_board_search">
                <form id="searchForm"  method="get" action="/search/" enctype="multipart/form-data">
                    <div id="board_search">           
                    		<select name="sSort">
                    			 <option value="all" selected>전체</option>
                    			 <option value="title">제목</option>
                    			 <option value="content">내용</option>
                    			 <option value="id">아이디</option>
                    		</select>         
                        <input type="text" name="sWord">
                        <button type="submit" onclick=""><img src="/images/board/search_icon.png"></button>
                    </div>
                </form>
            </div>
            <script>
            	 function setFormAction() {
            	 	 document.getElementById('searchForm').action = '/search/'+document.getElementsByName('sWord').value;
            	 }
            </script>
				<div id="board">
					<c:set var="maxPageNum" value="${btMaxPageNum}"/>
					<c:choose>
						<c:when test="${maxPageNum != 0}">
							<table>
								<colgroup>
									<col width="10%">
									<col width="55%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="5%">
								</colgroup>
								<tr>
								    <th>글 번호</th>
								    <th>제목</th>
								    <th>글쓴이</th>
								    <th>작성일</th>
								    <th>조회수</th>
								    <th>추천</th>
								</tr>
								<c:forEach var="btList" items="${btList}" varStatus="status">
								<tr>
								 	<td>${btList.bSubNum}</td>
									<td>
										<a href="/btpost/${btList.bNum}">
											<c:set var="maxTitleLength" value="30"/>
											<c:set var="title" value="${btList.bTitle}"/>
											<c:set var="titleLength" value="${fn:length(title)}"/>
											<c:choose>
												<c:when test="${titleLength >= maxTitleLength}">
													${fn:substring(title, 0, maxTitleLength -4)}${"..."}
												</c:when>
												<c:otherwise>
													${btList.bTitle}
												</c:otherwise>
											</c:choose>
										</a>
									</td>
									<td>${btList.bUserId}</td>
									<td>${btList.bCDate}</td>
									<td>${btList.bCount}</td>
									<td>${btList.bRcm}</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<span id="nonelist">게시글이 없습니다!</span>
					</c:otherwise>
				</c:choose>
				<c:if test="${userInfo != null}">
					<a id="board_write" href="/btwrite">글쓰기</a>
				</c:if>
			</div>
			<c:if test="${maxPageNum != 0}">
				<div id="wrap_board_num">
					<ul>
						<c:set var="pageNum" value="${PageNum}"/>
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
		             		<c:when test="${btPageColor == i}">
		             			<li><a id="pagenumcolor" href="/btlist/${i}">${i}</a></li>
		             		</c:when>
		             		<c:otherwise>
		             			<li><a href="/btlist/${i}">${i}</a></li>
		             		</c:otherwise>
	          			</c:choose>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</div>
      <%@include file="../../footer.jsp" %>
	</div>
</body>
</html>