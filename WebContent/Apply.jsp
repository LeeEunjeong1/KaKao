<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kakao.controller.HttpUtil" %>
<!DOCTYPE html>
<html lang="ko">
<head>
     <meta http-equiv="Content-Type" http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>입사지원</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/apply.css" type="text/css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
            $(function(){
                $('.step1').hover(
                function(){
                    $(this).animate({top: 30}, 500);
                    },
                function(){
                    $(this).animate({top: 66}, 500);
                });
                /*$('.step2').hover(
                function(){
                    $(this).animate({top: 30}, 500);
                    },
                function(){
                    $(this).animate({top: 0}, 500);

                });*/
                $('.step3').hover(
                function(){
                    $(this).animate({top: 30}, 500);
                    },
                function(){
                    $(this).animate({top: 90}, 500);

                });
                /*$('.step4').hover(
                function(){
                    $(this).animate({right: 30}, 500);
                    },
                function(){
                    $(this).animate({right: 70}, 500);

                });*/
            });
        </script>
</head>
<%
	if(session.getAttribute("cUser") == null)
	{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('로그인이 필요합니디.');");
		out.println("location='login.jsp';");
		out.println("</script>");
	}
%>
<body>
    <div id="wrap">
        <header>
            <%@ include file="header.jsp" %>
        </header>
        <section>
            <article>
               <div id="keyimage">
                   <img src="images/applykey.gif">
               </div>
            </article>
            <article>
                <div id="applyProcess">
                   <h3>영입절차</h3>
                    <div class="step1">01>&nbsp;서류전형</div>
                    <div class="step2">02>&nbsp;1차 인터뷰</div>
                    <div class="step3">03>&nbsp;2차 인터뷰</div>
                    <div class="step4">04>&nbsp;입사확정</div>
                </div>
            </article>
            <article>
                <div id="applyMenu">
                    <h3>카카오크루가 되어주세요.</h3>
                    <a href="ApplyNotice.jsp">
                    <div class="applyNotice">
                       <img src="images/applynotice.PNG">
                        <p>채용공고</p>
                        <p>현재 진행중인 공고</p>
                    </div>
                    </a>
                    <a href="ApplyWrite.jsp">
                    <div class="writeApply">
                       <img src="images/apply.PNG">
                        <p>지원서 작성하기</p>
                        <p>원하는 분야의 지원서 작성</p>
                    </div>
                    </a>
                    <a href="MyApply.jsp">
                    <div class="myApple">
                       <img src="images/myapply.PNG">
                        <p>나의 지원서</p>
                        <p>작성한 지원서 관리</p>
                    </div>
                    </a>
                </div>
            </article>
        </section>
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>
    </div>
</body>
</html>