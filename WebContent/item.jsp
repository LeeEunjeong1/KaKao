<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.service.ProductService"
    import = "com.kakao.VO.ProductVO"
    import = "java.util.ArrayList"%>
<%
	if(session.getAttribute("cUser") == null)
	{
	   out.println("<script type=\"text/javascript\">");
	   out.println("alert('로그인이 필요합니디.');");
	   out.println("location='login.jsp';");
	   out.println("</script>");
	   return;
	}
	String category = request.getParameter("category");
	System.out.println("category : " + category);
	String cha = request.getParameter("cha");
	System.out.println("cha : " + cha);
	ProductService service = ProductService.serviceGetInstance();
	ArrayList<ProductVO> list = service.getProductList(category, cha);
	ArrayList<ProductVO> orderList = service.getProductListOrder(category, cha);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=category%></title>
    <link rel="icon" href="images/peach.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/category.css" type="text/css">
</head>
<body>
    <div id="wrap">
        <header>
             <%@ include file="headerShopping.jsp" %>
        </header>
        <section>
            <article>
                <div class = "keyimage">
                <img src="images/<%=category%>.gif">
                </div>
            </article>
            <article class="gnb">
                <ul>
                    <li><a href="item.jsp?category=stationery&cha=<%=cha%>">문구</a></li>
                    <li><a href="item.jsp?category=clothes&cha=<%=cha%>">의류</a></li>
                    <li><a href="item.jsp?category=doll&cha=<%=cha%>">인형/피규어</a></li>
                    <li><a href="item.jsp?category=goods&cha=<%=cha%>">잡화</a></li>
                    <li><a href="item.jsp?category=jewelry&cha=<%=cha%>">쥬얼리</a></li>
                </ul>
            </article>
            <article>
               <div class="popular">
                <h3>BEST5</h3>
                <div class="best">
                <ul>
                <%  
                	if(orderList.size() < 5 && orderList.size() > 0)
                	{
                		for(int x = 0 ; x < orderList.size() ; x++)
                		{
                			ProductVO vo = orderList.get(x);%>
                			<li><a href="M_information.jsp?num=<%=vo.getNum()%>"><img src=<%=vo.getImage()%>></a></li>
                		<%}
                	}
                	else if(orderList.size() >= 5)
                	{
                	for(int x = 0; x < 5; x++)
                	{
                		ProductVO vo = orderList.get(x);
                	%>
                		<li><a href="M_information.jsp?num=<%=vo.getNum()%>"><img src=<%=vo.getImage()%>></a></li>
                	<%}
                	}
                %>
                </ul>
                </div>
                </div>
            </article>
            <article>
                <div id="product">
                <%
                	for(ProductVO vo : list)
                	{%>                	
                	<div class="viewFirst">
                		<img src = <%=vo.getImage()%> width="100%">
                        <div class="mask">
                           <div class="data">
                            <p class="name"><%=vo.getName()%></p>
                            <p class="price"><%=vo.getPrice()%>원</p>
                             <a href="M_information.jsp?num=<%=vo.getNum()%>" class="info">자세히</a>
                           </div>
                        </div>
                    </div>
                	<%}
                %>                 
                </div>
            </article>
        </section>
        <footer>
            <%@ include file="footerShopping.jsp" %>
        </footer>
    </div>
</body>
</html>