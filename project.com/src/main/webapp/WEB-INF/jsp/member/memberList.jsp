<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sy"		uri="tlds/pagination" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javaScript" language="javascript" defer="defer">
function link_page(pageNo){
	var b = document.member;
	
	b.pageIndex.value = pageNo;
	b.action = "<c:url value='/mList.do'/>";
   	b.submit();
}

function fn_action(value) {
	if(value == 'W') {
		location.href ="/mRegister.do";
	}
}

function link_search() {
	var b = document.member;
	b.pageIndex.value = 1;
	b.action = "<c:url value='/mList.do'/>";
   	b.submit();
}
</script>
</head>
<body>
<div id="content">
	<div id="content_pop">
		<form id="pageVO" name="member" method="post">
			<input type="hidden" name="selID"/>
			<!-- 타이틀 -->
		    <div id="title">
				<ul>
	    			<li>
	    				<img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/> Member List
	                </li>
	    		</ul>
			</div>
			<!-- 검색 -->
			<div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;">choose</label>
        				<select name="searchCondition" id="selectBox">
        					<option value="id" label="id" <c:if test="${pageVO.searchCondition eq 'id'}">selected</c:if>/>
        					<option value="name" label="name"  <c:if test="${pageVO.searchCondition eq 'name'}">selected</c:if>/>
        				</select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;">keyword</label>
                        <input class="txt" name="searchKeyword" type="text" value="${pageVO.searchKeyword}"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:link_search()">search</a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
			<!--  테이블 -->
			<div id="table">
				<table width="100%" cellpadding="0" cellspacing="0" >
					<tr>
						<th align="center">번호</th>
						<th align="center">ID</th>
						<th align="center">이름</th>
						<th align="center">성별</th>
						<th align="center">생일(나이)</th>
						<th align="center">등록일</th>
					</tr>
				
					<c:forEach var="list" items="${member}" varStatus="status">
						<tr>
							<td align="center" class="listtd"><c:out value="${list.rn}"/></td>
							<td align="left" class="listtd">
								<a href="javascript:select_board('<c:out value="${list.id}"/>')">
									<c:out value="${list.id}"/>
								</a>
							</td>
									
							<td align="center" class="listtd"><c:out value="${list.name}"/></td>
							<td align="center" class="listtd">
								<c:out value="${list.gender}"/>
							</td>
							<td align="center" class="listtd"><c:out value="${list.birth} (${list.age})" /></td>
			
							<td align="center" class="listtd"><c:out value="${list.rdate}"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- /List -->
			<div id="paging">
	       		<sy:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="link_page" />
	       		<input type="hidden" name="pageIndex" />
	       	</div>
			<div id="sysbtn">
				<ul>
					<li>
						<span class="btn_blue_l">
							<a href="javascript:fn_action('W');">Write</a>
		                	<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
						</span>
					</li>
				</ul>
			</div>
		</form>
	</div>
</div>
</body>
</html>