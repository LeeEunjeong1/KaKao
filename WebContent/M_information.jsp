<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.service.ProductService"
    import = "com.kakao.VO.ProductVO"
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
	int num = Integer.parseInt(request.getParameter("num"));
	ProductService service = ProductService.serviceGetInstance();
	ArrayList<ProductVO> list = service.getProductList();
	ProductVO product = null;
	for(ProductVO vo : list)
	{
		if(vo.getNum()==num)
		{
			product = vo;
			break;
		}
	}
	
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>인형/피규어</title>
    <link rel="icon" href="images/peach.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/category.css" type="text/css">
    <link rel="stylesheet" href="css/mInformation.css" type="text/css">
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/count.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
            <%@ include file = "headerShopping.jsp" %>
        </header>
        <section>
            <article>
               <div id="table_div">
                  <h4>* 카테고리(캐릭터이름) > 분류(ex.문구) > 상품명</h4>
                  <form action="buyProduct.do" method="post">
                   <table>
                    <tr>
                        <td rowspan="4" class="imgitem"><img src=<%=product.getImage()%>></td>
                        <th class="name">상품명</th>
                        <td class="name"><%=product.getName()%></td>
                    </tr>        
                    <tr class="won">
                        <th>판매가</th>
                        <td><%=product.getPrice()%></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td id="amount"><%=product.getPrice()%></td>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td class="size">
                            <div class="number">
                               <select id="b_option" name = "count">
                               <%
                               for(int x = 1 ; x < 11 ; x++)
                               {%>
                            	 <option value = "<%=x%>"><%=x%></option>  
                               <%}
                               %>
                               </select>
                            </div>
                        </td>
                    </tr>
                    
                </table>
                	<input type = "hidden" value = "<%=product.getPrice()%>" name = "price">
                	<input type = "hidden" value = "<%=product.getName()%>" name = "productName">
                	<input type = "hidden" value = "<%=product.getNum()%>" name = "productNum">
                    <input type="submit" value="구매하기" id="buy"> 
                </form>
               </div>
               <div id="product_content">
                   <p><%=product.getDetail()%></p>
               </div>
            </article>
        </section>
        <footer>
           <%@ include file = "footerShopping.jsp" %>
    </div>
</body>
</html>