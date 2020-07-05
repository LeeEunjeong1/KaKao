<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
            <%@ include file="header.jsp" %>
        </header>
        
        <form action="memberLoginProcess.do" name="newMemberForm" method="post" id="newMemberForm">
            <div id="login_wrap">
                <h3>회원 로그인</h3><br>
                <div class="login">
                    <input type="text" name="member_id" id="member_id" placeholder="ID"> <br>
                    <input type="password" name="member_password" id="member_password" placeholder="password">
                    <input type="submit" value="" class="btn_login">
                    <p>
                  > 회원가입을 하셔야 서비스 이용이 가능합니다.
                  <a href="Join.html"><img src="images/btn_join.gif"></a> <br>
                  </p>
                  <p>
                    > 관리자페이지로 이동하시려면 로그인하세요.
                  <a href = "LoginAdmin.jsp" class="adminLogin">관리자 로그인></a>
                  </p>  
                </div>
            </div>
        </form>
        
        <footer>
            <%@ include file = "footer.jsp" %>
        </footer>      
    </div>	     
</body>
</html>