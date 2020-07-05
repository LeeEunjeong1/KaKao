<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.controller.HttpUtil"%>
    
<% 
	if(session.getAttribute("admin") == null)
	{
		HttpUtil.forward(request, response,"index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>KaKao_Admin</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/onepage.css" type="text/css">
    <link href="css/jquery.fullPage.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/jquery.fullPage.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#fullpage').fullpage({
                scrollBar: true,
                scrollingSpeed: 1000,
                loopBottom: true,
                loopTop: true
            });
        });
    </script>
    <style>
        
    </style>
</head>
<body>
    <div id="wrap">
        <div class="fixtop">
    	<header>
        	<h1><a href="index.jsp"><img src="images/footerlogo2.gif"></a></h1>
        </header>
        <nav style="center">
        	<a href="userAdmin.jsp" class="nav-btn">회원관리</a>
        	<a href="ApplyAdmin.jsp" class="nav-btn">지원서관리</a>
            <a href="ProductAdmin.jsp" class="nav-btn">상품관리</a> 
        	<a href="orderAdmin.jsp" class="nav-btn">주문목록</a>
        	<a href="FieldAdmin.jsp" class="nav-btn">필드관리</a>
        </nav>
    </div>

    <div id="fullpage">
        <div class="section page1" data-anchor="1">
            <div class="look">
                <div class="mask">
                    <h2>회원관리</h2>
                    <p>회원번호 / 아이디 / 비밀번호 / 이메일/ 이름 / 주소 / 보유초코 / 성별 / 핸드폰번호 / 생일 을 관리하는 페이지 입니다.</p>
                    <a href="userAdmin.jsp" class="info">▷회원관리로이동</a>
                </div>
            </div>
        </div>
        <div class="section page2" data-anchor="2">
            <div class="look">
                <div class="mask">
                    <h2>지원서관리</h2>
                    <p>회원 아이디 조회 및 회원이 쓴 지원서의 제목 / 분야 / 내용을 관리하는 페이지 입니다.</p>
                    <a href="ApplyAdmin.jsp" class="info">▷지원서관리로이동</a>
                </div>
            </div>
        </div>
        <div class="section page3" data-anchor="3">
            <div class="look">
                <div class="mask">
                   <h2>상품관리</h2>
                    <p>카카오프렌즈 상품 업데이트 등 쇼핑몰관리를 할 수 있는 페이지입니다.</p>
                    <a href="ProductAdmin.jsp" class="info">▷상품관리로이동</a>
                </div>
            </div>
        </div>
        <div class="section page4" data-anchor="4">
            <div class="look">
                <div class="mask">
                    <h2>주문목록</h2>
                    <p>회원이 주문한 목록을 조회할 수 있습니다.</p>
                    <a href="orderAdmin.jsp" class="info">▷소식관리로이동</a>
                </div>
            </div>
        </div>
        <div class="section page5" data-anchor="5">
            <div class="look">
                <div class="mask">
                    <h2>필드관리</h2>
                    <p>지원서 필드를 관리할 수 있는 페이지 입니다.</p>
                    <a href="FieldAdmin.jsp" class="info">▷필드관리로이동</a>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <%@ include file = "footerAdmin.jsp" %>
    </footer>
    </div>
</body>
</html>