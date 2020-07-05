<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kakao.VO.MemberVO"
		 import = "com.kakao.service.MemberService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
    <title>KaKao</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css?ver=1" type="text/css">
</head>
<body>
        <header>
            <a href="index.jsp"><img src="images/logo.gif" alt="logo"></a>
            <div class="gnb">
                <span><a href="index.jsp">Hello Kakao</a><a href="#">Korea</a></span>
                <% if(session.getAttribute("cUser") == null){%>
                	<span><a href="login.jsp">Login</a><a href="join.jsp">Join</a></span>
                	<%}else{ %>
                	<%
                	MemberVO cUser = (MemberVO) session.getAttribute("cUser");
                	MemberService service_1 = MemberService.serviceGetInstance();
                	cUser = service_1.MemberUpdate(cUser.getNum());
                	session.setAttribute("cUser",cUser);
                	%>
                	<span><%=cUser.getId() %>님 환영합니다. <a href="userUpdate.jsp">내 정보 보기</a><a href="memberLoginProcess.do">Logout</a></span>
                	<%} %>
            </div> 
            <nav>
                <ul>
                    <li><a href="#">기업소개</a></li>
                    <li><a href="#">기업뉴스</a></li>
                    <li><a href="shopping.jsp">쇼핑몰</a></li>
                    <li><a href="Apply.jsp">입사지원</a></li>
                </ul>
            </nav>
        </header>
        
        

</body>
</html>