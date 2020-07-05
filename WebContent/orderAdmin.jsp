<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.controller.HttpUtil"
    import = "com.kakao.service.OrderService"
    import = "com.kakao.VO.OrderVO"
    import = "java.util.ArrayList"%>
<% 

	if(session.getAttribute("admin") == null)
	{
		HttpUtil.forward(request, response,"index.jsp");
		return;
	}
%>
<%
	OrderService service = OrderService.serviceGetInstance();
	ArrayList<OrderVO> list = service.getOrderList();
	ArrayList<OrderVO> slist = (ArrayList<OrderVO>) request.getAttribute("slist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문목록</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/UserAdmin.css" type="text/css">
</head>
<body>
    <div id="wrap">
        <header>
            <%@ include file = "headerAdmin.jsp" %>
        </header>
        <section>
            <article>
              <p>주문목록</p>
               <form action="orderSearch.do" method="post">
                   <div id="search">
                        <input type="search" class="UserSearch" name ="name">
                        <input type="submit" value="검색" class="SearchButton">
                    </div>
                </form>
                    <div id="UserTable">
                        <table>
                            <tr>
                                <th>주문번호</th>
                                <th>회원번호</th>
                                <th>상품이름</th>
                                <th>상품개수</th>
                                <th>주문일자</th>
                            </tr>
                            <%
                            if(slist != null)
                            {
                            	for(OrderVO vo : slist)
                            	{%>
                            		<tr>
	                                <td><%=vo.getNum() %></td>
	                                <td><%=vo.getUserNum() %></td>
	                                <td><%=vo.getProductName() %></td>
	                                <td><%=vo.getCount() %></td>
	                                <td><%=vo.getDate() %></td>
                            		</tr>
                            	<%}
 							}
                            else
                            {
                            for(OrderVO vo : list)
                            {%>
                            <tr>
                                <td><%=vo.getNum() %></td>
                                <td><%=vo.getUserNum() %></td>
                                <td><%=vo.getProductName() %></td>
                                <td><%=vo.getCount() %></td>
                                <td><%=vo.getDate() %></td>
                            </tr>
                            	
                            <%}
                            }%>
                          
                        </table>
                    </div>
            </article>
        </section>
        <footer>
            <%@ include file = "footerAdmin.jsp" %>
        </footer>
    </div>
</body>
</html>