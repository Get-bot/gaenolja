<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2 style="margin-left: 100px; margin-top: 20px;">데려가시개(분양)</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
          <th style="text-align: center;"><small>분양유무</small></th>
         <th style="text-align: center;"><small>댓글</small></th>
         <th style="text-align: center;"><small>제목</small></th>
         <th style="text-align: center;"><small>작성자</small></th>
          <th style="text-align: center;"><small>댓글작성 날짜</small></th>
        </tr>
        </thead>
        <tbody>
           <c:forEach var="p" items="${pacmt }">
              <tr>
               <c:choose>
                  <c:when test="${p.CHOICE == 1 }">
                     <td style="text-align: center;"><small>[분양중]</small></td>
                  </c:when>
                  <c:otherwise>
                     <td style="text-align: center;"><small>[분양완료]</small></td>
                  </c:otherwise>
               </c:choose>
               <td style="text-align: center;"><small>${p.COMMENTS }</small></td>
                 <td style="text-align: center;"><small><a href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }">${p.TITLE }</a></small></td>
               <td style="text-align: center;"><small>${p.TALKER }</small></td>
                 <td style="text-align: center;"><small><fmt:formatDate value="${p.REGDAY }" /></small></td>
              </tr>
           </c:forEach>
      </tbody>
</table>
<h2 style="margin-left: 100px; margin-top: 20px;">같이가시개</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
         <th style="width:80px; text-align: center;"><small>지역구</small></th>
         <th style="width:50px; text-align: center;"><small>댓글내용</small></th>
         <th style="width:150px; text-align: center;"><small>제목</small></th>
         <th style="width:80px; text-align: center;"><small>작성자</small></th>
          <th style="width:80px; text-align: center;"><small>댓글작성 날짜</small></th>
        </tr>
        </thead>
        <tbody>
           <c:forEach var="tc" items="${tocmt }">
           <tr>
            <td style="text-align: center;"><small>${tc.AREA }</small></td>
            <td style="text-align: center;"><small>${tc.MENT }</small></td>
              <td style="text-align: center;"><small><a href="${pageContext.servletContext.contextPath }/together/detail.do?no=${tc.NO }">${tc.TITLE }</a></small></td>
              <td style="text-align: center;"><small>${tc.COMMNETER }</small></td>
            <td style="text-align: center;"><small><fmt:formatDate value="${tc.LEFTDATE }" /></small></td>
           </tr>
           </c:forEach>
     </tbody>
</table>
<h2 style="margin-left: 100px; margin-top: 20px;">개동</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
         <th style="width:80px; text-align: center;"><small>NO</small></th>
         <th style="width:50px; text-align: center;"><small>댓글내용</small></th>
         <th style="width:150px; text-align: center;"><small>게시글 제목</small></th>
         <th style="width:80px; text-align: center;"><small>작성자</small></th>
          <th style="width:80px; text-align: center;"><small>댓글작성 날짜</small></th>
        </tr>
        </thead>
        <tbody>
           <c:forEach var="dc" items="${dtcmt }">
           <tr>
            <td style="text-align: center;"><small>${dc.NUM }</small></td>
            <td style="text-align: center;"><small>${dc.MSG }</small></td>
              <td style="text-align: center;"><small><a href="${pageContext.servletContext.contextPath }/dogTraining/detail.do?no=${dc.NO }">${dc.TITLE }</a></small></td>
              <td style="text-align: center;"><small>${dc.ID }</small></td>
            <td style="text-align: center;"><small>${dc.CDATE }"</small></td>
           </tr>
           </c:forEach>
     </tbody>
</table>
<h2 style="margin-left: 100px; margin-top: 20px;">도와주시개</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
         <th style="width:80px; text-align: center;"><small>NO</small></th>
         <th style="width:50px; text-align: center;"><small>댓글내용</small></th>
         <th style="width:150px; text-align: center;"><small>게시글 제목</small></th>
         <th style="width:80px; text-align: center;"><small>작성자</small></th>
          <th style="width:80px; text-align: center;"><small>댓글작성 날짜</small></th>
        </tr>
        </thead>
        <tbody>
           <c:forEach var="hc" items="${hlcmt }">
           <tr>
            <td style="text-align: center;"><small>${hc.HNO }</small></td>
            <td style="text-align: center;"><small>${hc.REPLY }</small></td>
              <td style="text-align: center;"><small><a href="${pageContext.servletContext.contextPath }/help/detail.do?no=${hc.NO }">${hc.TITLE }</a></small></td>
              <td style="text-align: center;"><small>${hc.NICK }</small></td>
            <td style="text-align: center;"><small><fmt:formatDate value="${hc.REGDATE }" /></small></td>
           </tr>
           </c:forEach>
     </tbody>
</table>