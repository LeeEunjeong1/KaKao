<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kakao.VO.MemberVO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
    <link rel="stylesheet" href="css/index.css?ver = 1">
    <title>KaKao</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css?ver = 1" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div id="wrap">     
      <header>
      <%@ include file="header.jsp" %>
      </header>
           
    <div id="keyimage" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
    	<li data-target="#keyimage" data-slide-to="0" class="active"></li>
        <li data-target="#keyimage" data-slide-to="1"></li>
        <li data-target="#keyimage" data-slide-to="2"></li>
        <li data-target="#keyimage" data-slide-to="3"></li>
        <li data-target="#keyimage" data-slide-to="4"></li>
    </ol>
    
    <div class="carousel-inner" role="listbox">
    	<div class="item active">
        	<img src="images/slide1.gif">
            <div class="carousel-caption">
            	<h3>KaKao</h3>
                <p>웹서비스개발</p>
            </div>
        </div>
        <div class="item">
        	<img src="images/slide2.gif">
            <div class="carousel-caption">
            	<h3>KaKao</h3>
                <p>2조 자율프로젝트</p>
            </div>
        </div>
        <div class="item">
        	<img src="images/slide3.gif">
            <div class="carousel-caption">
            	<h3>KaKao</h3>
                <p>201633043 현유진</p>
            </div>
        </div>
        <div class="item">
        	<img src="images/slide4.gif">
            <div class="carousel-caption">
            	<h3>KaKao</h3>
            	<p>201733011 박한수</p>
            </div>
        </div>
        <div class="item">
        	<img src="images/slide5.gif">
            <div class="carousel-caption">
            	<h3>KaKao</h3>
                <p>201733025 이은정</p>
            </div>
        </div>
        <a class="left carousel-control" href="#keyimage" data-slide="prev">
       		<img src="images/left.png" class="preposition"> 
        </a>
        <a class="right carousel-control" href="#keyimage" data-slide="next">
        	<img src="images/right.png" class="preposition">
        </a>
    </div>
</div>
           <section>
            <article>
               
               <div id="newsTitle">
                   <p>카카오 뉴스</p>
               </div>
                <div id="news">
                    <div class="service">
                        <img src="images/service.gif" alt="service">
                        <p class="title">서비스</p>
                        <p class="string">카카오톡에서 장보면 이마트가 배송해준다!<br> 
                        새로운 장보기 습관, 카카오장보기.</p>
                    </div>
                    <div class="infor">
                        <img src="images/infor.gif" alt="service">
                        <p class="title">소식</p>
                        <p class="string">카카오, 2018년 1분기 실적 발표 2018년 1분기<br>
                        연결 매출 5,554억원, 영업이익 104억원을 기록</p>
                    </div>
                    <a href = "shopping.jsp">
                    <div class="shopp">
                        <img src="images/shopp.gif" alt="service">
                        <p class="title">쇼핑</p>
                        <p class="string">신제품 출시!<br>
                        당기면 쭉 늘어나는 카드 키체인 인형</p>
                    </div>
                    </a>
                </div>
            </article>
            <article>
                
                <div id="news2">
                    <div class="kakaoAI">
                        <img src="images/kakaoAi.gif" alt="kakaoAI">
                        <p class="title">Kakao AI</p>
                        <p class="string">"Hey Kakao" 한 마디를 통해 일상에 필요한 모든 것들을 <br> 연결해주는 당신과 가장 가까운 인공지능 Kakao i</p>
                    </div>
                     <a href = "Apply.jsp">
                    <div class="talent">
                        <img src="images/talent.gif" alt="talent">
                        <p class="title">인재채용</p>
                        <p class="string">문제를 새롭게 정의하고, 이를 풀어내기 위한 접근 방식을 집요하게 고민할 줄 아는 능력이 중요합니다. </p>
                    </div>
                    </a>
                </div>
            </article>
            <article>
                <div id="kakaoService">
                   <p>카카오 서비스</p>
                    <div class="daum">
                        <a href="#"><img src="images/daum.png" alt="daum"></a>
                        <p class="serviceName">Daum</p>
                        <p>검색포털 서비스</p>
                    </div>
                    <div class="kakaotalk">
                        <a href="#"><img src="images/kakaotalk.png" alt="kakaotalk"></a>
                        <p class="serviceName">카카오톡</p>
                        <p>사람과 세상<br>
                        그 이상의 연결</p>
                    </div>
                    <div class="kakaostroy">
                        <a href="#"><img src="images/kakaostory.png" alt="kakaostory"></a>
                        <p class="serviceName">카카오스토리</p>
                        <p>소소한 일상 속<br>
                        소소한 이야기</p>
                    </div>
                    <div class="kakaogame">
                        <a href="#"><img src="images/kakaogame.png" alt="kakaogame"></a>
                        <p class="serviceName">카카오게임</p>
                        <p>함께해요!<br>
                        카카오게임</p>
                    </div>
                    <div class="kakaoNavi">
                        <a href="#"><img src="images/kakaonavi.png" alt="kakaonavi"></a>
                        <p class="serviceName">카카오내비</p>
                        <p>내비게이션의<br>
                        새로운 진화</p>
                    </div>
                    <div class="kakaoFriends">
                        <a href="#"><img src="images/kakaofriends.png" alt="kakaofriends"></a>
                        <p class="serviceName">카카오프렌즈</p>
                        <p>일상속 즐거운!<br>
                        카카오프렌즈</p>
                    </div>
                    <div class="kakaoSubway">
                        <a href="#"><img src="images/kakaosub.png" alt="kakaosub"></a>
                        <p class="serviceName">카카오지하철</p>
                        <p>지하철타는<br>
                        똑똑한습관</p>
                    </div>
                    <div class="daumMail">
                        <a href="#"><img src="images/daummail.png" alt="daummail"></a>
                        <p class="serviceName">Daum메일</p>
                        <p>내 하루의 시작<br>
                        Daum 메일</p>
                    </div>
                    <div class="kakaoMusic">
                        <a href="#"><img src="images/kakaomusic.png" alt="kakaomusic"></a>
                        <p class="serviceName">카카오뮤직</p>
                        <p>친구들과 함께<br>
                        듣는 음악</p>
                    </div>
                </div>
            </article>
        </section>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </div>
</body>
</html>