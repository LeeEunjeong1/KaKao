<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import = "com.kakao.VO.MemberVO"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <script src="js/jquery-3.2.1.min.js"></script>	
</head>
<body>
	<header>
	<a href="indexAdmin.jsp"><img src="images/logo.gif" alt="logo"></a>
	</header>
    <div id="wrap">        
        <form action="adminLoginProcess.do" name="newMemberForm" method="post" id="newMemberForm">
            <div id="login_wrap">
                <h3>관리자 로그인</h3>
                <div class="login">
                    <input type="text" name="member_id" id="member_id" placeholder="ID"> <br>
                    <input type="password" name="member_password" id="member_password" placeholder="password">
                    <input type="submit" value="" class="btn_login">                  
                </div>
            </div>
        </form>
        
        <footer>
           <%@ include file = "footer.jsp" %>
        </footer>      
    </div>	     
</body>
</html>