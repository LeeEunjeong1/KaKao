<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.VO.OrderVO"
    import = "com.kakao.VO.MemberVO"
    import = "com.kakao.service.OrderService"
    import = "com.kakao.service.MemberService"
    import = "java.util.ArrayList"
    import = "com.kakao.controller.HttpUtil"%>
<%
if(session.getAttribute("cUser") == null)
{
	HttpUtil.forward(request, response,"index.jsp");
	return;
}
%>
<%
	MemberVO cUser = (MemberVO) session.getAttribute("cUser");
	MemberService service_1 = MemberService.serviceGetInstance();
	cUser = service_1.MemberUpdate(cUser.getNum());
	session.setAttribute("cUser",cUser);
	OrderService service = OrderService.serviceGetInstance();
	ArrayList<OrderVO> list = service.getOrderList(cUser.getNum());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문목록</title>
    <link rel="icon" href="images/peach.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/category.css" type="text/css">
    <link rel="stylesheet" href="css/myList.css" type="text/css">
</head>
<body>
    <div id="wrap">
        <header>
            <%@ include file = "headerShopping.jsp" %>
        </header>
        <section>
          <h3>주문내역조회</h3>
           <form action="" method="post">
            <table>
                <tr>                   
                    <td class="color">[주문번호]</td>
                    <td class="color">[회원번호]</td>
                    <td class="color">[상품번호]</td>
                    <td class="color">[상품개수]</td>
                    <td class="color">[주문일자]</td>
                </tr>
                <%
                for(OrderVO vo : list)
                {%> 
                	<tr>               	
                    <td><%=vo.getNum() %></td>
                    <td><%=vo.getUserNum()%></td>
                    <td><%=vo.getProductName() %></td>
                    <td><%=vo.getCount() %></td>
                    <td><%=vo.getDate() %></td>
                    </tr>
                <%}
                %>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
                <a href="shopping.jsp"><input type="button" value="목록" class="back"></a>
            </form>
        </section>
        <footer>
           <%@ include file = "footerShopping.jsp" %>
        </footer>
    </div>
</body>
</html>