<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import = "com.kakao.VO.MemberVO"%>
<%
	MemberVO cUser = null;
	if(session.getAttribute("cUser") == null)
	{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('로그인이 필요합니디.');");
		out.println("location='login.jsp';");
		out.println("</script>");
		return;
	}
	else
	{
		cUser = (MemberVO) session.getAttribute("cUser");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>초코충전</title>
    <link rel="icon" href="images/peach.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/category.css" type="text/css">
    <link rel="stylesheet" href="css/coin.css" type="text/css">
</head>
<body>
    <div id="wrap">
        <header>
            <%@ include file = "headerShopping.jsp"%>
        </header>
        <section>
        <form action="registerCho.do"method="post" id="newMemberForm">
            <div id="coin_wrap">
                <h3>초코충전</h3>
                <div class="coin">
                	<input type ="hidden" name = "num" value = "<%=cUser.getNum()%>">
                    <input type="text" name="coin" id="coin" placeholder="충전할 초코 수"> <br>
                    <input type="submit" value="초코등록" class="insert">
                    <p>> 초코 충전하시고 귀여운 카카오프렌즈를 만나보세요!</p>
                    <img src="images/shoppinglogo.jpg" class="loginImg">
                </div>
            </div>
        </form>
        </section>
        <footer>
           <div class="footer_p">
                <p>카카오프렌즈 사업자등록번호 : 354-86-00070</p>
                <p>통신판매업 신고번호 : 2015-서울서초-1533</p>
                <p>대표이사 : 권승조</p>
                <p>주소 : 서울특별시 강남구 테헤란로 521 파르나스타워, 27층</p>
                <p>고객센터 : 1577-6263 / 평일 10시 ~ 18시| store@kakaofriends.com</p>
                <p>Copyright © Kakao Friends Corp.</p>
            </div>
            <p class="friends">
                <img src="images/footerkakao.png">
            </p>
        </footer>  
    </div>	     
</body>
</html>