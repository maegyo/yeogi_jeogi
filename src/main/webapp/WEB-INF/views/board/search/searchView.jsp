<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
	 <meta charset="UTF-8">
	 <link rel="stylesheet" href="/css/board/search/search.css" type="text/css">
	 <link rel="stylesheet" href="/css/header.css" type="text/css">
	 <link rel="stylesheet" href="/css/footer.css" type="text/css">
<title>  </title>
</head>
<body>
	<%@include file="../../header.jsp" %>
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
         <c:if test="${searchBF != null}">
         	 <span>asdasdasd</span>
         </c:if>
         <c:forEach var="searchBF" items="${searchBF}" varStatus="status">
          <tr>
           <td class="board_col">${searchBF.bNum}</td>
           <td class="board_col">${searchBF.bSort}</td>
           <td>
           	<a href="/bf/post/${searchBF.bNum}">
           		<c:set var="maxTitleLength" value="30"/>
           		<c:set var="title" value="${searchBF.bTitle}"/>
            	<c:set var="titleLength" value="${fn:length(title)}"/>
            	<c:choose>
            		<c:when test="${titleLength > maxTitleLength}">
            			${fn:substring(title, 0, maxTitleLength -4)}${"..."}
            		</c:when>
            		<c:otherwise>
            			${searchBF.bTitle}
            		</c:otherwise>
            	</c:choose>
         	  </a>
           </td>
           <td class="board_col">${searchBF.bUserId}</td>
           <td class="board_col">${searchBF.bCDate}</td>
           <td class="board_col">${searchBF.bCount}</td>
           <td class="board_col">${searchBF.bRcm}</td>
   			</tr>
   		</c:forEach>
     </table>
     <%@include file="../../footer.jsp" %>
</body>
</html>