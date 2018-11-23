<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2 style="margin-left: 100px; margin-top: 20px;">찾아주시개</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
         <th style="text-align: center;">NO</th>
          <th style="text-align: center;">개이름</th>
         <th style="text-align: center;">제목</th>
         <th style="text-align: center;">작성자</th>
        </tr>
        </thead>
        <tbody>
          <c:forEach var="f" items="${findList }">
           <tr>
            <td style="text-align: center;"><small>${f.NO }</small></td>
              <td style="text-align: center;"><small>${f.DOGNAME }</td>
              <td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/find/detail.do?no=${f.NO }"><small>${f.TITLE }</small></a></td>
            <td style="text-align: center;"><small>${f.NICK }</small></td>
           </tr>
           </c:forEach>
     </tbody>
</table>
<h2 style="margin-left: 100px; margin-top: 20px;">데려가시개(분양)</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
          <th style="text-align: center;">분양유무</th>
         <th style="text-align: center;">제목</th>
          <th style="text-align: center;">날짜</th>
        </tr>
        </thead>
        <tbody>
           <c:forEach var="p" items="${parcelList }">
              <tr>
               <c:choose>
                  <c:when test="${p.CHOICE == 1 }">
                     <td style="text-align: center;"><small>[분양중]</small></td>
                  </c:when>
                  <c:otherwise>
                     <td style="text-align: center;"><small>[분양완료]</small></td>
                  </c:otherwise>
               </c:choose>
                 <td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }"><small>${p.TITLE }</small></a></td>
                 <td style="text-align: center;"><small><fmt:formatDate value="${p.REGDATE }" /></small></td>
              </tr>
           </c:forEach>
      </tbody>
</table>
<h2 style="margin-left: 100px; margin-top: 20px;">같이가시개</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
         <th style="width:50px; text-align: center;">NO</th>
         <th style="width:80px; text-align: center;">지역구</th>
         <th style="width:150px; text-align: center;">제목</th>
         <th style="width:80px; text-align: center;">작성자</th>
          <th style="width:80px; text-align: center;">날짜</th>
          <th style="width:50px; text-align: center;">좋아요</th>
          <th style="width:50px; text-align: center;">조회수</th>
        </tr>
        </thead>
        <tbody>
           <c:forEach var="t" items="${togetherList }">
           <tr>
            <td style="text-align: center;"><small>${t.NO }</td>
            <td style="text-align: center;"><small>${t.AREA }</td>
              <td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/together/detail.do?no=${t.NO }"><small>${t.TITLE }</small></a></td>
              <td style="text-align: center;"><small>${t.NICK }</small></td>
            <td style="text-align: center;"><small><fmt:formatDate value="${t.DAY }" /></small></td>
            <td style="text-align: center;"><small>${t.GOOD }</small></td>
            <td style="text-align: center;"><small>${t.LOOKUP }</small></td>
           </tr>
           </c:forEach>
     </tbody>
</table>
<h2 style="margin-left: 100px; margin-top: 20px;">개동</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
         <th style="text-align: center;">NO</th>
         <th style="text-align: center;">제목</th>
         <th style="text-align: center;">작성자</th>
          <th style="text-align: center;">날짜</th>
          <th style="text-align: center;">조회수</th>
        </tr>
        </thead>
        <tbody>
          <c:forEach var="dt" items="${dtList }">
           <tr>
            <td style="text-align: center;"><small>${dt.NO }</small></td>
              <td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/dogTraining/detail.do?no=${dt.NO }"><small>${dt.TITLE }</small></a></td>
              <td style="text-align: center;"><small>${dt.DTID }</small></td>
            <td style="text-align: center;"><small>${dt.DAY }</small></td>
            <td style="text-align: center;"><small>${dt.LOOKUP }</small></td>
           </tr>
           </c:forEach>
     </tbody>
</table>
<h2 style="margin-left: 100px; margin-top: 20px;">도와주시개</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
        <thead>
        <tr>
         <th style="text-align: center;">NO</th>
         <th style="text-align: center;">제목</th>
         <th style="text-align: center;">작성자</th>
          <th style="text-align: center;">날짜</th>
        </tr>
        </thead>
        <tbody>
          <c:forEach var="hl" items="${helpList }">
           <tr>
            <td style="text-align: center;"><small>${hl.NO }</small></td>
              <td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/help/detail.do?no=${hl.NO }"><small>${hl.TITLE }</small></a></td>
              <td style="text-align: center;"><small>${hl.NICK }</small></td>
            <td style="text-align: center;"><small><fmt:formatDate value="${hl.REGDATE }" /></small></td>
           </tr>
           </c:forEach>
     </tbody>
</table>