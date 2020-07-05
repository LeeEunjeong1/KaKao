<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.VO.MemberVO"
    import = "com.kakao.service.MemberService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>카카오프렌즈</title>
    <link rel="icon" href="images/peach.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/shopping.css?ver=1.2" type="text/css">
</head>
<body>
    <div class="bg"></div>
        <header>
        <h1><a href="shopping.jsp"><img src="images/shoppinglogo.gif"></a></h1>
            <ul>
                <li><a href="index.jsp"><img src="images/logo.png">
                </a><span>>메인페이지</span></li>
                <%
                if(session.getAttribute("cUser") == null)
                {%>
                <li class="order">
                    <a href="#"><img src="images/blank.png"></a>
                </li>
                <li class="login">
                    <a href="login.jsp">
                        <img src="images/login.png">
                    </a>
                </li>
                <%}
                else
                {
                MemberVO cUser = (MemberVO) session.getAttribute("cUser");
                MemberService service = MemberService.serviceGetInstance();
                cUser = service.MemberUpdate(cUser.getNum());
                session.setAttribute("cUser",cUser);
                %>
                <li class="order">
                    <a href="myList.jsp"><img src="images/order.png"></a>
                </li>
                 <li class="login">
                    <a href="memberLoginProcess.do">
                        <img src="images/logout.png">
                    </a>
                </li>
                <%}
                %>
                <li class="choco"><a href="coin.jsp"><img src="images/coin.png"></a></li>
            </ul>
        </header>
        <nav>
            <ul>
               <!--메뉴-->
                <li>
                    <a href="#">라이언</a>
                    <div>
                        <h2>라이언</h2>
                        <p><img src="images/llion.png"></p>
                        <ul>
                            <li><a href="item.jsp?category=stationery&cha=llion">문구</a></li>
                            <li><a href="item.jsp?category=clothes&cha=llion">의류</a></li>
                            <li><a href="item.jsp?category=doll&cha=llion">인형/피규어</a></li>
                            <li><a href="item.jsp?category=goods&cha=llion">잡화</a></li>
                            <li><a href="item.jsp?category=jewelry&cha=llion">쥬얼리</a></li>
                        </ul>
                    </div>
                </li>
                <!--메뉴-->
                <li>
                    <a href="#">어피치</a>
                    <div>
                        <h2>어피치</h2>
                        <p><img src="images/apeach.png"></p>
                        <ul>
                            <li><a href="item.jsp?category=stationery&cha=apeach">문구</a></li>
                            <li><a href="item.jsp?category=clothes&cha=apeach">의류</a></li>
                            <li><a href="item.jsp?category=doll&cha=apeach">인형/피규어</a></li>
                            <li><a href="item.jsp?category=goods&cha=apeach">잡화</a></li>
                            <li><a href="item.jsp?category=jewelry&cha=apeach">쥬얼리</a></li>
                        </ul>
                    </div>
                </li>
                <!--메뉴-->
                <li>
                    <a href="#">네오</a>
                    <div>
                        <h2>네오</h2>
                        <p><img src="images/neo.png"></p>
                        <ul>
                            <li><a href="item.jsp?category=stationery&cha=neo">문구</a></li>
                            <li><a href="item.jsp?category=clothes&cha=neo">의류</a></li>
                            <li><a href="item.jsp?category=doll&cha=neo">인형/피규어</a></li>
                            <li><a href="item.jsp?category=goods&cha=neo">잡화</a></li>
                            <li><a href="item.jsp?category=jewelry&cha=neo">쥬얼리</a></li>
                        </ul>
                    </div>
                </li>
                <!--메뉴-->
                <li>
                    <a href="#">무지/콘</a>
                    <div>
                        <h2>무지/콘</h2>
                        <p><img src="images/muzi.png"></p>
                        <ul>
                            <li><a href="item.jsp?category=stationery&cha=muzi">문구</a></li>
                            <li><a href="item.jsp?category=clothes&cha=muzi">의류</a></li>
                            <li><a href="item.jsp?category=doll&cha=muzi">인형/피규어</a></li>
                            <li><a href="item.jsp?category=stationary&cha=muzi">잡화</a></li>
                            <li><a href="item.jsp?category=jewelry&cha=muzi">쥬얼리</a></li>
                        </ul>
                    </div>
                </li>
                <!--메뉴-->
                <li>
                    <a href="#">튜브</a>
                    <div>
                        <h2>튜브</h2>
                        <p><img src="images/tubo.png"></p>
                        <ul>
                           <li><a href="item.jsp?category=stationery&cha=tubo">문구</a></li>
                            <li><a href="item.jsp?category=clothes&cha=tubo">의류</a></li>
                            <li><a href="item.jsp?category=doll&cha=tubo">인형/피규어</a></li>
                            <li><a href="item.jsp?category=stationary&cha=tubo">잡화</a></li>
                            <li><a href="item.jsp?category=jewelry&cha=tubo">쥬얼리</a></li>
                        </ul>
                    </div>
                </li>
                <!--메뉴-->
                <li>
                    <a href="#">제이지</a>
                    <div>
                        <h2>제이지</h2>
                        <p><img src="images/jay_g.png"></p>
                        <ul>
                            <li><a href="item.jsp?category=stationery&cha=jay_g">문구</a></li>
                            <li><a href="item.jsp?category=clothes&cha=jay_g">의류</a></li>
                            <li><a href="item.jsp?category=doll&cha=jay_g">인형/피규어</a></li>
                            <li><a href="item.jsp?category=goods&cha=jay_g">잡화</a></li>
                            <li><a href="item.jsp?category=jewelry&cha=jay_g">쥬얼리</a></li>
                        </ul>
                    </div>
                </li>
                <!--메뉴-->
                <li>
                    <a href="#">프로도</a>
                    <div>
                        <h2>프로도</h2>
                        <p><img src="images/frodo.png"></p>
                        <ul>
                            <li><a href="item.jsp?category=stationery&cha=frodo">문구</a></li>
                            <li><a href="item.jsp?category=clothes&cha=frodo">의류</a></li>
                            <li><a href="item.jsp?category=doll&cha=frodo">인형/피규어</a></li>
                            <li><a href="item.jsp?category=goods&cha=frodo">잡화</a></li>
                            <li><a href="item.jsp?category=jewelry&cha=frodo">쥬얼리</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <section>
            <img src="images/bg_brand.jpg">
        </section>
        <footer>
            <ul>
                <li><a href="#">2조</a></li>
                <li><a href="#">201633043 현유진</a></li>
                <li><a href="#">201733011 박한수</a></li>
                <li><a href="#">201733025 이은정</a></li>
                <li><a href="#">사업자등록번호 : 354-86-00070</a></li>
                <li><a href="#">store@kakaofriends.com</a></li>
            </ul>
            <span>Copyright © Kakao Friends Corp.</span>
        </footer>
</body>
</html>